RegisterNUICallback('NewTweet', function(data, cb)
    ESX.TriggerServerCallback('InfinityPhone:server:NewTweet', function(callback)
        cb(callback)
    end, data)
	--TriggerServerEvent('InfinityPhone:server:NewTweet', 'NewTweet', data.author, data.message, data.mentions, data.hashtags)
end)

RegisterNetEvent('InfinityPhone:client:RecieveNewTweet')
AddEventHandler('InfinityPhone:client:RecieveNewTweet', function(tweet)
    SendNUIMessage({
        action = 'receiveTweet',
        data = tweet
    })
end)

RegisterNUICallback('DeleteTweet', function( data, cb )
    ESX.TriggerServerCallback('InfinityPhone:server:DeleteTweet', function(callback)
        cb(callback)
    end, data)
	--TriggerServerEvent('InfinityPhone:server:DeleteTweet', 'DeleteTweet', data.author, data.message)
end)

RegisterNetEvent('InfinityPhone:client:RemoveTweet')
AddEventHandler('InfinityPhone:client:RemoveTweet', function(identifier, cData)
    SendNUIMessage({
        action = 'removeTweet',
        data = {
        	identifier = identifier,
            author = cData.author,
            message = cData.message
        }
    })
end)