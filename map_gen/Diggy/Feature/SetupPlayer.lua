--[[-- info
    Provides the ability to setup a player when first joined.
]]

-- dependencies
local Event = require 'utils.event'
local Debug = require 'map_gen.Diggy.Debug'

-- this
local SetupPlayer = {}

--[[--
    Registers all event handlers.
]]
function SetupPlayer.register(config)
    Event.add(defines.events.on_player_created, function (event)
        local player = game.players[event.player_index]

        for _, item in pairs(config.starting_items) do
            player.insert(item)
        end

        player.teleport({x = 0, y = 0})

        Debug.cheat(function()
            player.force.manual_mining_speed_modifier = config.cheats.manual_mining_speed_modifier
        end)
    end)
end

return SetupPlayer
