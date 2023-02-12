local societies = {
	["society_police"] = "DPLS",
	["society_ambulance"] = "SEM",
	["society_mechanic"] = "Bennys",
	["society_lawyer"] = "Saul Goodman",
	["society_gato"] = "UwU Café",
}

RegisterServerEvent('InfinityPhone:server:RefreshBills')
AddEventHandler("InfinityPhone:server:RefreshBills", function()
    local src = source
	local xPlayer = ESX.GetPlayerFromId(source)
	MySQL.Async.fetchAll('SELECT * FROM billing WHERE identifier = @identifier', {
		['@identifier'] = xPlayer.getIdentifier()
	}, function(result)
		local bills = {}
		for i=1, #result, 1 do
			table.insert(bills, {
				id         = result[i].id,
				sender     = societies[result[i].target] or "Não encontrado",
				label      = result[i].label,
				amount     = result[i].amount
			})
		end
		TriggerClientEvent('InfinityPhone:client:SetupData', src, {
			{ name = 'faturas', data = bills }
		})
	end)
end)


ESX.RegisterServerCallback("InfinityPhone:server:payBill", function(source, cb, data)
	local xPlayer = ESX.GetPlayerFromId(source)

	MySQL.Async.fetchAll('SELECT * FROM billing WHERE id = @id', {
		['@id'] = data.id
	}, function(result)
		if result ~= nil then
			local sender     = result[1].sender
			local targetType = result[1].target_type
			local target     = result[1].target
			local amount     = result[1].amount

			local xTarget = ESX.GetPlayerFromIdentifier(sender)
			if targetType == 'player' then

				if xTarget ~= nil then

					if xPlayer.getMoney() >= amount then

						MySQL.Async.execute('DELETE from billing WHERE id = @id', {
							['@id'] = data.id
						}, function(rowsChanged)
							xPlayer.removeMoney(amount)
							xTarget.addMoney(amount)
							TriggerClientEvent('esx:showNotification', xTarget.source, "Telemóvel", "Pagamento Recebido " .. ESX.Math.GroupDigits(amount).. " Euros", 2000, 'success')
							cb(true)
						end)

					elseif xPlayer.getAccount("bank").money >= amount then

						MySQL.Async.execute('DELETE from billing WHERE id = @id', {
							['@id'] = data.id
						}, function(rowsChanged)
							xPlayer.removeAccountMoney('bank', amount)
							xTarget.addAccountMoney('bank', amount)
							TriggerClientEvent('esx:showNotification', xTarget.source, "Telemóvel", "Pagamento Recebido " .. ESX.Math.GroupDigits(amount).. " Euros", 2000, 'success')
							cb(true)
						end)

					else
						cb(-1)
					end
				end
			else
				TriggerEvent('esx_addonaccount:getSharedAccount', target, function(account)

					if xPlayer.getMoney() >= amount then

						MySQL.Async.execute('DELETE from billing WHERE id = @id', {
							['@id'] = data.id
						}, function(rowsChanged)
							if rowsChanged > 0 then
								xPlayer.removeMoney(amount)
								account.addMoney(amount)
								if xTarget ~= nil then
									TriggerClientEvent('esx:showNotification', xTarget.source, "Telemóvel", "Pagamento Recebido " .. ESX.Math.GroupDigits(amount).. " Euros", 2000, 'success')
								end

								cb(true)
							else
								cb(-3)
							end
						end)

					elseif xPlayer.getAccount("bank").money >= amount then

						MySQL.Async.execute('DELETE from billing WHERE id = @id', {
							['@id'] = data.id
						}, function(rowsChanged)
							if rowsChanged > 0 then
								xPlayer.removeAccountMoney('bank', amount)
								account.addMoney(amount)
								if xTarget ~= nil then
									TriggerClientEvent('esx:showNotification', xTarget.source, "Telemóvel", "Pagamento Recebido " .. ESX.Math.GroupDigits(amount).. " Euros", 2000, 'success')
								end
								cb(true)
							else
								cb(-3)
							end
						end)

					else
						cb(-1)
					end
				end)

			end
		else
			cb(-3)
		end
	end)
end)