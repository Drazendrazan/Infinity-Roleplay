local savedCoords = {}

local groupList = {
    ["user"] = { label = "User", level = 0 },
    ["support"] = { label = "Support", level = 1 },
    ["mod"] = { label = "Moderator", level = 2 },
    ["admin"] = { label = "Admin", level = 3 },
    ["headadmin"] = { label = "Head Admin", level = 4 },
    ["owner"] = { label = "Owner", level = 5 }
}

function isAllowedTo(source, group)
    if source == 0 then return true end
    local xPlayer = ESX.GetPlayerFromId(source)
    if not xPlayer then return end
    local playerGroup = xPlayer.getGroup()
    local playerLevel = groupList[playerGroup].level
    local targetLevel = groupList[group].level

    if playerLevel >= targetLevel then
        return true
    else
        TriggerClientEvent("esx:showNotification", source, "SEM PERMISSÃO",
            "Este comando está autorizado apenas para " .. groupList[group].label .. " ou superior.", 2000, "warning")
        return false
    end
end

RegisterCommand("slay", function(source, args, raw)
    if isAllowedTo(source, "admin") then
        if args[1] and tonumber(args[1]) then
            local targetId = tonumber(args[1])
            TriggerEvent("staffmanagement:LogSystem", raw, source)
            TriggerClientEvent("staffmanagement:slayplayer", targetId)
        end
    end
end, false)

RegisterCommand("tpm", function(source, args, raw)
    if isAllowedTo(source, "support") then
        TriggerEvent("staffmanagement:LogSystem", raw, source)
        TriggerClientEvent("staffmanagement:tpm", source)
    end
end, false)

RegisterCommand("bring", function(source, args, raw)
    if isAllowedTo(source, "support") then
        if args[1] and tonumber(args[1]) then
            local xPlayer = ESX.GetPlayerFromId(source)
            local xTarget = ESX.GetPlayerFromId(tonumber(args[1]))
            if xTarget then
                local targetCoords = xTarget.getCoords()
                local playerCoords = xPlayer.getCoords()
                savedCoords[tonumber(args[1])] = targetCoords
                xTarget.setCoords(playerCoords)
                TriggerEvent("staffmanagement:LogSystem", raw, source)
            end
        end
    end
end, false)

RegisterCommand("bringback", function(source, args, raw)
    if isAllowedTo(source, "support") then
        if args[1] and tonumber(args[1]) then
            local targetId = tonumber(args[1])
            local xTarget = ESX.GetPlayerFromId(targetId)
            local playerCoords = savedCoords[targetId]
            if playerCoords then
                xTarget.setCoords(playerCoords)
                savedCoords[targetId] = nil
            end
            TriggerEvent("staffmanagement:LogSystem", raw, source)
        end
    end
end, false)

RegisterCommand("goto", function(source, args, raw)
    if isAllowedTo(source, "support") then
        if args[1] and tonumber(args[1]) then
            local xPlayer = ESX.GetPlayerFromId(source)
            local xTarget = ESX.GetPlayerFromId(tonumber(args[1]))
            if xTarget then
                local targetCoords = xTarget.getCoords()
                local playerCoords = xPlayer.getCoords()
                savedCoords[source] = playerCoords
                xPlayer.setCoords(targetCoords)
            end
        end
        TriggerEvent("staffmanagement:LogSystem", raw, source)
    end
end, false)

RegisterCommand("goback", function(source, args, raw)
    if isAllowedTo(source, "support") then
        local playerCoords = savedCoords[source]
        if playerCoords then
            local xPlayer = ESX.GetPlayerFromId(source)
            xPlayer.setCoords(playerCoords)
            savedCoords[source] = nil
        end
        TriggerEvent("staffmanagement:LogSystem", raw, source)
    end
end, false)

