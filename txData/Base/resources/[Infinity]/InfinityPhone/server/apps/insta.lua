RegisterServerEvent('InfinityPhone:server:UpdateIsta')
AddEventHandler('InfinityPhone:server:UpdateIsta', function()
    local src = source
    Citizen.CreateThread(function()
        MySQL.Async.fetchAll('SELECT * FROM phone_instas ORDER BY time DESC LIMIT 31', {}, function(instas) 
            TriggerClientEvent('InfinityPhone:client:SetupData', src, { { name = 'instas', data = instas } })
        end)
    end)
end)

ESX.RegisterServerCallback('InfinityPhone:server:getLink', function(source, cb)
    cb("https://discord.com/api/webhooks/1046911445096484934/pfBQchzQ4iIi7BUN23GW9q5GPkGJfvzExtdRInKyh9CckYUvxKqIrge0CywJX4wp-uWI")
end)

ESX.RegisterServerCallback('InfinityPhone:server:DeleteInsta', function(source, cb, link)
    local photo = link
    MySQL.Async.execute('DELETE FROM `phone_instas` WHERE `photo` = @photo', {
        ['@photo'] = photo
      }, function(status)
          if status > 0 then
            TriggerClientEvent('InfinityPhone:client:RemoveInsta', -1, photo)
            cb(true)
          else
            cb(false)
          end
      end)
end)

ESX.RegisterServerCallback('InfinityPhone:server:SumbitNewInsta', function(source, cb, data)
    local cData = getIdentity(source)
    local insta = {
        identifier = cData.identifier,
        author =  cData.firstname .. ' ' .. cData.lastname,
        descricao = data.desc,
        likes = 0,
        photo = data.img,
    }

    MySQL.Async.execute('INSERT INTO phone_instas (`identifier`, `author`, `descricao`, `photo`) VALUES (@identifier, @author, @descricao, @photo)', { 
        ['@identifier'] = insta.identifier, ['@author'] = insta.author, ['@descricao'] = insta.descricao, ['@photo'] = insta.photo}
      , function(status)
          if status > 0 then
              cb(true)
          else
              cb(false)
          end
        end)

    TriggerClientEvent('InfinityPhone:client:RecieveNewInsta', -1, insta)
end)

