Citizen.CreateThread(function()
	Citizen.Wait(2000)
	TriggerServerEvent("CORE_JOB_HUNTER:GetList_s")
	for k, v in pairs(cfg.job.transformers) do
		if v.ped ~= nil then
			local model = v.ped
			RequestModel(model)
			while not HasModelLoaded(model) do Citizen.Wait(0) end
			local ped = CreatePed(math.floor(0), model, v.pos[math.floor(1)], v.pos[math.floor(2)], v.pos[math.floor(3)],
				v.pos[math.floor(4)], false, false)
			SetBlockingOfNonTemporaryEvents(ped, true)
			SetEntityInvincible(ped, true)
			FreezeEntityPosition(ped, true)
			table.insert(entitys, ped)
		end
		if v.prop ~= nil then
			local model = v.prop
			RequestModel(model)
			while not HasModelLoaded(model) do Citizen.Wait(0) end
			local object = CreateObject(model, v.pos[math.floor(1)], v.pos[math.floor(2)], v.pos[math.floor(3)], false, true,
				false)
			SetEntityHeading(object, v.position[math.floor(4)])
			SetBlockingOfNonTemporaryEvents(object, true)
			SetEntityInvincible(object, true)
			FreezeEntityPosition(object, true)
			table.insert(entitys, object)
		end
	end
	for k, v in pairs(cfg.job.blips) do
		local blip = AddBlipForCoord(v[math.floor(1)], v[math.floor(2)], v[math.floor(3)])
		SetBlipSprite(blip, v[math.floor(4)])
		SetBlipColour(blip, v[math.floor(5)])
		BeginTextCommandSetBlipName("STRING")
		AddTextComponentString(v[math.floor(6)])
		EndTextCommandSetBlipName(blip)
		SetBlipAsShortRange(blip, true)
		SetBlipScale(blip, v[math.floor(7)])
	end
	local shown = false
	while true do
		local sleep = 1000
		local ped = PlayerPedId()
		local playerpos = GetEntityCoords(ped)
		if job.service ~= nil then
			if GetCurrentPedWeapon(ped, "WEAPON_KNIFE") then
				local animal = GetClosestDeadAnimalToCoords(playerpos.x, playerpos.y, playerpos.z)
				if animal ~= nil then
					local animalpos = GetEntityCoords(animal)
					if GetDistanceBetweenCoords(playerpos.x, playerpos.y, playerpos.z, animalpos.x, animalpos.y, animalpos.z, true) <=
						1.5 then
						sleep = 1
						if not shown then
							exports["okokTextUI"]:Open(cfg.job.service.skin_animal_text, "darkblue", "right")
							shown = true
						end
						if IsControlJustPressed(math.floor(1), cfg.job.service.skin_animal_key) then
							if shown then
								exports["okokTextUI"]:Close()
							end

							TriggerEvent("CORE_JOB_HUNTER:StartSkinning_c", animal, GetEntityModel(animal))
						end
						goto done
					end
				end
			end
		end
		if job.transformers ~= nil then
			for k, v in pairs(job.transformers) do
				if GetDistanceBetweenCoords(playerpos.x, playerpos.y, playerpos.z, v.pos[math.floor(1)], v.pos[math.floor(2)],
					v.pos[math.floor(3)], true) <= 1.3 then
					sleep = 1
					if marker_id == nil then TriggerEvent("CORE_MARKERMENU:ShowMarker_c", v.text, function(_id) marker_id = _id end) end
					if IsControlJustPressed(math.floor(1), v.text_key) then
						TriggerEvent("CORE_MARKERMENU:StopMarker_c", marker_id)
						marker_id = nil

						TriggerEvent("CORE_JOB_CRAFTINGMENU:Open_c", v.recipes)
					end
					goto done
				end
			end
		end
		if marker_id ~= nil then
			TriggerEvent("CORE_MARKERMENU:StopMarker_c", marker_id)
			marker_id = nil
		end
		::done::
		Citizen.Wait(sleep)
	end
end)

RegisterNetEvent("CORE_JOB_HUNTER:Notification_c")
AddEventHandler("CORE_JOB_HUNTER:Notification_c", function(msg)
	ESX.ShowNotification("CAÇA", msg, 2000, 'info')
end)

function AddToEntities(entity)
	table.insert(entitys, entity)
end