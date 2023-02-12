ESX = exports['es_extended']:getSharedObject()
--
--TriggerEvent(Config.ESXPrefix..':'..Config.getSharedObject, function(obj) ESX = obj end)

local WebhookLink = 'https://discord.com/api/webhooks/1039626541962903694/8KYJaPfYw7It8ZzyNERj9fjUNKr82OlV4-ZDvRnGfHdmvOtYRKkYNePS6VU_Qq0_JW_N' -- PUT YOUR WEBHOOK LINK HERE

function Webhook()
	return WebhookLink
end

function ESXf()
	local ESXf = nil
	--TriggerEvent(Config.ESXPrefix..':'..Config.getSharedObject, function(obj) ESXf = obj end)
	ESXf = exports['es_extended']:getSharedObject()
	return ESXf
end

function MySQLexecute(query, values, func)
	return MySQL.Async.execute(query, values, func)
end

function MySQLfetchAll(query, values, func)
	return MySQL.Async.fetchAll(query, values, func)
end

function MySQLinsert(query, values, func)
	return MySQL.Async.insert(query, values, func)
end

function addMoney(xPlayer, account, amount)
	xPlayer.addAccountMoney(account, tonumber(amount))
end

function removeMoney(xPlayer, account, amount)
	xPlayer.removeAccountMoney(account, tonumber(amount))
end

function isAdminF(source)
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	local playerGroup = xPlayer.getGroup()
	local isAdmin = false

	for k, v in ipairs(Config.AdminGroups) do
		if playerGroup == v then
			isAdmin = true
			break
		end
	end

	return isAdmin
end

local vehicleCategories = {
	police = {
		{ name = 'camaroRB' },
		{ name = 'polchar' },
		{ name = 'polraptor' },
		{ name = 'poltah' },
		{ name = 'poltaurus' },
		{ name = 'polvic' },
	}
}

RegisterServerEvent(Config.EventPrefix .. ':VehicleBought')
AddEventHandler(Config.EventPrefix .. ':VehicleBought', function(source, vehicleModel, price)
	-- Execute code after vehicle has been bought
end)

function isPolice(model)
	for _, Police in pairs(vehicleCategories.police) do
		if (Police.name == model) then
			return true
		end
	end
	return false
end

RegisterServerEvent(Config.EventPrefix .. ':setVehicleOwned')
AddEventHandler(Config.EventPrefix .. ':setVehicleOwned', function(vehicleProps, model, id)
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)

	if isPolice(model) then
		MySQLexecute('INSERT INTO owned_vehicles (owner, plate, vehicle, type, job) VALUES (@owner, @plate, @vehicle, @type, @job)'
			, {
				['@owner'] = xPlayer.identifier,
				['@plate'] = vehicleProps.plate,
				['@vehicle'] = json.encode(vehicleProps),
				['@type'] = 'car',
				['@job'] = xPlayer.job.name,
			}, function(rowsChanged)
			TriggerClientEvent("InfinityPhone:client:updateVehState", _source, vehicleProps.plate, "A", 3)
		end)
	else
		MySQLexecute('INSERT INTO owned_vehicles (owner, plate, vehicle) VALUES (@owner, @plate, @vehicle)', {
			['@owner'] = xPlayer.identifier,
			['@plate'] = vehicleProps.plate,
			['@vehicle'] = json.encode(vehicleProps)
		}, function(rowsChanged)
			TriggerClientEvent("InfinityPhone:client:updateVehState", _source, vehicleProps.plate, "A", 3)
		end)
	end
end)

ESX.RegisterServerCallback(Config.EventPrefix .. ":HasLicense", function(source, cb, license)
	local hasLicense = false

	if license == "" then
		hasLicense = true
	elseif license == "boat" then
		-- Add the checks to see if the player has the license
		hasLicense = true
	end

	cb(hasLicense)
end)

ESX.RegisterServerCallback(Config.EventPrefix .. ":canOpenMenu", function(source, cb, shop_id)
	local canOpenShop = true
	if shop_id == "dpls" then
		canOpenShop = false
		if ESX.GetPlayerFromId(source).job.name == "police" then
			canOpenShop = true
		end
	end
	-- Here you can make the verifications you want,
	-- For example check if a no VIP person is trying to open a VIP shop, if so change canOpenShop to false

	cb(canOpenShop)
end)
