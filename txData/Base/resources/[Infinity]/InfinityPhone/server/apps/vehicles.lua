RegisterServerEvent("InfinityPhone:server:getPlayerVehicles")
AddEventHandler("InfinityPhone:server:getPlayerVehicles", function()
	local src = source
	local player = ESX.GetPlayerFromId(src)
	if player then
		local responses = MySQL.query.await("SELECT * FROM owned_vehicles WHERE owner = @cid",
			{ ["@cid"] = player["identifier"] })
		local playerVehicles = {}

		for key, v in ipairs(responses) do
			local veh = json.decode(v.vehicle)
			table.insert(playerVehicles, {
				plate = v.plate,
				garage = v.garage,
				vehicle = veh,
				health = v.health,
				state = v.state,
				x = v.x,
				y = v.y,
				z = v.z,
				h = v.h
			})
		end
		TriggerClientEvent('InfinityPhone:client:SetupData', src, {
			{ name = 'cars', data = playerVehicles }
		})
	end
end)

RegisterServerEvent("InfinityPhone:server:UpdateVehConfigBD")
AddEventHandler("InfinityPhone:server:UpdateVehConfigBD", function(coords, heading, data, health)
	local source = source
	MySQL.Async.execute("UPDATE owned_vehicles SET x=@x, y=@y, z=@z, h=@h, health=@he, vehicle=@vehicle WHERE plate=@plate"
		, {
		['@x'] = coords.x,
		['@y'] = coords.y,
		['@z'] = coords.z,
		['@h'] = heading,
		['@he'] = health,
		['@vehicle'] = json.encode(data),
		['@plate'] = data.plate
	})
	TriggerClientEvent("InfinityPhone:client:UpdateVehConfig", source, coords, heading, data, health)
end)




-- soon

--[[ ESX.RegisterServerCallback("InfinityPhone:server:GetVehicleKeys", function(source, callback)
	local player = ESX.GetPlayerFromId(source)

	if player then

		MySQL.Async.fetchAll("SELECT * FROM vehicle_keys WHERE identifier = @identifier", {
			["@identifier"] = player["identifier"]
		}, function(responses)
			local playerKeys = {}

			for k, v in ipairs(responses) do
				table.insert(playerKeys, {
          			owner = v,
					plate = v
				})
			end

			callback(playerKeys)
		end)
	else
		callback(false)
	end
end) ]]
