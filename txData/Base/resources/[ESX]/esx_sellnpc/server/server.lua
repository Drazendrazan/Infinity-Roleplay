itemprice, itemamount = 0, 0

local prices = {
	bagofdope = 150,
	bagofmeth = 250
}

ESX.RegisterServerCallback("esx_sellnpc:getItemsToSell", function(source, cb)
	local xPlayer = ESX.GetPlayerFromId(source)
	local inventory = xPlayer.getInventory()
	local itemstosell = {}
	local empty = true
	local solditem = {}
	while inventory == nil do
		Citizen.Wait(100)
	end
	for key, value in pairs(inventory) do
		if (inventory[key].name == "bagofdope" and inventory[key].count > 0) or
			(inventory[key].name == "bagofmeth" and inventory[key].count > 0) then
			empty = false
			table.insert(itemstosell, inventory[key])
		end
	end
	if empty == false then
		solditem = itemstosell[math.random(1, #itemstosell)]
		if solditem.name == "bagofdope" then
			solditem.price = prices.bagofdope
		elseif solditem.name == "bagofmeth" then
			solditem.price = prices.bagofmeth
		end
		cb(solditem)
	else
		cb(false)
	end
end)

ESX.RegisterServerCallback('Infinity:getJobsOnline', function(source, cb)
    local extendedplayers = ESX.GetExtendedPlayers("job", "police")
    cb(#extendedplayers)
end)


RegisterNetEvent("esx_sellnpc:removeitem")
AddEventHandler("esx_sellnpc:removeitem", function(item, count)
	local xPlayer = ESX.GetPlayerFromId(source)
	xPlayer.removeInventoryItem(item, count)
end)

RegisterNetEvent("esx_sellnpc:addmoney")
AddEventHandler("esx_sellnpc:addmoney", function(count)
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(source)
	xPlayer.addMoney(count)
	local log = "**Info:** Recebeu "..count.."€ por vender droga"
	exports["Pack"]:LogToDiscord(_source,
		"https://discord.com/api/webhooks/1039625212980891758/HqOzXm85bfyiIgAOT-np3QDW1odyhiAMOngPrmqH6g7NeRng3m72CKNEfSpT4Qphpog-"
		, "Venda de Droga", log)
end)
