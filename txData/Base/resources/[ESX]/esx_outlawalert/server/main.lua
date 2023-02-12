RegisterServerEvent('esx_outlawalert:GetMyName')
AddEventHandler('esx_outlawalert:GetMyName', function()
    local src = source
    local firstname = nil
    local xPlayer = ESX.GetPlayerFromId(source)
    if not xPlayer then return end
    local identifier = xPlayer.identifier
	MySQL.Async.fetchAll('SELECT firstname, lastname FROM users WHERE identifier = @identifier', {
		['@identifier'] = identifier
	}, function(result)
		if result[1].firstname ~= nil then
			firstname = result[1].firstname
            lastname = result[1].lastname
        else
            firstname = 'Desconhecido'
            lastname = ''
		end
    end)

    while firstname == nil do
        Citizen.Wait(100)
    end

    TriggerClientEvent('esx_outlawalert:setMyName', src, firstname.." "..lastname)
end)

ESX.RegisterServerCallback('esx_outlawalert:isVehicleOwner', function(source, cb, plate)
    local owner = GetPlayerIdentifiers(source)[1]
	MySQL.Async.fetchAll('SELECT owner FROM owned_vehicles WHERE plate = @plate' , {
        ['@plate'] = plate
    }, function(result)
        if result[1] == owner then
            cb(true)
		else
			cb(false)
		end
	end)
end)

RegisterServerEvent('esx_outlawalert:Vangelico')
AddEventHandler('esx_outlawalert:Vangelico', function(job, title, desc, emote, emote2, number, x, y, z, blipID, color, code)
    if job ~= nil then
        TriggerClientEvent('esx_outlawalert:NewAlert', -1, job, title, desc, emote, emote2, number, x, y, z, blipID, color, code)
    end
end, false)

RegisterServerEvent('esx_outlawalert:houseRobberyinProgress')
AddEventHandler('esx_outlawalert:houseRobberyinProgress', function(job, title, desc, emote, emote2, number, x, y, z, blipID, color, code)
    if job ~= nil then
        TriggerClientEvent('esx_outlawalert:NewAlert', -1, job, title, desc, emote, emote2, number, x, y, z, blipID, color, code)
    end
end, false)

RegisterServerEvent('esx_outlawalert:gunshotInProgress')
AddEventHandler('esx_outlawalert:gunshotInProgress', function(job, job2, title, desc, emote, emote2, number, x, y, z, blipID, color, code)
    if job ~= nil then
        TriggerClientEvent('esx_outlawalert:NewAlert', -1, job, title, desc, emote, emote2, number, x, y, z, blipID, color, code)
    end
    if job2 ~= nil then
        TriggerClientEvent('esx_outlawalert:NewAlert', -1, job2, title, desc, emote, emote2, number, x, y, z, blipID, color, code)
    end
end, false)

RegisterServerEvent('esx_outlawalert:drugsaleInProgress')
AddEventHandler('esx_outlawalert:drugsaleInProgress', function(job, title, desc, emote, emote2, number, x, y, z, blipID, color, code)
    if job ~= nil then
        TriggerClientEvent('esx_outlawalert:NewAlert', -1, job, title, desc, emote, emote2, number, x, y, z, blipID, color, code)
    end
end, false)

RegisterServerEvent('esx_outlawalert:shoprobberyInProgress')
AddEventHandler('esx_outlawalert:shoprobberyInProgress', function(job, title, desc, emote, emote2, number, x, y, z, blipID, color, code)
    if job ~= nil then
        TriggerClientEvent('esx_outlawalert:NewAlert', -1, job, title, desc, emote, emote2, number, x, y, z, blipID, color, code)
    end
end, false)

--

RegisterServerEvent('esx_outlawalert:carJackInProgress')
AddEventHandler('esx_outlawalert:carJackInProgress', function(job, job2, title, desc, emote, emote2, number, x, y, z, blipID, color, code)
    if job ~= nil and job2 ~= nil then
        TriggerClientEvent('esx_outlawalert:NewAlert', -1, job, title, desc, emote, emote2, number, x, y, z, blipID, color, code)
        TriggerClientEvent('esx_outlawalert:NewAlert', -1, job2, title, desc, emote, emote2, number, x, y, z, blipID, color, code)
    end
end, false)

--

RegisterServerEvent('esx_outlawalert:server:NewAlert')
AddEventHandler('esx_outlawalert:server:NewAlert', function(job, job2, title, desc, emote, emote2, number, x, y, z, blipID, color, code)
    if job ~= nil then
        TriggerClientEvent('esx_outlawalert:NewAlert', -1, job, title, desc, emote, emote2, number, x, y, z, blipID, color, code)
    end
    if job2 ~= nil then
        TriggerClientEvent('esx_outlawalert:NewAlert', -1, job2, title, desc, emote, emote2, number, x, y, z, blipID, color, code)
    end
end, false)


RegisterServerEvent('esx_outlawalert:send911')
AddEventHandler('esx_outlawalert:send911', function(job, job2, job3, title, desc, emote, emote2, number, x, y, z, blipID, color, code)
    local src = source
    local xPlayer = ESX.GetPlayerFromId(src)
    local telele = xPlayer.getInventoryItem('phone').count
    if telele >= 1 then
	  if job ~= nil then
          TriggerClientEvent('esx_outlawalert:NewAlert', -1, job, title, desc, emote, emote2, number, x, y, z, blipID, color, code)
      end
      if job2 ~= nil then
          TriggerClientEvent('esx_outlawalert:NewAlert', -1, job2, title, desc, emote, emote2, number, x, y, z, blipID, color, code)
      end
      if job3 ~= nil then
          TriggerClientEvent('esx_outlawalert:NewAlert', -1, job3, title, desc, emote, emote2, number, x, y, z, blipID, color, code)
      end
    else
        TriggerClientEvent('mythic_notify:client:SendAlert', src, {type = 'error', text = 'Não tens telemovel.'})  
    end
end, false)

RegisterServerEvent('esx_outlawalert:sendmecanicos')
AddEventHandler('esx_outlawalert:sendmecanicos', function(job, job2, title, desc, emote, emote2, number, x, y, z, blipID, color, code)
	if job ~= nil then
        TriggerClientEvent('esx_outlawalert:NewAlert', -1, job, title, desc, emote, emote2, number, x, y, z, blipID, color, code)
    end
	if job2 ~= nil then
        TriggerClientEvent('esx_outlawalert:NewAlert', -1, job2, title, desc, emote, emote2, number, x, y, z, blipID, color, code)
    end
end, false)

RegisterServerEvent('esx_outlawalert:sendPanic')
AddEventHandler('esx_outlawalert:sendPanic', function(job, job2, job3, title, desc, emote, emote2, number, x, y, z, blipID, color, code)
    local src = source
    local xPlayer = ESX.GetPlayerFromId(src)
    local telele = xPlayer.getInventoryItem('radio').count
    if telele >= 1 then
	  if job ~= nil and job2 ~= nil and job3 ~= nil then
          TriggerClientEvent('esx_outlawalert:NewAlert', -1, job, title, desc, emote, emote2, number, x, y, z, blipID, color, code)
          TriggerClientEvent('esx_outlawalert:NewAlert', -1, job2, title, desc, emote, emote2, number, x, y, z, blipID, color, code)
          TriggerClientEvent('esx_outlawalert:NewAlert', -1, job3, title, desc, emote, emote2, number, x, y, z, blipID, color, code)
          TriggerClientEvent('esx_outlawalert:PlaySoundPanic', src)
      end
    else
        xPlayer.showNotification("PÂNICO", 'Não tens rádio', 2000, "warning")
    end
end, false)


