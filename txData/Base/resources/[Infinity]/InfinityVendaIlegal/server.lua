local prices = {
	rolex = 725*2,
	anel = 1225*2,
	diamond_box = 5600*2,
	gold_chain = 950*2,
	diamond = 2600*2,
	vanDiamond = 30000*2,
	vanBottle = 50000*2,
	vanPanther = 100000*2,
	vanNecklace = 75000*2,
	quadro = 12500*2
}


ESX.RegisterServerCallback("InfinityVendaIlegal:getItemsToSell", function(source, cb)
	local xPlayer = ESX.GetPlayerFromId(source)
	local inventory = xPlayer.getInventory()
	local itemstosell = {}
	local empty = true
	local solditem = {}
	while inventory == nil do
		Citizen.Wait(100)
	end
	for key, value in pairs(inventory) do
		if (inventory[key].name == "anel" and inventory[key].count > 0) or
		(inventory[key].name == "rolex" and inventory[key].count > 0) or
		(inventory[key].name == "diamond_box" and inventory[key].count > 0)  or
		(inventory[key].name == "gold_chain" and inventory[key].count > 0) or
		(inventory[key].name == "vanDiamond" and inventory[key].count > 0) or
		(inventory[key].name == "vanPanther" and inventory[key].count > 0) or
		(inventory[key].name == "vanBottle" and inventory[key].count > 0) or
		(inventory[key].name == "vanNecklace" and inventory[key].count > 0) or
		(inventory[key].name == "quadro" and inventory[key].count > 0) or
		(inventory[key].name == "diamond" and inventory[key].count > 0) then
				empty = false
				table.insert(itemstosell, inventory[key])
		end
	end
	if empty == false then
		solditem = itemstosell[math.random(1, #itemstosell)]
		if solditem.name == "rolex" then
			solditem.price = prices.rolex
		elseif solditem.name == "anel" then
			solditem.price = prices.anel
		elseif solditem.name == "diamond_box" then
			solditem.price = prices.diamond_box
		elseif solditem.name == "gold_chain" then
			solditem.price = prices.gold_chain
		elseif solditem.name == "diamond" then
			solditem.price = prices.diamond
		elseif solditem.name == "vanDiamond" then
			solditem.price = prices.vanDiamond
		elseif solditem.name == "vanBottle" then
			solditem.price = prices.vanBottle
		elseif solditem.name == "vanPanther" then
			solditem.price = prices.vanPanther
		elseif solditem.name == "vanNecklace" then
			solditem.price = prices.vanNecklace
		elseif solditem.name == "quadro" then
			solditem.price = prices.quadro
		end
		cb(solditem)
	else
		cb(false)
	end
end)

RegisterNetEvent("InfinityVendaIlegal:removeitem")
AddEventHandler("InfinityVendaIlegal:removeitem", function(item, count)
   	local xPlayer = ESX.GetPlayerFromId(source)
   	xPlayer.removeInventoryItem(item, count)
end)

RegisterNetEvent("InfinityVendaIlegal:addmoney")
AddEventHandler("InfinityVendaIlegal:addmoney", function(count)
   	local xPlayer = ESX.GetPlayerFromId(source)
   	xPlayer.addMoney(count)
end)



