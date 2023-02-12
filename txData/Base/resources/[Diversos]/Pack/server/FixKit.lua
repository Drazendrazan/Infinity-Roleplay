ESX.RegisterUsableItem('fixkit', function(source)
	local _source = source

	TriggerClientEvent('esx_repairkit:onUse', _source)
end)

RegisterNetEvent('esx_repairkit:removeKit')
AddEventHandler('esx_repairkit:removeKit', function()
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)

	xPlayer.removeInventoryItem('fixkit', 1)
	TriggerClientEvent('esx:showNotification', _source, "KIT DE REPARAÇÃO", "Você usou um kit de reparação", 2000, "success")
end)

RegisterServerEvent("esx_repairkit:onUse")
AddEventHandler("esx_repairkit:onUse", function ()
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	if xPlayer.hasItem("fixkit") then
		TriggerClientEvent("esx_repairkit:onUse", _source)
	else
		TriggerClientEvent('esx:showNotification', _source, "KIT DE REPARAÇÃO", "Você não tem um kit de reparação", 2000, "error")
	end
end)