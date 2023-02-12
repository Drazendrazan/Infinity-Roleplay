RegisterServerEvent('InfinityPhone:server:UpdateContact')
AddEventHandler('InfinityPhone:server:UpdateContact', function()
    local src = source
    local char = ESX.GetPlayerFromId(src)


    Citizen.CreateThread(function()
        local contactData = {}
        MySQL.Async.fetchAll('SELECT name, number FROM phone_contacts WHERE identifier = @identifier', { ['identifier'] = char.identifier }, function(contacts) 
            for k, v in pairs(contacts) do
                table.insert(contactData, v)
            end

            TriggerClientEvent('InfinityPhone:client:SetupData', src, {{ name = 'contacts', data = contactData }})
        end)
    end)
end)

ESX.RegisterServerCallback('InfinityPhone:server:CreateContact', function(source, cb, data)
    local src = source
    local xPlayer = ESX.GetPlayerFromId(src)
    MySQL.Async.execute('INSERT INTO phone_contacts (`identifier`, `number`, `name`) VALUES(@identifier, @number, @name)', { ['identifier'] = xPlayer.identifier, ['number'] = data.number, ['name'] = data.name }, function(status) 
        if status > 0 then
            cb(true)
        else
            cb(false)
        end
    end)
end)

ESX.RegisterServerCallback('InfinityPhone:server:EditContact', function(source, cb, data)
    local src = source
    local xPlayer = ESX.GetPlayerFromId(src)
    MySQL.Async.execute('UPDATE phone_contacts SET name = @name, number = @number, avatar = @avatar WHERE identifier = @identifier AND name = @oName AND number = @oNumber', { ['name'] = data.name, ['number'] = data.number, ['avatar'] = data.avatar, ['id'] = data.id, ['identifier'] = xPlayer.identifier, ['oName'] = data.originName, ['oNumber'] = data.originNumber }, function(status) 
        if status > 0 then
            cb(true)
        else
            cb(false)
        end
    end)
end)

ESX.RegisterServerCallback('InfinityPhone:server:DeleteContact', function(source, cb, data)
    local src = source
    local xPlayer = ESX.GetPlayerFromId(src)
    MySQL.Async.execute('DELETE FROM phone_contacts WHERE identifier = @identifier AND name = @name AND number = @number', { ['identifier'] = xPlayer.identifier, ['name'] = data.name, ['number'] = data.number }, function(status) 
        if status > 0 then
            cb(true)
        else
            cb(false)
        end
    end)
end)