RegisterServerEvent('InfinityPhone:server:UpdateTwitter')
AddEventHandler('InfinityPhone:server:UpdateTwitter', function()
  local src = source
  Citizen.CreateThread(function()
    MySQL.Async.fetchAll('SELECT * FROM phone_tweets ORDER BY time DESC LIMIT 31', {}, function(tweets)
      for k, v in pairs(tweets) do
        v['rawMessage'] = v.message
      end
      TriggerClientEvent('InfinityPhone:client:SetupData', src, { { name = 'tweets', data = tweets } })
    end)
  end)
end)

ESX.RegisterServerCallback('InfinityPhone:server:DeleteTweet', function(source, cb, data)
  local xPlayer = ESX.GetPlayerFromId(source)
  local identifier = xPlayer.identifier

  MySQL.Async.execute('DELETE FROM `phone_tweets` WHERE `identifier` = @identifier AND `author` = @author AND `message` = @message'
    , {
      ['@identifier'] = identifier,
      ['@author'] = data.author,
      ['@message'] = data.message
    }, function(status)
    if status > 0 then
      TriggerClientEvent('InfinityPhone:client:RemoveTweet', -1, identifier, data)
      cb(true)
    else
      cb(false)
    end
  end)
end)


ESX.RegisterServerCallback('InfinityPhone:server:NewTweet', function(source, cb, data)
  local src = source
  local char = ESX.GetPlayerFromId(src)
  data['identifier'] = char.identifier

  Citizen.CreateThread(function()
    local users = ESX.GetPlayers()

    if data.mentions ~= nil then
      for k, v in pairs(data.mentions) do
        for k2, v2 in pairs(users) do
          local mPlayer = getIdentity(v2)
          --local c1 = mPlayer:GetData('firstname')
          --local c2 = mPlayer:GetData('lastname')
          if ('@' .. mPlayer.firstname .. '_' .. mPlayer.lastname) == v then
            TriggerClientEvent('esx:showNotification', xTarget.source, "Telemóvel",
              data.author .. ' identificou-te num tweet!', 2000, 'info')
            -- Evento com popUP
          end
        end
      end
    end

    MySQL.Async.execute('INSERT INTO phone_tweets (`identifier`, `author`, `message`) VALUES(@identifier, @author, @message)'
      , {
        ['identifier'] = char.identifier, ['author'] = data.author, ['message'] = data.message
      }
      , function(status)
      if status > 0 then
        cb(true)
      else
        cb(false)
      end
    end)
  end)
  TriggerClientEvent('InfinityPhone:client:RecieveNewTweet', -1, data)
end)
