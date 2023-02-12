RegisterNUICallback( 'NewYellowPages', function( data, cb )
    ESX.TriggerServerCallback('InfinityPhone:server:NewYellowPages', function(callback)
        cb(callback)
    end, data) 
end)

RegisterNetEvent('InfinityPhone:client:RecieveNewYellow')
AddEventHandler('InfinityPhone:client:RecieveNewYellow', function(adData)
    SendNUIMessage({
        action = 'receiveYellow',
        data = adData
    })
end)

RegisterNetEvent('InfinityPhone:client:ToastNotify')
AddEventHandler('InfinityPhone:client:ToastNotify', function(message)
    SendNUIMessage({
        action = 'toastNotify',
        data = message
    })
end)

RegisterNUICallback( 'DeleteYellowPages', function( data, cb )
    ESX.TriggerServerCallback('InfinityPhone:server:DeleteAd', function(callback)
        cb(callback)
    end, data)
end)


RegisterNetEvent('InfinityPhone:client:RemoveNewYellow')
AddEventHandler('InfinityPhone:client:RemoveNewYellow', function(id)
    SendNUIMessage({
        action = 'removeYellow',
        id = id
    })
end)