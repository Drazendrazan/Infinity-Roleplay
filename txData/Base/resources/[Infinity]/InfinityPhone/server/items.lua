ESX.RegisterUsableItem('simcard', function(source)
    local src = source
    local xPlayer = ESX.GetPlayerFromId(src)
    local identifier = xPlayer.identifier
    local myPhoneNumber = nil
    
    xPlayer.removeInventoryItem('simcard', 1)
    myPhoneNumber = getPhoneRandomNumber()
    Citizen.Wait(10)
    MySQL.Async.insert("UPDATE users SET phone_number = @myPhoneNumber WHERE identifier = @identifier", { 
        ['@myPhoneNumber'] = myPhoneNumber,
        ['@identifier'] = identifier
    }, function()
        TriggerClientEvent("InfinityPhone:client:UpdateData", src)
        TriggerClientEvent('esx:showNotification', src, "Telemóvel", 'Novo número: '.. myPhoneNumber, 2000, 'success')
    end)
end)