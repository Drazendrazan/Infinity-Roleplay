local Advertisements = {}

function CreateAd(adData, src)
    if  Advertisements[adData.id] ~= nil then
        return false
    else
        Advertisements[adData.id] = adData
        TriggerClientEvent('InfinityPhone:client:RecieveNewYellow', -1, Advertisements[adData.id])
        return true
    end
end

function DeleteAd(source)
    local src = source
        if src ~= nil then
            Advertisements[src] = nil
            TriggerClientEvent('InfinityPhone:client:RemoveNewYellow', -1, src)
        else
            return false
        end
    return true
end

RegisterServerEvent('InfinityPhone:server:GetAds')
AddEventHandler('InfinityPhone:server:GetAds', function()
    local src = source
    TriggerClientEvent('InfinityPhone:client:SetupData', src, {{ name = 'ads', data = Advertisements }})
end)

ESX.RegisterServerCallback('InfinityPhone:server:NewYellowPages', function(source, cb, data)
    local src = source
    cb(CreateAd({
        id = src,
        author = data.author,
        num = data.number,
        time = data.time,
        pageText = data.message
    }, src))
end)


ESX.RegisterServerCallback('InfinityPhone:server:DeleteAd', function(source, cb, data)
    cb(DeleteAd(source))
end)