isInBennys = false

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(60)
		SetCreateRandomCops(false)
		SetCreateRandomCopsNotOnScenarios(false)
		SetCreateRandomCopsOnScenarios(false)
		SetGarbageTrucks(false)
		SetRandomBoats(false)
		SetScenarioPedDensityMultiplierThisFrame(0.0, 0.0)
		if isInBennys then
			SetVehicleDensityMultiplierThisFrame(0.0)
			SetRandomVehicleDensityMultiplierThisFrame(0.0)
			SetPedDensityMultiplierThisFrame(0.0)
			SetParkedVehicleDensityMultiplierThisFrame(0.0)
		else
			SetVehicleDensityMultiplierThisFrame(0.10)
			SetRandomVehicleDensityMultiplierThisFrame(0.10)
			SetPedDensityMultiplierThisFrame(0.5)
			SetParkedVehicleDensityMultiplierThisFrame(0.4)
		end
    end
end)

Citizen.CreateThread(function()
	while true do
		if Vdist(GetEntityCoords(PlayerPedId()), -234.7497, -1310.9805, 17.4620) < 100.0 then
			isInBennys = true
			TriggerServerEvent("PedDensityModifier:RemoveBennysPeds")
		else
			isInBennys = false
		end
		Citizen.Wait(15000)
	end
end)