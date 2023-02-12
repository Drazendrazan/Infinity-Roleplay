enable = false

RegisterServerEvent('dplsalertas:switch')
AddEventHandler('dplsalertas:switch', function(value)
    enable = value
    TriggerClientEvent('dplsalertas:switch', -1, value)
end)