RegisterCommand("dv", function(source, args, raw)
    if isAllowedTo(source, "admin") then
        TriggerEvent("staffmanagement:LogSystem", raw, source)
        local vehicle = GetVehiclePedIsIn(GetPlayerPed(source), false)
        if vehicle ~= 0 then
            DeleteEntity(vehicle)
        else
            local xPlayer = ESX.GetPlayerFromId(source)
            local Vehicles = ESX.OneSync.GetVehiclesInArea(xPlayer.getCoords(true), tonumber(args[1]) or 5)
            for i = 1, #Vehicles do
                local Vehicle = NetworkGetEntityFromNetworkId(Vehicles[i])
                if DoesEntityExist(Vehicle) then
                    DeleteEntity(Vehicle)
                end
            end
        end
    end
end, false)

RegisterCommand("car", function(source, args, raw)
    if isAllowedTo(source, "admin") then
        if args[1] then
            local xPlayer = ESX.GetPlayerFromId(source)
            xPlayer.triggerEvent('staffmanagement:spawnVehicle', args[1])
            TriggerEvent("staffmanagement:LogSystem", raw, source)
        end
    end
end, false)

RegisterCommand("setjob", function(source, args, raw)
    if isAllowedTo(source, "admin") then
        if args[1] and tonumber(args[1]) and args[2] and args[3] and tonumber(args[3]) then
            local xTarget = ESX.GetPlayerFromId(args[1])
            if xTarget then
                if ESX.DoesJobExist(args[2], args[3]) then
                    xTarget.setJob(args[2], args[3])
                    TriggerEvent("staffmanagement:LogSystem", raw, source)
                end
            end
        end
    end
end, false)

RegisterCommand("tp", function(source, args, raw)
    if isAllowedTo(source, "headadmin") then
        if args[1] and tonumber(args[1]) and args[2] and tonumber(args[2]) and args[3] and tonumber(args[3]) then
            if tonumber(args[1]) and tonumber(args[2]) and tonumber(args[3]) then
                local xPlayer = ESX.GetPlayerFromId(source)
                xPlayer.setCoords({
                    x = tonumber(args[1]),
                    y = tonumber(args[2]),
                    z = tonumber(args[3])
                })
                TriggerEvent("staffmanagement:LogSystem", raw, source)
            end
        end
    end
end, false)

RegisterCommand("skin", function(source, args, raw)
    if isAllowedTo(source, "support") then
        if args[1] and tonumber(args[1]) then
            TriggerClientEvent("esx_skin:openSaveableMenu", tonumber(args[1]))
        else
            TriggerClientEvent("esx_skin:openSaveableMenu", source)
        end
        TriggerEvent("staffmanagement:LogSystem", raw, source)
    end
end, false)

RegisterCommand("heal", function(source, args, raw)
    if isAllowedTo(source, "admin") then
        if args[1] and tonumber(args[1]) then
            local xPlayerArgs = ESX.GetPlayerFromId(args[1])
            if xPlayerArgs then
                xPlayerArgs.triggerEvent("esx_status:set", "hunger", 1000000)
                xPlayerArgs.triggerEvent("esx_status:set", "thirst", 1000000)
                xPlayerArgs.triggerEvent("esx_status:set", "stress", 0)
            end
        else
            local xPlayer = ESX.GetPlayerFromId(source)
            xPlayer.triggerEvent("esx_status:set", "hunger", 1000000)
            xPlayer.triggerEvent("esx_status:set", "thirst", 1000000)
            xPlayer.triggerEvent("esx_status:set", "stress", 0)
        end
        TriggerEvent("staffmanagement:LogSystem", raw, source)
    end
end, false)

RegisterCommand("revive", function(source, args, raw)
    if isAllowedTo(source, "support") then
        if args[1] and tonumber(args[1]) then
            if GetPlayerName(tonumber(args[1])) ~= nil then
                TriggerClientEvent("esx_ambulancejob:revive", tonumber(args[1]))
            end
        else
            TriggerClientEvent("esx_ambulancejob:revive", source)
        end
        TriggerEvent("staffmanagement:LogSystem", raw, source)
    end
end, false)

