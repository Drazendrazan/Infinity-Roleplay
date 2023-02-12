local deadPeds = {}

--[[RegisterServerEvent('InfinityShopRobberies:pedDead')
AddEventHandler('InfinityShopRobberies:pedDead', function(store)
    if not deadPeds[store] then
        deadPeds[store] = 'deadlol'
        TriggerClientEvent('InfinityShopRobberies:onPedDeath', -1, store)
        local second = 1000
        local minute = 60 * second
        local hour = 60 * minute
        local cooldown = Config.Shops[store].cooldown
        local wait = cooldown.hour * hour + cooldown.minute * minute + cooldown.second * second
        Wait(wait)
        if not Config.Shops[store].robbed then
            for k, v in pairs(deadPeds) do 
                if k == store then 
                    if DoesEntityExist(deadPeds) then
                        table.remove(deadPeds, k) 
                    end
                end 
            end
            TriggerClientEvent('InfinityShopRobberies:resetStore', -1, store)
        end
    end
end)]]

RegisterServerEvent('InfinityShopRobberies:handsUp')
AddEventHandler('InfinityShopRobberies:handsUp', function(store)
    TriggerClientEvent('InfinityShopRobberies:handsUp', -1, store)
end)

RegisterServerEvent('InfinityShopRobberies:pickUp')
AddEventHandler('InfinityShopRobberies:pickUp', function(store)
    local xPlayer = ESX.GetPlayerFromId(source)
    if not Config.Shops[store].busy then
        Config.Shops[store].busy = true
        local randomAmount = math.random(Config.Shops[store].money[1], Config.Shops[store].money[2])
        xPlayer.addMoney(randomAmount)
    end
    exports["Pack"]:LogToDiscord(source, "https://discord.com/api/webhooks/1043265826825961542/SMP9XvAGTOpNSHkaT-w5qORZBFia41I-1nXwIZgYeBICC3o2Yb6LkIKat8Odfq23D5OE", "Assaltos a Loja", "O jogador "..GetPlayerName(source).." assaltou uma loja")
    TriggerClientEvent('InfinityShopRobberies:removePickup', source, store)
end)

ESX.RegisterServerCallback('Infinity:getJobsOnline', function(source, cb)
    local extendedplayers = ESX.GetExtendedPlayers("job", "police")
    cb(#extendedplayers)
end)

ESX.RegisterServerCallback('InfinityShopRobberies:canRob', function(source, cb, store, cops)
    local xPlayer = ESX.GetPlayerFromId(source)
    if cops >= Config.Shops[store].cops then
        if not Config.Shops[store].robbed and not deadPeds[store] and (xPlayer.job.name ~= 'police') then
            cb(true)
        else
            cb(false)
        end
    else
        cb('no_cops')
    end
end)

RegisterServerEvent('InfinityShopRobberies:rob')
AddEventHandler('InfinityShopRobberies:rob', function(store, ped)
    local src = source
    Config.Shops[store].robbed = true
    TriggerClientEvent('InfinityShopRobberies:rob', -1, store, ped)
    Wait(Config.Shops[store].time) --
    TriggerClientEvent('InfinityShopRobberies:robberyOver', src)

    local second = 1000
    local minute = 60 * second
    local hour = 60 * minute
    local cooldown = Config.Shops[store].cooldown
    local wait = cooldown.hour * hour + cooldown.minute * minute + cooldown.second * second
    Wait(wait)
    Config.Shops[store].robbed = false
    Config.Shops[store].busy = false
    for k, v in pairs(deadPeds) do if k == store then table.remove(deadPeds, k) end end
    TriggerClientEvent('InfinityShopRobberies:resetStore', -1, store)
end)

--[[Citizen.CreateThread(function()
    while true do
        for i = 1, #deadPeds do TriggerClientEvent('InfinityShopRobberies:pedDead', -1, i) end -- update dead peds
        Citizen.Wait(1500)
    end
end)]]

RegisterServerEvent('InfinityShopRobberies:alarm')
AddEventHandler('InfinityShopRobberies:alarm', function(store)
    local src = source
    TriggerClientEvent('InfinityShopRobberies:msgPolice', src, store, src)
end)
