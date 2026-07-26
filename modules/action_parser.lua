--[[
* Addons - Copyright (c) 2023 Ashita Development Team
* Contact: https://www.ashitaxi.com/
* Contact: https://discord.gg/Ashita
*
* This file is part of Ashita.
*
* Ashita is free software: you can redistribute it and/or modify
* it under the terms of the GNU General Public License as published by
* the Free Software Foundation, either version 3 of the License, or
* (at your option) any later version.
*
* Ashita is distributed in the hope that it will be useful,
* but WITHOUT ANY WARRANTY; without even the implied warranty of
* MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
* GNU General Public License for more details.
*
* You should have received a copy of the GNU General Public License
* along with Ashita.  If not, see <https://www.gnu.org/licenses/>.
--]]

require('common')
local breader = require('modules.bitreader')

local action_parser = T{}

-- Parses a 0x028 action packet into a structured table.
-- Skips entity name lookups for performance - caller resolves names only when needed.
-- Returns: { actor_id, cmd_no, targets = { { id, results = { { miss, value, message } } } } }
action_parser.parse = function(packet)
    local reader = breader:new()
    reader:set_data(packet)
    reader:set_pos(5)

    local action        = T{}
    action.actor_id     = reader:read(32)
    action.trg_sum      = reader:read(6)
    action.res_sum      = reader:read(4)
    action.cmd_no       = reader:read(4)
    action.cmd_arg      = reader:read(32)
    action.info         = reader:read(32)
    action.targets      = T{}

    for _ = 0, action.trg_sum - 1 do
        local target        = T{}
        target.id           = reader:read(32)
        target.result_sum   = reader:read(4)
        target.results      = T{}

        for _ = 0, target.result_sum - 1 do
            local result        = T{}
            result.miss         = reader:read(3)
            result.kind         = reader:read(2)
            result.sub_kind     = reader:read(12)
            result.info         = reader:read(5)
            result.scale        = reader:read(5)
            result.value        = reader:read(17)
            result.message      = reader:read(10)
            result.bit          = reader:read(31)

            if reader:read(1) > 0 then
                result.proc_kind    = reader:read(6)
                result.proc_info    = reader:read(4)
                result.proc_value   = reader:read(17)
                result.proc_message = reader:read(10)
            end

            if reader:read(1) > 0 then
                result.react_kind    = reader:read(6)
                result.react_info    = reader:read(4)
                result.react_value   = reader:read(14)
                result.react_message = reader:read(10)
            end

            table.insert(target.results, result)
        end

        table.insert(action.targets, target)
    end

    return action
end

-- cmd_no reference:
--  1 = melee attack
--  2 = ranged attack
--  3 = weapon skill
--  4 = magic
--  5 = item
--  6 = job ability
--  7 = monster/WS start
--  8 = magic start
-- 11 = monster skill

-- Kill message IDs: 6 = "defeats", 20 = "falls to the ground"

return action_parser