RegisterCommand('giveaccountmoney', function(source, args, raw)
    if isAllowedTo(source, "admin") then
        if args[1] and tonumber(args[1]) and args[2] and args[3] and tonumber(args[3]) then
            local xTarget = ESX.GetPlayerFromId(args[1])
            if xTarget then
                if xTarget.getAccount(args[2]) then
                    xTarget.addAccountMoney(args[2], tonumber(args[3]))
                    TriggerEvent("staffmanagement:LogSystem", raw, source)
                else
                    TriggerClientEvent('esx:showNotification', source, "ESX",
                        "Conta inválida", 2000, "error")
                end
            end
        end
    end
end)
--[[
RegisterCommand('giveitem', function(source, args, raw)
    if isAllowedTo(source, "admin") then
        if args[1] and tonumber(args[1]) and args[2] and args[3] and tonumber(args[3]) then
            local xPlayer = ESX.GetPlayerFromId(args[1])
            if xPlayer then
                if xPlayer.canCarryItem(args[2], tonumber(args[3])) then
                    xPlayer.addInventoryItem(args[2], args[3])
                    TriggerEvent("staffmanagement:LogSystem", raw, source)
                else
                    TriggerClientEvent('esx:showNotification', source, "ESX",
                        "O jogador tem o inventário cheio", 2000, "error")
                end
            end
        end
        TriggerEvent("staffmanagement:LogSystem", raw, source)
    end
end)

RegisterCommand('giveweapon', function(source, args, raw)
    if isAllowedTo(source, "admin") then
        if args[1] and tonumber(args[1]) and args[2] and args[3] and tonumber(args[3]) then
            local xPlayer = ESX.GetPlayerFromId(args[1])
            if xPlayer then
                if not xPlayer.hasWeapon(args[2]) then
                    xPlayer.addWeapon(args[2], args[3])
                    TriggerEvent("staffmanagement:LogSystem", raw, source)
                else
                    TriggerClientEvent('esx:showNotification', source, "ESX",
                        "O jogador já tem essa arma", 2000, "error")
                end
            end
        end
        TriggerEvent("staffmanagement:LogSystem", raw, source)
    end
end)
]]
RegisterCommand("clear", function(source, args, raw)
    TriggerClientEvent('chat:clear', source)
end)

RegisterCommand('clearall', function(source, args, raw)
    if isAllowedTo(source, "admin") then
        TriggerClientEvent('chat:clear', -1)
        TriggerEvent("staffmanagement:LogSystem", raw, source)
    end
end)

RegisterCommand("refreshjobs", function(source, args, raw)
    if isAllowedTo(source, "headadmin") then
        ESX.RefreshJobs()
        TriggerEvent("staffmanagement:LogSystem", raw, source)
    end
end)

RegisterCommand('clearinventory', function(source, args, raw)
    if isAllowedTo(source, "admin") then
        if not args[1] or not tonumber(args[1]) then return end
        local xPlayer = ESX.GetPlayerFromId(tonumber(args[1]))
        if not xPlayer then return end
        for k, v in ipairs(xPlayer.inventory) do
            if v.count > 0 then
                xPlayer.setInventoryItem(v.name, 0)
            end
        end
        TriggerEvent('esx:playerInventoryCleared', xPlayer)
        TriggerEvent("staffmanagement:LogSystem", raw, source)
    end
end)

RegisterCommand('clearloadout', function(source, args, raw)
    if isAllowedTo(source, "admin") then
        if not args[1] or not tonumber(args[1]) then return end
        local xPlayer = ESX.GetPlayerFromId(tonumber(args[1]))
        if not xPlayer then return end
        for i = #xPlayer.loadout, 1, -1 do
            xPlayer.removeWeapon(xPlayer.loadout[i].name)
        end
        TriggerEvent('esx:playerLoadoutCleared', xPlayer)
        TriggerEvent("staffmanagement:LogSystem", raw, source)
    end
end)

