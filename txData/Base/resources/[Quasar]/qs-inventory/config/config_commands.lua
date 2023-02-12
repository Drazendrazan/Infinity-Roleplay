--░█████╗░░█████╗░███╗░░░███╗███╗░░░███╗░█████╗░███╗░░██╗██████╗░░██████╗
--██╔══██╗██╔══██╗████╗░████║████╗░████║██╔══██╗████╗░██║██╔══██╗██╔════╝
--██║░░╚═╝██║░░██║██╔████╔██║██╔████╔██║███████║██╔██╗██║██║░░██║╚█████╗░
--██║░░██╗██║░░██║██║╚██╔╝██║██║╚██╔╝██║██╔══██║██║╚████║██║░░██║░╚═══██╗
--╚█████╔╝╚█████╔╝██║░╚═╝░██║██║░╚═╝░██║██║░░██║██║░╚███║██████╔╝██████╔╝
--░╚════╝░░╚════╝░╚═╝░░░░░╚═╝╚═╝░░░░░╚═╝╚═╝░░╚═╝╚═╝░░╚══╝╚═════╝░╚═════╝░

--RegisterCommand("repairweapon", function(source, args, rawCommand)
--    if exports["StaffManagement"]:isAllowedTo(source, "headadmin") then
--        local xPlayer = ESX.GetPlayerFromId(source)
--        if args[1] and tonumber(args[1]) then
--            TriggerClientEvent('weapons:client:SetWeaponQuality', xPlayer.source, tonumber(args[1]))
--        else
--            TriggerClientEvent('weapons:client:SetWeaponQuality', xPlayer.source, 100)
--        end
--    end
--end)

RegisterCommand("changeserie", function(source, args, rawCommand)
    if exports["StaffManagement"]:isAllowedTo(source, "headadmin") then
        local xPlayer = ESX.GetPlayerFromId(source)
        TriggerClientEvent('weapons:client:SetWeaponSerie', xPlayer.source)
    end
end)

ESX.RegisterCommand(Config.Commands["giveweapon"], 'admin', function(xPlayer, args)
    if exports["StaffManagement"]:isAllowedTo(xPlayer.source, "admin") then
        TriggerEvent('giveweapon:command', args)
    end
end, true, { help = 'Giveitem', validate = false, arguments = {
    { name = 'player', help = 'Player ID', type = 'number' },
    { name = 'weapon', help = 'Weapon Name', type = 'string' },
    { name = 'ammo', help = 'Quantity of bullets', type = 'number' }
} })

--RegisterCommand(Config.Commands["giveweaponcolor"], function(source, args, rawCommand)
--    if exports["StaffManagement"]:isAllowedTo(source, "headadmin") then
--        TriggerEvent('giveweaponcolor:command', args)
--    end
--end)

ESX.RegisterCommand(Config.Commands["giveitem"], 'admin', function(xPlayer, args)
    if exports["StaffManagement"]:isAllowedTo(xPlayer.source, "admin") then
        TriggerEvent('giveitem:command', args)
    end
end, true, {help = 'Giveitem', validate = true, arguments = {
    {name = 'player', help = 'Player', type = 'number'},
    {name = 'item', help = 'Item name', type = 'string'},
    {name = 'count', help = 'Quantity', type = 'number'}
}})

--RegisterCommand(Config.Commands["randomitems"], function(source, args, rawCommand)
--    if exports["StaffManagement"]:isAllowedTo(source, "headadmin") then
--        local xPlayer = ESX.GetPlayerFromId(source)
--        TriggerEvent('randomitems:command', xPlayer.source)
--    end
--end)

ESX.RegisterCommand(Config.Commands["clearinventory"], "admin", function(xPlayer, args)
    if exports["StaffManagement"]:isAllowedTo(xPlayer.source, "admin") then
        local xPlayer = ESX.GetPlayerFromId(xPlayer.source)
        TriggerEvent('clearinventory:command', xPlayer.source, args)
    end
end)

RegisterCommand(Config.Commands["openinventorytarget"], function(source, args, rawCommand)
    if exports["StaffManagement"]:isAllowedTo(source, "headadmin") then
        local xPlayer = ESX.GetPlayerFromId(source)
        if args[1] then
            local Player = QS.GetPlayerFromId(tonumber(args[1]))
            if Player then
                TriggerClientEvent('inventory:client:RobPlayer:Admin', xPlayer.source, tonumber(args[1]))
            else
                TriggerClientEvent('esx:showNotification', xPlayer.source, "Jogador não encontrado")
            end
        end
    end
end)

RegisterCommand(Config.Commands["opentrunk"], function(source, args, rawCommand)
    if exports["StaffManagement"]:isAllowedTo(source, "headadmin") then
        local xPlayer = ESX.GetPlayerFromId(source)
        local plate
        if args[1] then
            if args[1] and args[2] and args[3] then
                plate = args[1] .. ' ' .. args[2] .. args[3]
            else
                plate = args[1]
            end
            local other = {
                maxweight = 100000,
                slots = 41,
            }
            TriggerClientEvent('inventory:server:Trunk:Admin', xPlayer.source, plate, other)
        end
    end
end)

RegisterCommand(Config.Commands["openglovebox"], function(source, args, rawCommand)
    if exports["StaffManagement"]:isAllowedTo(source, "headadmin") then
        local xPlayer = ESX.GetPlayerFromId(source)
        local plate
        if args[1] then
            if args[1] and args[2] and args[3] then
                plate = args[1] .. ' ' .. args[2] .. args[3]
            else
                plate = args[1]
            end
            TriggerClientEvent('inventory:server:Glovebox:Admin', xPlayer.source, plate)
        end
    end
end)
