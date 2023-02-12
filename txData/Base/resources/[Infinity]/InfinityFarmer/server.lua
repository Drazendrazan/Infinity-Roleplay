local playersProcessing = {}

RegisterServerEvent('InfinityFarmer:sell')
AddEventHandler('InfinityFarmer:sell', function(itemName, amount)
	local xPlayer = ESX.GetPlayerFromId(source)
	local price = config.items[itemName]
	local xItem = xPlayer.getInventoryItem(itemName)

	if not price then
		return
	end

	if xItem.count < amount then
		return
	end

	price = ESX.Math.Round(price * amount)
	xPlayer.addMoney(price)
	xPlayer.removeInventoryItem(xItem.label, amount)

end)

RegisterServerEvent('InfinityFarmer:pickedUp')
AddEventHandler('InfinityFarmer:pickedUp', function()
	local xPlayer = ESX.GetPlayerFromId(source)
	local quantity = math.random(8, 12)
		xPlayer.addInventoryItem('graodecafe', quantity)
end)

ESX.RegisterServerCallback('InfinityFarmer:canPickUp', function(source, cb, item)
	local xPlayer = ESX.GetPlayerFromId(source)
	local xItem = xPlayer.getInventoryItem(item)

	if xPlayer.canCarryItem(item, 1) then
		cb(true)
	else
		cb(false)
	end
end)
ESX.RegisterServerCallback('InfinityFarmer:haveItem', function(source, cb)
	local xPlayer = ESX.GetPlayerFromId(source)
	local xItem = xPlayer.getInventoryItem('foice')

	if xItem.count >= 1 then
		cb(true)
	else
		cb(false)
	end
end)

RegisterServerEvent('InfinityFarmer:process')
AddEventHandler('InfinityFarmer:process', function()
	if not playersProcessing[source] then
		local _source = source

		playersProcessing[_source] = ESX.SetTimeout(3500, function()
			
			local xPlayer = ESX.GetPlayerFromId(_source)
			local xMin = xPlayer.getInventoryItem('graodecafe')
		
			if xMin.count >= 7 then
				--editado conde enquanto crafting nao esta a funcionar:
				xPlayer.removeInventoryItem('graodecafe', 7)
				xPlayer.addInventoryItem('fertilizante', math.random(1, 3))		
					
			end

			playersProcessing[_source] = nil
		end)
	end
end)

function CancelProcessing(playerID)
	if playersProcessing[playerID] then
		ESX.ClearTimeout(playersProcessing[playerID])
		playersProcessing[playerID] = nil
	end
end

RegisterServerEvent('InfinityFarmer:cancelProcessing')
AddEventHandler('InfinityFarmer:cancelProcessing', function()
	CancelProcessing(source)
end)

AddEventHandler('esx:playerDropped', function(playerID, reason)
	CancelProcessing(playerID)
end)

RegisterServerEvent('esx:onPlayerDeath')
AddEventHandler('esx:onPlayerDeath', function(data)
	CancelProcessing(source)
end)
