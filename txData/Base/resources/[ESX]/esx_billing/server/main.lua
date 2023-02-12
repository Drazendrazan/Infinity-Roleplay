RegisterServerEvent('esx_billing:sendBill')
AddEventHandler('esx_billing:sendBill', function(playerId, sharedAccountName, label, amount)
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(source)
	local xTarget = ESX.GetPlayerFromId(playerId)
	amount = ESX.Math.Round(amount)

	if amount > 0 and xTarget then
		TriggerEvent('esx_addonaccount:getSharedAccount', sharedAccountName, function(account)
			if account then
				MySQL.insert('INSERT INTO billing (identifier, sender, target_type, target, label, amount) VALUES (?, ?, ?, ?, ?, ?)'
					, { xTarget.identifier, xPlayer.identifier, 'society', sharedAccountName, label, amount },
					function(rowsChanged)
						xTarget.showNotification("FATURAS", TranslateCap('received_invoice'), 2000, 'info')
					end)
			else
				MySQL.insert('INSERT INTO billing (identifier, sender, target_type, target, label, amount) VALUES (?, ?, ?, ?, ?, ?)'
					, { xTarget.identifier, xPlayer.identifier, 'player', xPlayer.identifier, label, amount },
					function(rowsChanged)
						xTarget.showNotification("FATURAS", TranslateCap('received_invoice'), 2000, 'info')
					end)
			end
		end)
		local log = "**Info:** Enviou uma fatura para " ..
			xTarget.name .. " (" .. xTarget.identifier .. ") no valor de " .. amount .. "€"
		exports["Pack"]:LogToDiscord(_source,
			"https://discord.com/api/webhooks/1039624427144491039/o6HBnQSPVP9ec8ZfMYll2YjmleqbfIp0cax_QDp2LV1yGPRv0mH3qUgoaBGxqgvRkIuZ"
			, "Faturas", log)
	end
end)

ESX.RegisterServerCallback('esx_billing:getBills', function(source, cb)
	local xPlayer = ESX.GetPlayerFromId(source)

	MySQL.query('SELECT amount, id, label FROM billing WHERE identifier = ?', { xPlayer.identifier },
		function(result)
			cb(result)
		end)
end)

ESX.RegisterServerCallback('esx_billing:getTargetBills', function(source, cb, target)
	local xPlayer = ESX.GetPlayerFromId(target)

	if xPlayer then
		MySQL.query('SELECT amount, id, label FROM billing WHERE identifier = ?', { xPlayer.identifier },
			function(result)
				cb(result)
			end)
	else
		cb({})
	end
end)

ESX.RegisterServerCallback('esx_billing:payBill', function(source, cb, billId)
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(source)

	MySQL.single('SELECT sender, target_type, target, amount FROM billing WHERE id = ?', { billId },
		function(result)
			if result then
				local amount = result.amount
				local xTarget = ESX.GetPlayerFromIdentifier(result.sender)

				if result.target_type == 'player' then
					if xTarget then
						if xPlayer.getAccount('bank').money >= amount then
							MySQL.update('DELETE FROM billing WHERE id = ?', { billId },
								function(rowsChanged)
									if rowsChanged == 1 then
										xPlayer.removeAccountMoney('bank', amount, "Bill Paid")
										xTarget.addAccountMoney('bank', amount, "Paid bill")

										xPlayer.showNotification("FATURAS", TranslateCap('paid_invoice', ESX.Math.GroupDigits(amount)), 2000, 'success')
										xTarget.showNotification("FATURAS", TranslateCap('received_payment', ESX.Math.GroupDigits(amount)), 2000, 'info')
									end

									cb()
								end)
						else
							xTarget.showNotification("FATURAS", TranslateCap('target_no_money'), 2000, 'info')
							xPlayer.showNotification("FATURAS", TranslateCap('no_money'), 2000, 'error')
							cb()
						end
					else
						xPlayer.showNotification("FATURAS", TranslateCap('player_not_online'), 2000, 'error')
						cb()
					end
				else
					TriggerEvent('esx_addonaccount:getSharedAccount', result.target, function(account)
						if xPlayer.getMoney() >= amount then
							MySQL.update('DELETE FROM billing WHERE id = ?', { billId },
								function(rowsChanged)
									if rowsChanged == 1 then
										xPlayer.removeMoney(amount, "Bill Paid")
										account.addMoney(amount)

										xPlayer.showNotification("FATURAS", TranslateCap('paid_invoice', ESX.Math.GroupDigits(amount)), 2000, 'success')
										if xTarget then
											xTarget.showNotification("FATURAS", TranslateCap('received_payment', ESX.Math.GroupDigits(amount)), 2000, 'info')
										end
									end

									cb()
								end)
						elseif xPlayer.getAccount('bank').money >= amount then
							MySQL.update('DELETE FROM billing WHERE id = ?', { billId },
								function(rowsChanged)
									if rowsChanged == 1 then
										xPlayer.removeAccountMoney('bank', amount, "Bill Paid")
										account.addMoney(amount)
										xPlayer.showNotification("FATURAS", TranslateCap('paid_invoice', ESX.Math.GroupDigits(amount)), 2000, 'success')

										if xTarget then
											xTarget.showNotification("FATURAS", TranslateCap('received_payment', ESX.Math.GroupDigits(amount)), 2000, 'info')
										end
									end

									cb()
								end)
						else
							if xTarget then
								xTarget.showNotification("FATURAS", TranslateCap('target_no_money'), 2000, 'info')
							end

							xPlayer.showNotification("FATURAS", TranslateCap('no_money'), 2000, 'error')
							cb()
						end
					end)
				end
				local log = "**Info:** Pagou uma fatura de " .. amount .. " para " .. result.sender .. ""
				exports["Pack"]:LogToDiscord(_source,
					"https://discord.com/api/webhooks/1039624427144491039/o6HBnQSPVP9ec8ZfMYll2YjmleqbfIp0cax_QDp2LV1yGPRv0mH3qUgoaBGxqgvRkIuZ"
					, "Faturas", log)
			end
		end)
end)