RegisterCommand('setgroup', function(source, args, raw)
    if isAllowedTo(source, "headadmin") then
        local xPlayer = ESX.GetPlayerFromId(tonumber(args[1]))
        if not xPlayer then return end
        xPlayer.setGroup(args[2])
        TriggerEvent("staffmanagement:LogSystem", raw, source)
    end
end)

RegisterCommand("adminstash", function(source, args, raw)
    if isAllowedTo(source, "admin") then
        TriggerEvent("staffmanagement:LogSystem", raw, source)
        local value = math.random(1, 99999999)
        TriggerClientEvent('inventory:openInventory', source, {
            type = "stash",
            id = value,
            title = "AdminStash",
            weight = 100,
            delay = 0,
            save = false
        })
    end
end)

RegisterCommand("addvip", function(source, args, raw)
    if isAllowedTo(source, "headadmin") and args[1] and args[2] then
        MySQL.query("SELECT * FROM vipcars WHERE CarID = ?", { args[1] }, function(result)
            if result[1] then
                TriggerClientEvent('esx:showNotification', source, "Carro VIP",
                    "Este carro já está na lista de VIP", 2000, "error")
            else
                MySQL.query("INSERT INTO vipcars (CarID, CarLabel) VALUES (?, ?)", { args[1], args[2] })
            end
            TriggerEvent("staffmanagement:LogSystem", raw, source)
        end)
        TriggerEvent("staffmanagement:LogSystem", raw, source)
    end
end)

RegisterCommand('givevip', function(source, args, raw)
    if isAllowedTo(source, "headadmin") and tonumber(args[1]) then
        MySQL.query("SELECT * FROM vipcars", {}, function(result)
            TriggerClientEvent("staffmanagement:GiveVipMenu", source, tonumber(args[1]), result)
            TriggerEvent("staffmanagement:LogSystem", raw, source)
        end)
        TriggerEvent("staffmanagement:LogSystem", raw, source)
    end
end)

RegisterServerEvent("staffmanagement:GiveVip")
AddEventHandler("staffmanagement:GiveVip", function(target, carro, label)
    local _source = source
    if isAllowedTo(_source, "headadmin") then
        local xPlayer = ESX.GetPlayerFromId(_source)
        local xTarget = ESX.GetPlayerFromId(target)
        MySQL.query("INSERT INTO owned_vehicles (owner, state, plate, vehicle, type, job, x, y, z, h, health) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)"
            , {
                xTarget.identifier,
                0,
                carro.plate,
                json.encode(carro),
                "car",
                "",
                236.1836,
                -797.7225,
                30.4828,
                68.3866,
                1000
            }, function(result)
            TriggerClientEvent("esx:showNotification", xTarget.source, "Carro VIP",
                "Recebeste um carro VIP: " .. label, 2000, "success")
            TriggerClientEvent("esx:showNotification", xPlayer.source, "Carro VIP",
                "Deste um carro VIP (" .. label .. ") ao " .. xTarget.name, 2000, "success")
            exports["Pack"]:LogToDiscord(_source,
                "https://discord.com/api/webhooks/1047951811006431322/L4FRGHng8NKG2gnbtS3nyRveATGBHESYqbfdj6RuuVJVX_L1DNyy-NEjZrmUeximySI3"
                , "Carro VIP",
                "**Info: ** O jogador " ..
                xPlayer.name ..
                " (" ..
                xPlayer.identifier ..
                ") deu um carro VIP (" .. label .. ") ao " .. xTarget.name .. " (" .. xTarget.identifier .. ")")
            TriggerClientEvent("InfinityPhone:client:updateVehState", _source, carro.plate, "A", 3)
        end)
    else
        TriggerEvent("InfinityAC:ban", "Injeção de eventos detetada", _source)
    end
end)

RegisterCommand("mapper", function (source, args, raw)
    if isAllowedTo(source, "owner") then
        TriggerClientEvent('mapper:toggle', source)
        TriggerEvent("staffmanagement:LogSystem", raw, source)
    end
end)