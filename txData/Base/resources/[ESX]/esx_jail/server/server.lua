--RegisterCommand("jail", function(src, args, raw)
--
--	local xPlayer = ESX.GetPlayerFromId(src)
--
--	if xPlayer["job"]["name"] == "police" then
--
--		local jailPlayer = args[1]
--		local jailTime = tonumber(args[2])
--		local jailReason = args[3]
--
--		if GetPlayerName(jailPlayer) ~= nil then
--
--			if jailTime ~= nil then
--				JailPlayer(jailPlayer, jailTime)
--
--				--TriggerClientEvent("esx:showNotification", src, GetPlayerName(jailPlayer) .. " Jailed for " .. jailTime .. " minutes!")
--				
--				--if args[3] ~= nil then
--				--	GetRPName(jailPlayer, function(Firstname, Lastname)
--				--		TriggerClientEvent('chat:addMessage', -1, { args = { "JUDGE",  Firstname .. " " .. Lastname .. " Is now in jail for the reason: " .. args[3] }, color = { 249, 166, 0 } })
--				--	end)
--				--end
--			else
--				TriggerClientEvent("esx:showNotification", src, "PRISÃO", "Tempo inválido", 2000, "warning")
--			end
--		else
--			TriggerClientEvent("esx:showNotification", src, "PRISÃO", "ID inválido")
--		end
--	else
--		TriggerClientEvent("esx:showNotification", src, "You are not an officer!")
--	end
--end)

--RegisterCommand("unjail", function(src, args)
--
--	local xPlayer = ESX.GetPlayerFromId(src)
--
--	if xPlayer["job"]["name"] == "police" then
--
--		local jailPlayer = args[1]
--
--		if GetPlayerName(jailPlayer) ~= nil then
--			UnJail(jailPlayer)
--		else
--			TriggerClientEvent("esx:showNotification", src, "This ID is not online!")
--		end
--	else
--		TriggerClientEvent("esx:showNotification", src, "You are not an officer!")
--	end
--end)

RegisterServerEvent("jail:jailPlayer")
AddEventHandler("jail:jailPlayer", function(targetSrc, jailTime, jailReason)
	local src = source
	local targetSrc = tonumber(targetSrc)

	JailPlayer(targetSrc, jailTime)

	--GetRPName(targetSrc, function(Firstname, Lastname)
	--	TriggerClientEvent('chat:addMessage', -1, { args = { "JUDGE",  Firstname .. " " .. Lastname .. " Is now in jail for the reason: " .. jailReason }, color = { 249, 166, 0 } })
	--end)

	--TriggerClientEvent("esx:showNotification", src, GetPlayerName(targetSrc) .. " Jailed for " .. jailTime .. " minutes!")
end)

RegisterServerEvent("jail:unJailPlayer")
AddEventHandler("jail:unJailPlayer", function(targetIdentifier)
	local src = source
	local xPlayer = ESX.GetPlayerFromIdentifier(targetIdentifier)

	if xPlayer ~= nil then
		UnJail(xPlayer.source)
	else
		MySQL.Async.execute(
			"UPDATE users SET jail = @newJailTime WHERE identifier = @identifier",
			{
				['@identifier'] = targetIdentifier,
				['@newJailTime'] = 0
			}
		)
	end

	--TriggerClientEvent("esx:showNotification", src, xPlayer.name .. " Unjailed!")
end)

RegisterServerEvent("jail:updateJailTime")
AddEventHandler("jail:updateJailTime", function(newJailTime)
	local src = source

	EditJailTime(src, newJailTime)
end)

RegisterServerEvent("jail:prisonWorkReward")
AddEventHandler("jail:prisonWorkReward", function()
	local src = source

	local xPlayer = ESX.GetPlayerFromId(src)

	xPlayer.addMoney(math.random(13, 21))

	TriggerClientEvent("esx:showNotification", src, "PRISÃO", "Obrigado, toma algum dinheiro", 2000, "success")
end)

function JailPlayer(jailPlayer, jailTime)
	TriggerClientEvent("jail:jailPlayer", jailPlayer, jailTime)

	EditJailTime(jailPlayer, jailTime)
end

function UnJail(jailPlayer)
	TriggerClientEvent("jail:unJailPlayer", jailPlayer)

	EditJailTime(jailPlayer, 0)
end

function EditJailTime(source, jailTime)

	local src = source

	local xPlayer = ESX.GetPlayerFromId(src)
	local Identifier = xPlayer.identifier

	MySQL.Async.execute(
       "UPDATE users SET jail = @newJailTime WHERE identifier = @identifier",
        {
			['@identifier'] = Identifier,
			['@newJailTime'] = tonumber(jailTime)
		}
	)
end

function GetRPName(playerId, data)
	local Identifier = ESX.GetPlayerFromId(playerId).identifier

	MySQL.Async.fetchAll("SELECT firstname, lastname FROM users WHERE identifier = @identifier", { ["@identifier"] = Identifier }, function(result)

		data(result[1].firstname, result[1].lastname)

	end)
end

ESX.RegisterServerCallback("jail:retrieveJailedPlayers", function(source, cb)
	
	local jailedPersons = {}

	MySQL.Async.fetchAll("SELECT firstname, lastname, jail, identifier FROM users WHERE jail > @jail", { ["@jail"] = 0 }, function(result)

		for i = 1, #result, 1 do
			table.insert(jailedPersons, { name = result[i].firstname .. " " .. result[i].lastname, jailTime = result[i].jail, identifier = result[i].identifier })
		end

		cb(jailedPersons)
	end)
end)

ESX.RegisterServerCallback("jail:retrieveJailTime", function(source, cb)

	local src = source

	local xPlayer = ESX.GetPlayerFromId(src)
	local Identifier = xPlayer.identifier


	MySQL.Async.fetchAll("SELECT jail FROM users WHERE identifier = @identifier", { ["@identifier"] = Identifier }, function(result)

		local JailTime = tonumber(result[1].jail)

		if JailTime > 0 then

			cb(true, JailTime)
		else
			cb(false, 0)
		end

	end)
end)