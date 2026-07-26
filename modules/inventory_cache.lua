-- Inventory cache module
-- Checks inventory periodically (not every frame) to avoid FPS impact
local inventory_cache = {}

local inventory_module = require('modules.inventory')

-- Cache storage
local itemCache = {} -- { itemName = { hasItem, count, lastCheck } }
local CACHE_DURATION = 5.0 -- Seconds before re-checking

-- Last time inventory was fully scanned
local lastFullScan = 0

-- Checks if an item is in inventory (uses cache if recent)
function inventory_cache.hasItem(itemName, forceRefresh)
    local currentTime = os.clock()

    -- Check if we have a recent cached result
    if not forceRefresh and itemCache[itemName] then
        local timeSinceCheck = currentTime - itemCache[itemName].lastCheck
        if timeSinceCheck < CACHE_DURATION then
            return itemCache[itemName].hasItem, itemCache[itemName].count
        end
    end

    -- Cache miss or expired - check inventory
    local hasItem, count = inventory_module.hasItem(itemName, false) -- Only search Inventory

    -- Update cache
    itemCache[itemName] = {
        hasItem = hasItem,
        count = count,
        lastCheck = currentTime
    }

    return hasItem, count
end

-- Checks multiple items at once (more efficient than individual checks)
function inventory_cache.hasAllItems(itemList, forceRefresh)
    local currentTime = os.clock()
    local results = {}
    local needsRefresh = forceRefresh

    -- Check if cache is stale for ANY item
    if not needsRefresh then
        for _, itemName in ipairs(itemList) do
            if not itemCache[itemName] or (currentTime - itemCache[itemName].lastCheck) >= CACHE_DURATION then
                needsRefresh = true
                break
            end
        end
    end

    -- If refresh needed, scan inventory once for all items
    if needsRefresh then
        local hasAll, itemResults = inventory_module.hasAllItems(itemList, false)

        -- Update cache for all items
        for itemName, result in pairs(itemResults) do
            itemCache[itemName] = {
                hasItem = result.hasItem,
                count = result.count,
                lastCheck = currentTime
            }
            results[itemName] = {
                hasItem = result.hasItem,
                count = result.count
            }
        end

        lastFullScan = currentTime
    else
        -- Use cached results
        for _, itemName in ipairs(itemList) do
            if itemCache[itemName] then
                results[itemName] = {
                    hasItem = itemCache[itemName].hasItem,
                    count = itemCache[itemName].count
                }
            else
                results[itemName] = { hasItem = false, count = 0 }
            end
        end
    end

    return results
end

-- Forces a refresh of all cached items
function inventory_cache.clearCache()
    itemCache = {}
    lastFullScan = 0
end

-- Gets time since last full inventory scan
function inventory_cache.getTimeSinceLastScan()
    return os.clock() - lastFullScan
end

return inventory_cache
