RegisterServerEvent('esx_barbershop:pay')
AddEventHandler('esx_barbershop:pay', function()
	local source = source
	local xPlayer = ESX.GetPlayerFromId(source)

	xPlayer.removeMoney(Config.Price, "Haircut")
    TriggerClientEvent('esx:showNotification', source, "ESCOLA DE CONDUÇÃO", _U('you_paid', ESX.Math.GroupDigits(Config.Price)), 2000, "success")
end)

ESX.RegisterServerCallback('esx_barbershop:checkMoney', function(source, cb)
	local xPlayer = ESX.GetPlayerFromId(source)

	cb(xPlayer.getMoney() >= Config.Price)
end)
