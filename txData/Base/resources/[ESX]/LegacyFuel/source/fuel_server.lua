if Config.UseESX then

    RegisterServerEvent('fuel:pay')
    AddEventHandler('fuel:pay', function(price, fuel, vehicle)
        local _source = source
        local xPlayer = ESX.GetPlayerFromId(source)
        local amount = ESX.Math.Round(price)

        if price > 0 then
            xPlayer.removeAccountMoney("bank", amount)
        end
        if not fuel or not vehicle then return end
        if fuel == "jerrycanrefill" then
            local log = "**Info:** Bidón\n\t**Preço:** " .. price .. ""
            exports["Pack"]:LogToDiscord(_source,
                "https://discord.com/api/webhooks/1039624316771369040/MQLL0LoQzWevyLo-64uYvWzG27D8cloi0TdumL9jYhOMMcfQ9JCFYbbVcdNe4KIMSbP8"
                , "Combustível", log)
        else
            local log = "**Info:** Carro\n\t**Carro:** " ..
                vehicle .. "\n\t**Preço:** " .. price .. "\n\t**Combustível:**" .. fuel .. ""
            exports["Pack"]:LogToDiscord(_source,
                "https://discord.com/api/webhooks/1039624316771369040/MQLL0LoQzWevyLo-64uYvWzG27D8cloi0TdumL9jYhOMMcfQ9JCFYbbVcdNe4KIMSbP8"
                , "Combustível", log)
        end
    end)

    RegisterServerEvent('fuel:weapon')
    AddEventHandler('fuel:weapon', function()
        local _source = source
        local xPlayer = ESX.GetPlayerFromId(_source)

        xPlayer.addWeapon("weapon_petrolcan", 4500)
        local log = "**Info:** Comprou um bidón"
        exports["Pack"]:LogToDiscord(_source,
            "https://discord.com/api/webhooks/1039624316771369040/MQLL0LoQzWevyLo-64uYvWzG27D8cloi0TdumL9jYhOMMcfQ9JCFYbbVcdNe4KIMSbP8"
            , "Combustível", log)
    end)
end

RegisterServerEvent('fuel:givecan')
AddEventHandler('fuel:givecan', function()
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(source)

    xPlayer.addInventoryItem('weapon_petrolcan', 1)
    local log = "**Info:** Comprou um bidón"
        exports["Pack"]:LogToDiscord(_source,
            "https://discord.com/api/webhooks/1039624316771369040/MQLL0LoQzWevyLo-64uYvWzG27D8cloi0TdumL9jYhOMMcfQ9JCFYbbVcdNe4KIMSbP8"
            , "Combustível", log)
end)