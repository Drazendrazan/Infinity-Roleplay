--[[
AddEventHandler('mythic_base:shared:ComponentsReady', function()
    exports['mythic_base']:FetchComponent('Chat'):RegisterCommand('phone', function(source)
        TriggerClientEvent('InfinityPhone:client:TogglePhone', source)
    end, {
        help = "Toggle Phone Display"
    }, 0)

    exports['mythic_base']:FetchComponent('Chat'):RegisterCommand('testchip', function(source)
        TriggerClientEvent('InfinityPhone:client:TestChip', source)
    end, {
        help = "Test Tuner Chip Function"
    }, 0)
end)
]]
RegisterCommand('testchip', function(source, args, rawCommand)
TriggerClientEvent('InfinityPhone:client:TestChip', source)
end)
--
