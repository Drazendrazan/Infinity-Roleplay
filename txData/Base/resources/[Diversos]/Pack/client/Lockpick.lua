Skillbar = exports["skillbar"]:GetSkillbarObject()

RegisterNetEvent('lockpick:open')
AddEventHandler('lockpick:open', function()
	local ped = PlayerPedId()
	local closestVehicle, distance = ESX.Game.GetClosestVehicle()
	if distance < 3 then
		TaskStartScenarioInPlace(ped, "PROP_HUMAN_BUM_BIN", 0, true)
		Skillbar.Start({
			duration = math.random(500, 1000),
			pos = math.random(10, 30),
			width = math.random(10, 20),
		}, function()
			Skillbar.Start({
				duration = math.random(500, 1000),
				pos = math.random(10, 30),
				width = math.random(10, 20),
			}, function()
				Skillbar.Start({
					duration = math.random(500, 1000),
					pos = math.random(10, 30),
					width = math.random(10, 20),
				}, function()
					ClearPedTasksImmediately(ped)
					SetVehicleDoorsLocked(closestVehicle, 1)
					SetVehicleDoorsLockedForAllPlayers(closestVehicle, false)
					ESX.ShowNotification("LOCKPICK", "Veículo destrancado", 2000, "success")
					TriggerServerEvent("lockpick:remove")
				end, function()
					ESX.ShowNotification("LOCKPICK", "Não conseguiste destrancar o veículo", 2000, "error")
					ClearPedTasksImmediately(ped)
				end)
			end, function()
				ESX.ShowNotification("LOCKPICK", "Não conseguiste destrancar o veículo", 2000, "error")
				ClearPedTasksImmediately(ped)
			end)
		end, function()
			ESX.ShowNotification("LOCKPICK", "Não conseguiste destrancar o veículo", 2000, "error")
			ClearPedTasksImmediately(ped)
		end)
	else
		ESX.ShowNotification("LOCKPICK", "Sem veículos por perto", 2000, "warning")
	end
end)
