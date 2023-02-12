playerBlips = {}

RegisterCommand("blipon", function (source, args, raw)
    TriggerClientEvent("blips:enable", source, playerBlips)
end)

RegisterCommand("blipoff", function (source, args, raw)
    playerBlips[source] = nil
    TriggerClientEvent("blips:disable", source)
end)

RegisterCommand("blip", function (source, args, raw)
    raw = raw:gsub("blip ", "")
    playerBlips[source] = { label = raw:gsub("/", ""), coords = GetEntityCoords(GetPlayerPed(source)) }
    TriggerClientEvent("blips:update", -1, playerBlips)
end)

Citizen.CreateThread(function ()
    while true do
        for k, v in pairs(playerBlips) do
            if #(GetEntityCoords(GetPlayerPed(k)) - v.coords) > 10 then
                playerBlips[k].coords = GetEntityCoords(GetPlayerPed(k))
            end
        end
        TriggerClientEvent("blips:update", -1, playerBlips)
        Citizen.Wait(750)
    end
end)

AddEventHandler("playerDropped", function ()
    playerBlips[source] = nil
    TriggerClientEvent("blips:update", -1, playerBlips)
end)