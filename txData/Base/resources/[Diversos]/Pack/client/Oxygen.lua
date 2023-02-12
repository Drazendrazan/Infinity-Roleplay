RegisterNetEvent('Infinity:oxygen_mask')
AddEventHandler('Infinity:oxygen_mask', function()
	local playerPed  = PlayerPedId()
	local coords     = GetEntityCoords(playerPed)
	local boneIndex  = GetPedBoneIndex(playerPed, 12844)
	local boneIndex2 = GetPedBoneIndex(playerPed, 24818)

	ESX.Game.SpawnObject('p_s_scuba_mask_s', {
		x = coords.x,
		y = coords.y,
		z = coords.z - 3
	}, function(object)
		ESX.Game.SpawnObject('p_s_scuba_tank_s', {
			x = coords.x,
			y = coords.y,
			z = coords.z - 3
		}, function(object2)
			AttachEntityToEntity(object2, playerPed, boneIndex2, -0.30, -0.22, 0.0, 0.0, 90.0, 180.0, true, true, false, true, 1, true)
			AttachEntityToEntity(object, playerPed, boneIndex, 0.0, 0.0, 0.0, 0.0, 90.0, 180.0, true, true, false, true, 1, true)
			SetPedDiesInWater(playerPed, false)

			ESX.ShowNotification('MÁSCARA DE OXIGÉNIO', 'Máscara de oxigénio equipada', 2000, 'info')
			Citizen.Wait(180000)
			ESX.ShowNotification('MÁSCARA DE OXIGÉNIO', 'Máscara de oxigénio com 60% de uso restante', 2000, 'info')
			Citizen.Wait(100000)
			ESX.ShowNotification('MÁSCARA DE OXIGÉNIO', 'Máscara de oxigénio com 30% de uso restante', 2000, 'info')
			Citizen.Wait(160000)
			ESX.ShowNotification('MÁSCARA DE OXIGÉNIO', 'Máscara de oxigénio com 0% de uso restante', 2000, 'info')

			SetPedDiesInWater(playerPed, true)
			DeleteObject(object)
			DeleteObject(object2)
			ClearPedSecondaryTask(playerPed)
		end)
	end)
end)