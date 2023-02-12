RegisterNUICallback('CreateContact', function(data, cb)
    ESX.TriggerServerCallback('InfinityPhone:server:CreateContact', function(callback)
        cb(callback)
    end, data)
end)

RegisterNUICallback('EditContact', function( data, cb )
    ESX.TriggerServerCallback('InfinityPhone:server:EditContact', function(callback)
        cb(callback)
    end, data)
end)

RegisterNUICallback('DeleteContact', function(data, cb)
    ESX.TriggerServerCallback('InfinityPhone:server:DeleteContact', function(callback)
        cb(callback)
        if callback then
            ESX.ShowNotification("TELEMÓVEL", 'Número Apagado! ('.. data.name .. ' | '.. data.number ..')', 2000, 'info')
        end 
    end, data)
end)