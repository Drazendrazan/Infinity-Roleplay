AddEventHandler("esx:onRemoveInventoryItem", function (source, name, count)
    if name == "radio" then
        local xPlayer = ESX.GetPlayerFromId(source)
        if not xPlayer.hasItem("radio") then
            TriggerClientEvent("zerio-radio:client:removedradio", source)
        end
    end
end)