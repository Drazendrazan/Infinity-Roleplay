RegisterServerEvent('InfinityMeth:start')
AddEventHandler('InfinityMeth:start', function()
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	if xPlayer.getInventoryItem('acetone').count >= 23 and xPlayer.getInventoryItem('lithium').count >= 14 and xPlayer.getInventoryItem('methlab').count >= 1 then
			TriggerClientEvent('InfinityMeth:startprod', _source)
			xPlayer.removeInventoryItem('acetone', 23)
			xPlayer.removeInventoryItem('lithium', 14)
	else
		xPlayer.showNotification("Metanfetamina", 'Não tens material suficiente para produzir a metanfetamina', 2000, 'error')
	end
end)

RegisterServerEvent('InfinityMeth:stopf')
AddEventHandler('InfinityMeth:stopf', function(id)
local _source = source
	local xPlayers = ESX.GetPlayers()
	for i=1, #xPlayers, 1 do
		TriggerClientEvent('InfinityMeth:stopfreeze', xPlayers[i], id)
	end
end)

RegisterServerEvent('InfinityMeth:make')
AddEventHandler('InfinityMeth:make', function(posx,posy,posz)
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	if xPlayer.getInventoryItem('methlab').count >= 1 then
		local xPlayers = ESX.GetPlayers()
		for i=1, #xPlayers, 1 do
			TriggerClientEvent('InfinityMeth:smoke',xPlayers[i],posx,posy,posz, 'a') 
		end
	else
		TriggerClientEvent('InfinityMeth:stop', _source)
	end
end)

RegisterServerEvent('InfinityMeth:finish')
AddEventHandler('InfinityMeth:finish', function(qualtiy)
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	print(qualtiy)
	if qualtiy < 20 then
		xPlayer.showNotification("Metanfetamina", 'Fraca Produção', 2000, 'error')
	elseif qualtiy < 30 then
		xPlayer.addInventoryItem('meth', 1)
	else 
		xPlayer.addInventoryItem('meth', 2)	
	end	
	TriggerClientEvent('InfinityMeth:stop')
end)

RegisterServerEvent('InfinityMeth:blow')
AddEventHandler('InfinityMeth:blow', function(posx, posy, posz)
	local _source = source
	local xPlayers = ESX.GetPlayers()
	local xPlayer = ESX.GetPlayerFromId(_source)
	for i=1, #xPlayers, 1 do
		TriggerClientEvent('InfinityMeth:blowup', xPlayers[i],posx, posy, posz)
	end
	xPlayer.removeInventoryItem('methlab', 1)
end)