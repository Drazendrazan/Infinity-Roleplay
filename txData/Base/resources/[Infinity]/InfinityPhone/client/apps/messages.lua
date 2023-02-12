RegisterNetEvent('InfinityPhone:client:ReceiveText')
AddEventHandler('InfinityPhone:client:ReceiveText', function(sender, text, number)
    ESX.ShowNotification("TELEMÓVEL", 'Recebeste uma nova mensagem de ' .. sender, 2000, 'info')


    if not muted then
        TriggerServerEvent('InteractSound_SV:PlayWithinDistance', 5.0, 'sms_receive', 0.1)
    end 

    SendNUIMessage({
        action = 'receiveText',
        data = {
            sender = number,
            message = text
        }
    })
 
    if not isPhoneOpen then
        UpdateAppUnreadAdd('message', 1)
    end 
end)

RegisterNUICallback('SendText', function(data, cb)
    ESX.TriggerServerCallback('InfinityPhone:server:SendText', function(callback)
        cb(callback)
    end, data)
    TriggerEvent('InteractSound_CL:PlayOnAll', 'sms_send', 0.3)
end)

RegisterNUICallback('DeleteConversation', function(data, cb)
    ESX.TriggerServerCallback('InfinityPhone:server:DeleteConversation', function(callback)
        cb(callback)
    end, data)
end)