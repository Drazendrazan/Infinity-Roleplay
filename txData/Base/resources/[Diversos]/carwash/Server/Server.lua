ESX.RegisterServerCallback('CarWash:checkMoney',function(source, cb, wash)
    local xPlayer = ESX.GetPlayerFromId(source)
    local money = xPlayer.getAccount('bank').money
    local price = Config.PricePremium
	if money >= price then
		xPlayer.removeAccountMoney('bank', price)
        cb(true)
    else
        cb(false)
    end
end)