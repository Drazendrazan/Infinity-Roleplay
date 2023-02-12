RegisterNUICallback( 'PayBill', function( data, cb )
	ESX.TriggerServerCallback('InfinityPhone:server:payBill', function(callback)
		cb(callback)
	end, data)
end)

RegisterNUICallback( 'sendNotification', function( data, cb )
	ESX.ShowNotification("TELEMÓVEL", data.message, 2000, data.type)
end)
