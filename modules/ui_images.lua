-- Image drawer UI module
local ui_images = {}

local imgui = require('imgui')
local ffi = require('ffi')
local bit = require('bit')

-- ImGui Condition Flags
ImGuiCond_FirstUseEver = 2
ImGuiCond_Always = 1

-- ImGui Color IDs
ImGuiCol_Button = 21

-- Track last zone to reset auto-calibration message
ui_images.last_zone_id = nil

-- Track last step for texture cleanup
ui_images.last_step_key = nil

-- Track current map index per step (for pagination)
ui_images.current_map_indices = {}

-- Track last zone/floor for auto-switching maps
ui_images.last_auto_switch_zone = nil
ui_images.last_auto_switch_floor = nil

-- Renders the images drawer window attached to the main window
function ui_images.render(lastMainX, lastMainY, lastMainW, lastMainH, currentTopCategory, currentSubfile, current_mission,
                          quest_state, quest_data, utils, image_loader, map_renderer, player_module, zone_data, map_db, floor_mappings, ui_main_settings)

    -- Reset auto-cal message when zone changes
    if ui_images.last_zone_id ~= player_module.zoneId then
        ui_images.auto_cal_msg_shown = false
        ui_images.last_zone_id = player_module.zoneId
    end

    -- Detached draggable window - use saved position or center on first launch
    if ui_main_settings.map_pos_x and ui_main_settings.map_pos_y then
        -- Use saved position
        imgui.SetNextWindowPos({ui_main_settings.map_pos_x, ui_main_settings.map_pos_y}, ImGuiCond_FirstUseEver)
    else
        -- Center on screen on first launch
        imgui.SetNextWindowPos({100, 100}, ImGuiCond_FirstUseEver)
    end

    -- Scale window size based on map_scale setting
    -- Base: 512x512 maps + padding for pagination buttons
    local map_scale = ui_main_settings and ui_main_settings.map_scale or 1.0
    local base_map_size = 512
    local width_padding = 20
    local height_padding = 80  -- Extra space for pagination buttons
    local window_width = (base_map_size * map_scale) + width_padding
    local window_height = (base_map_size * map_scale) + height_padding
    imgui.SetNextWindowSize({window_width, window_height}, ImGuiCond_Always)

    -- Window flags: Draggable (removed NoMove), no title bar, no resize
    local drawerFlags = bit.bor(
        ImGuiWindowFlags_NoTitleBar, ImGuiWindowFlags_NoResize,
        ImGuiWindowFlags_NoCollapse, ImGuiWindowFlags_NoBackground,
        ImGuiWindowFlags_AlwaysAutoResize
    )

    if imgui.Begin("##ImagesDrawer", true, drawerFlags) then
        -- Apply font scaling for the entire window (including buttons)
        imgui.SetWindowFontScale(map_scale)

        local step_idx = quest_state.getCurrentStep(currentTopCategory, currentSubfile, current_mission, quest_data)
        local step_imgs = utils.get_images_for_step(currentTopCategory, currentSubfile, current_mission, step_idx, quest_data)

        -- Get or initialize current map index for this step
        local step_key = string.format("%s|%s|%s|%d",
            currentTopCategory or "", currentSubfile or "", current_mission or "", step_idx or 0)
        local is_new_step = not ui_images.current_map_indices[step_key]
        if is_new_step then
            ui_images.current_map_indices[step_key] = 1
        end
        local current_map_index = ui_images.current_map_indices[step_key]

        -- Validate and clamp current_map_index
        local total_maps = #step_imgs
        if total_maps == 0 then
            imgui.Text("No maps available for this step")
            imgui.End()
            return
        end
        if current_map_index < 1 then current_map_index = 1 end
        if current_map_index > total_maps then current_map_index = total_maps end
        ui_images.current_map_indices[step_key] = current_map_index

        -- Pre-calculate zone occurrence counts to detect multi-floor zones
        local zone_occurrence_counts = {}
        for _, img in ipairs(step_imgs) do
            if img.zone_name then
                zone_occurrence_counts[img.zone_name] = (zone_occurrence_counts[img.zone_name] or 0) + 1
            end
        end

        -- Auto-switch to player's current zone/floor
        local current_player_floor = player_module.getFloorId(floor_mappings)
        if is_new_step or
           ui_images.last_auto_switch_zone ~= player_module.zoneId or
           ui_images.last_auto_switch_floor ~= current_player_floor then
            -- Zone or floor changed, find matching map
            ui_images.last_auto_switch_zone = player_module.zoneId
            ui_images.last_auto_switch_floor = current_player_floor

            for idx, img in ipairs(step_imgs) do
                local img_zone_id = img.zone_name and zone_data[img.zone_name]
                if img_zone_id == player_module.zoneId then
                    -- Found matching zone, now check floor if multi-floor
                    -- floor_id in mission data is the RAW floor ID (same as DAT files use)
                    -- Convert to logical floor number using floor_mappings if available
                    local raw_floor_id = img.floor_id or 1
                    local img_floor = raw_floor_id
                    if img_zone_id and floor_mappings and floor_mappings[img_zone_id] then
                        img_floor = floor_mappings[img_zone_id][raw_floor_id] or raw_floor_id
                    end

                    -- Check if this zone has multiple floors
                    local this_zone_config = map_db[img.zone_name]
                    local zone_img_count = zone_occurrence_counts[img.zone_name] or 1
                    local is_multi_floor = (this_zone_config and this_zone_config[1] ~= nil) or
                                          (floor_mappings and img_zone_id and floor_mappings[img_zone_id] ~= nil) or
                                          (zone_img_count > 1)  -- Multiple images for same zone in this step

                    if is_multi_floor then
                        -- Multi-floor: match specific floor
                        if img_floor == current_player_floor then
                            ui_images.current_map_indices[step_key] = idx
                            current_map_index = idx
                            print(string.format("\30\106[QH]\30\01 Auto-switched to map %d (floor %d)", idx, img_floor))
                            break
                        end
                    else
                        -- Single-floor: just match zone
                        ui_images.current_map_indices[step_key] = idx
                        current_map_index = idx
                        print(string.format("\30\106[QH]\30\01 Auto-switched to map %d", idx))
                        break
                    end
                end
            end
        end

        -- Track current step and cleanup old textures when step changes
        local current_step_key = string.format("%s|%s|%s|%d",
            currentTopCategory or "", currentSubfile or "", current_mission or "", step_idx or 0)

        if ui_images.last_step_key ~= current_step_key then
            -- Step changed, cleanup old textures
            local keep_files = {}
            local keep_dat_list = {}

            for _, img_data in ipairs(step_imgs) do
                -- Keep PNG files
                if img_data.file then
                    table.insert(keep_files, img_data.file)
                end

                -- Auto-enable DAT loading if zone_name is present (unless explicitly disabled)
                local use_dat = img_data.use_dat_map
                if use_dat == nil then
                    use_dat = (img_data.zone_name ~= nil)
                end

                -- Keep DAT-loaded textures
                if use_dat then
                    local zone_id = img_data.zone_id
                    if not zone_id and img_data.zone_name and zone_data[img_data.zone_name] then
                        zone_id = zone_data[img_data.zone_name]
                    end

                    if zone_id then
                        table.insert(keep_dat_list, {
                            zone_id = zone_id,
                            floor_id = img_data.floor_id or 0
                        })
                    end
                end
            end

            local unloaded_png, unloaded_dat = image_loader.CleanupUnused(keep_files, keep_dat_list)
            if unloaded_png > 0 or unloaded_dat > 0 then
                print(string.format("\30\106[QH]\30\01 Cleaned up %d PNG + %d DAT texture(s), keeping %d PNG + %d DAT for current step",
                    unloaded_png, unloaded_dat, #keep_files, #keep_dat_list))
            end

            ui_images.last_step_key = current_step_key
        end

        -- Render pagination buttons
        local idx_digits = #tostring(total_maps)
        imgui.Text(string.format("Map %" .. idx_digits .. "d/%d:", current_map_index, total_maps))
        imgui.SameLine()

        -- Previous button
        if imgui.Button("<##PrevMap") then
            if current_map_index > 1 then
                ui_images.current_map_indices[step_key] = current_map_index - 1
            end
        end
        imgui.SameLine()

        -- Scale-aware button sizing: map window is (512*map_scale)+20 px wide,
        -- so fewer/smaller buttons fit at lower scales (slider range 0.25–1.0)
        local MAX_VISIBLE_BTNS = math.max(4, math.floor(10 * map_scale))
        local btn_w = math.max(20, math.floor((total_maps >= 100 and 36 or 28) * map_scale))

        local btn_start, btn_end
        if total_maps <= MAX_VISIBLE_BTNS then
            btn_start, btn_end = 1, total_maps
        else
            local half = math.floor(MAX_VISIBLE_BTNS / 2)
            btn_start = math.max(1, current_map_index - half)
            btn_end   = math.min(total_maps, btn_start + MAX_VISIBLE_BTNS - 1)
            if btn_end == total_maps then
                btn_start = math.max(1, btn_end - MAX_VISIBLE_BTNS + 1)
            end
        end

        for i = btn_start, btn_end do
            if i == current_map_index then
                imgui.PushStyleColor(ImGuiCol_Button, {0.2, 0.6, 0.2, 1.0})
                imgui.Button(tostring(i) .. "##MapBtn" .. i, {btn_w, 0})
                imgui.PopStyleColor()
            else
                if imgui.Button(tostring(i) .. "##MapBtn" .. i, {btn_w, 0}) then
                    ui_images.current_map_indices[step_key] = i
                end
            end
            if i < btn_end then
                imgui.SameLine()
            end
        end
        imgui.SameLine()

        -- Next button
        if imgui.Button(">##NextMap") then
            if current_map_index < total_maps then
                ui_images.current_map_indices[step_key] = current_map_index + 1
            end
        end

        imgui.Separator()

        -- Render only the current map
        local img_data = step_imgs[current_map_index]
        if img_data then
            -- Try to get zone_id from zone_name if not explicitly provided
            local zone_id = img_data.zone_id
            if not zone_id and img_data.zone_name and zone_data[img_data.zone_name] then
                zone_id = zone_data[img_data.zone_name]
            end

            -- Get floor_id (default to 0 if not specified)
            local floor_id = img_data.floor_id or 0

            -- Auto-enable DAT loading if zone_name is present (unless explicitly disabled)
            -- This makes DAT loading the default when zone_name is specified
            local use_dat = img_data.use_dat_map
            if use_dat == nil then
                use_dat = (img_data.zone_name ~= nil)  -- Default to true if zone_name exists
            end

            -- Load texture (DAT first if enabled, fallback to PNG)
            local tex_ptr = image_loader.GetTexture(
                img_data.file,           -- PNG filename (fallback)
                use_dat and zone_id or nil,  -- zone_id (only if use_dat enabled)
                floor_id,                -- floor_id
                not use_dat              -- force_png if use_dat is false
            )
            if tex_ptr then
                local tex_id = tonumber(ffi.cast('uintptr_t', tex_ptr))

                -- Apply map scale setting
                local w = (img_data.width or 200) * map_scale
                local h = (img_data.height or 100) * map_scale

                -- Get position BEFORE rendering image
                local imageX, imageY = imgui.GetCursorScreenPos()

                -- Apply opacity setting to map images
                local map_opacity = ui_main_settings and ui_main_settings.map_opacity or 1.0

                -- Render the image with opacity
                imgui.Image(tex_id, {w, h}, {0, 0}, {1, 1}, {1, 1, 1, map_opacity})

                -- Now draw overlays using the saved position
                local cal = img_data.map_calibration

                -- Determine floor number for this image
                -- floor_id in mission data is the RAW floor ID (same as DAT files use)
                -- Convert to logical floor number using floor_mappings if available
                local raw_floor_id = img_data.floor_id or 1
                local this_img_floor = raw_floor_id  -- Default: assume raw = logical

                -- Apply floor mapping if one exists for this zone
                local img_zone_id = img_data.zone_name and zone_data[img_data.zone_name]
                if img_zone_id and floor_mappings and floor_mappings[img_zone_id] then
                    this_img_floor = floor_mappings[img_zone_id][raw_floor_id] or raw_floor_id
                end

                if not cal and img_data.zone_name and map_db[img_data.zone_name] then
                    local zone_config = map_db[img_data.zone_name]

                    -- Check if this is a multi-floor zone (has numeric indices)
                    if zone_config[1] then
                        -- Multi-floor zone: use this image's floor number to select calibration
                        cal = zone_config[this_img_floor] or zone_config[1] -- Fallback to map 1
                    else
                        -- Single-floor zone: use calibration directly
                        cal = zone_config
                    end
                end

                -- Final fallback: Try auto-calibration from mapinfo
                -- For multi-floor zones, only auto-calibrate the image matching current floor
                if not cal and img_data.width then
                    -- Check if we're in this image's zone
                    local in_this_zone = img_data.zone_name and zone_data[img_data.zone_name] and
                                        player_module.zoneId == zone_data[img_data.zone_name]

                    -- Check if this zone has multiple floors (from map_db or floor_mappings)
                    local this_zone_id = zone_data[img_data.zone_name]
                    local this_zone_config = map_db[img_data.zone_name]
                    local has_multiple_floors = (this_zone_config and this_zone_config[1] ~= nil) or
                                               (floor_mappings and this_zone_id and floor_mappings[this_zone_id] ~= nil)

                    local should_auto_cal = true
                    if in_this_zone and has_multiple_floors then
                        -- Only auto-cal if this is the player's current floor
                        -- Use actual floor from game, not saved preference
                        local player_floor = player_module.getFloorId(floor_mappings)
                        if player_floor then
                            should_auto_cal = (this_img_floor == player_floor)
                        else
                            -- Can't determine player floor, allow auto-cal anyway
                            should_auto_cal = true
                        end
                    end

                    if should_auto_cal then
                        cal = player_module.getAutoCalibration(img_data.width)
                        if cal then
                            -- Debug message (only shown once per zone load)
                            if not ui_images.auto_cal_msg_shown then
                                local floor_info = has_multiple_floors and string.format(" (floor %d)", this_img_floor) or ""
                                print(string.format("\30\106[QH]\30\01 Using auto-calibration for %s%s", img_data.zone_name or "unknown zone", floor_info))
                                ui_images.auto_cal_msg_shown = true
                            end
                        end
                    end
                end

                -- Draw player arrow on map
                if cal and img_data.zone_name then
                    if zone_data[img_data.zone_name] and player_module.zoneId == zone_data[img_data.zone_name] then
                        -- Check if player is in the correct zone
                        local should_draw_arrow = true

                        -- Check if THIS specific image's zone has multiple floors
                        local this_zone_id = zone_data[img_data.zone_name]
                        local this_zone_config = map_db[img_data.zone_name]
                        local zone_img_count = zone_occurrence_counts[img_data.zone_name] or 1
                        local is_this_image_multi_floor = (this_zone_config and this_zone_config[1] ~= nil) or
                                                          (floor_mappings and this_zone_id and floor_mappings[this_zone_id] ~= nil) or
                                                          (zone_img_count > 1)  -- Multiple images for same zone in this step

                        if is_this_image_multi_floor then
                            -- This image is from a multi-floor zone, check floor number
                            -- Compare this image's floor number with player's ACTUAL current floor
                            local player_floor = player_module.getFloorId(floor_mappings)
                            --print(string.format("\30\106[QH-ARROW]\30\01 Zone:%s ID:%s, img.floor_id=%s, this_img_floor=%d, player_floor=%s",
                               -- img_data.zone_name, tostring(this_zone_id), tostring(img_data.floor_id), this_img_floor, tostring(player_floor)))
                            if player_floor then
                                should_draw_arrow = (this_img_floor == player_floor)
                                if should_draw_arrow then
                                  --  print(string.format("\30\102[QH-ARROW]\30\01 ✓ MATCH: %d == %d", this_img_floor, player_floor))
                                else
                                   -- print(string.format("\30\68[QH-ARROW]\30\01 ✗ NO MATCH: %d != %d", this_img_floor, player_floor))
                                end
                            else
                                -- Can't determine floor, default to not drawing to avoid duplicates
                                should_draw_arrow = false
                            end
                        end
                        -- For single-floor images, should_draw_arrow stays true

                        if should_draw_arrow then
                            local playerHeading = player_module.getHeading()
                            map_renderer.drawPlayerArrow(imageX, imageY, w, h,
                                                        player_module.posX, player_module.posY_height,
                                                        playerHeading, cal)
                        end
                    end
                end

                -- Draw highlights (always drawn regardless of zone)
                if img_data.highlights then
                    map_renderer.drawHighlights(imageX, imageY, w, h, img_data.highlights)
                end

            else
                imgui.TextColored({1,0,0,1}, "(Missing image: " .. tostring(img_data.file) .. ")")
            end
        else
            imgui.Text("No map data available")
        end

        -- Save map position when window is moved
        local current_x, current_y = imgui.GetWindowPos()
        if ui_main_settings.map_pos_x ~= current_x or ui_main_settings.map_pos_y ~= current_y then
            ui_main_settings.map_pos_x = current_x
            ui_main_settings.map_pos_y = current_y
            -- Save settings (using quest_state's settings object)
            local settings = require('settings')
            settings.save('QuestHelper_settings', quest_state.settings)
        end
    end
    imgui.End()
end

return ui_images
