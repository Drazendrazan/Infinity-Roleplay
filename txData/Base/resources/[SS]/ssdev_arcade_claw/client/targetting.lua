if(Config.TargettingMode == 'Command') then
    RegisterCommand("jogar", function ()
        if(not activeMachine) then
            return
        end

        StartGameWithMachine()
    end)

elseif(Config.TargettingMode == 'Distance') then
    Citizen.CreateThread(function()
        while(true) do
            Citizen.Wait(mainThreadWait)

            if(activeMachine ~= nil) then
                local me = PlayerPedId()
                local meCoords = GetEntityCoords(me)
                local machineCoords = GetEntityCoords(activeMachine.Machine)

                local distance = #(meCoords - machineCoords)
                if(distance <= activeMachine.Data.Distance) then
                    if(IsControlJustReleased(0, 51)) then -- E
                        StartGameWithMachine()
                    end
                end
            end
        end
    end)
elseif(Config.TargettingMode == 'QBTarget' or Config.TargettingMode == 'QTarget') then
    -- Ignore as its called the function below on prop creation
else
    Logger:Warning("Could not parse targetting mode: " .. Config.TargettingMode .. " (You will not be able to use claw machines)")
end

function CreateMachineTarget(name, machine)
    if(Config.TargettingMode ~= 'QBTarget' and Config.TargettingMode ~= 'QTarget') then
        return
    end

    local machineConfig = Config.Machines[name]
    local exportName = Config.TargettingMode == 'QTarget' and 'qtarget' or 'qb-target'

    exports[exportName]:AddEntityZone("clawmachine-" .. name, machine, {
		name = "clawmachine-" .. name,
		heading = GetEntityHeading(machine),
		debugPoly = false,
	}, {
		options = {
			{
				type = "client",
				event = "ssdev_arcade_claw:PlayClosestMachine",
				icon = "fa-solid fa-award",
				label = "Play Claw Machine",
			}
		},
		distance = machineConfig.Distance
  	})

    Logger:Debug("Added zone for " .. name)
end