--[[
 *  Inventory checking module for QuestHelper
 *  Based on code from "Find" addon by MalRD (MIT License)
 *
 *  The MIT License (MIT)
 *  Copyright (c) 2014 MalRD
 *
 *  Permission is hereby granted, free of charge, to any person obtaining a copy
 *  of this software and associated documentation files (the "Software"), to
 *  deal in the Software without restriction, including without limitation the
 *  rights to use, copy, modify, merge, publish, distribute, sublicense, and/or
 *  sell copies of the Software, and to permit persons to whom the Software is
 *  furnished to do so, subject to the following conditions:
 *
 *  The above copyright notice and this permission notice shall be included in
 *  all copies or substantial portions of the Software.
 *
 *  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 *  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 *  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 *  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 *  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
 *  FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
 *  DEALINGS IN THE SOFTWARE.
]]--

local inventory_module = {}

-- Storage container IDs
local STORAGES = {
    [1] = { id=0, name='Inventory' },
    [2] = { id=1, name='Safe' },
    [3] = { id=2, name='Storage' },
    [4] = { id=3, name='Temporary' },
    [5] = { id=4, name='Locker' },
    [6] = { id=5, name='Satchel' },
    [7] = { id=6, name='Sack' },
    [8] = { id=7, name='Case' },
    [9] = { id=8, name='Wardrobe' },
    [10]= { id=9, name='Safe 2' },
    [11]= { id=10, name='Wardrobe 2' },
    [12]= { id=11, name='Wardrobe 3' },
    [13]= { id=12, name='Wardrobe 4' }
}

-- Language setting (1 = English for Ashita v4)
local LANGUAGE = 1

-- Checks if an item name matches the search string (case-insensitive)
local function matchesItemName(item, searchString)
    if not item or not searchString then return false end

    local search = searchString:lower()

    -- Check main name (v4 uses :contains() helper)
    if item.Name[LANGUAGE] and string.lower(item.Name[LANGUAGE]):contains(search) then
        return true
    end

    -- Check singular log name
    if item.LogNameSingular[LANGUAGE] and string.lower(item.LogNameSingular[LANGUAGE]):contains(search) then
        return true
    end

    -- Check plural log name
    if item.LogNamePlural[LANGUAGE] and string.lower(item.LogNamePlural[LANGUAGE]):contains(search) then
        return true
    end

    return false
end

-- Checks if player has a specific item in their inventory
-- Parameters:
--   itemName: Name of the item to search for (case-insensitive, partial match)
--   searchAllStorages: If true, searches all storages. If false, only searches Inventory (default: false)
-- Returns:
--   hasItem: true if item found, false otherwise
--   totalCount: Total quantity found across all searched storages
--   locations: Table of { storageName = count } where item was found
function inventory_module.hasItem(itemName, searchAllStorages)
    if not itemName then return false, 0, {} end

    -- Check if AshitaCore is available
    if not AshitaCore then return false, 0, {} end

    local memManager = AshitaCore:GetMemoryManager()
    if not memManager then return false, 0, {} end

    local inventory = memManager:GetInventory()
    local resources = AshitaCore:GetResourceManager()

    if not inventory or not resources then return false, 0, {} end

    local totalCount = 0
    local locations = {}

    -- Determine which storages to search
    local storagesToSearch = searchAllStorages and STORAGES or { STORAGES[1] } -- Just Inventory

    for _, storage in ipairs(storagesToSearch) do
        local storageCount = 0

        -- Ashita v4 API: GetContainerCountMax and GetContainerItem
        for j = 0, inventory:GetContainerCountMax(storage.id) do
            local itemEntry = inventory:GetContainerItem(storage.id, j)

            -- Safety check: itemEntry can be nil during zoning
            if itemEntry and itemEntry.Id ~= 0 and itemEntry.Id ~= 65535 then
                local item = resources:GetItemById(itemEntry.Id)

                if item and matchesItemName(item, itemName) then
                    local quantity = 1
                    if itemEntry.Count and item.StackSize > 1 then
                        quantity = itemEntry.Count
                    end

                    storageCount = storageCount + quantity
                    totalCount = totalCount + quantity
                end
            end
        end

        if storageCount > 0 then
            locations[storage.name] = storageCount
        end
    end

    return (totalCount > 0), totalCount, locations
end

-- Checks if player has ALL items from a list
-- Parameters:
--   itemList: Array of item names to check
--   searchAllStorages: If true, searches all storages
-- Returns:
--   hasAll: true if ALL items found, false if any missing
--   itemResults: Table of { itemName = { hasItem, count, locations } }
function inventory_module.hasAllItems(itemList, searchAllStorages)
    if not itemList or type(itemList) ~= 'table' then
        return false, {}
    end

    local hasAll = true
    local itemResults = {}

    for _, itemName in ipairs(itemList) do
        local hasItem, count, locations = inventory_module.hasItem(itemName, searchAllStorages)
        itemResults[itemName] = {
            hasItem = hasItem,
            count = count,
            locations = locations
        }

        if not hasItem then
            hasAll = false
        end
    end

    return hasAll, itemResults
end

-- Gets the exact count of a specific item
-- Parameters:
--   itemName: Name of the item
--   searchAllStorages: If true, searches all storages
-- Returns: count (0 if not found)
function inventory_module.getItemCount(itemName, searchAllStorages)
    local _, count = inventory_module.hasItem(itemName, searchAllStorages)
    return count
end

return inventory_module
