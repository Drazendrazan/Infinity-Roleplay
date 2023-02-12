Citizen.CreateThread(function()
	Citizen.Wait(2000)
	if cfg.job.service ~= nil then
		local model = cfg.job.service.ped RequestModel(model) while not HasModelLoaded(model) do Citizen.Wait(0) end
		local ped = CreatePed(math.floor(0),model,cfg.job.service.ped_pos[math.floor(1)],cfg.job.service.ped_pos[math.floor(2)],cfg.job.service.ped_pos[math.floor(3)],cfg.job.service.ped_pos[math.floor(4)],false,false)
		SetBlockingOfNonTemporaryEvents(ped,true)
        SetEntityInvincible(ped,true)
		FreezeEntityPosition(ped,true)
		table.insert(entitys,ped)
	end
	for k,v in pairs(cfg.job.blips) do
		local blip = AddBlipForCoord(v[math.floor(1)],v[math.floor(2)],v[math.floor(3)])
		SetBlipSprite(blip, v[math.floor(4)])
		SetBlipColour(blip, v[math.floor(5)])
		BeginTextCommandSetBlipName("STRING")
		AddTextComponentString(v[math.floor(6)])
		EndTextCommandSetBlipName(blip)
		SetBlipAsShortRange(blip,true)
		SetBlipScale(blip,v[math.floor(7)])
	end
	while true do
		local sleep = 1000
		local ped = PlayerPedId()
		local playerpos = GetEntityCoords(ped)
		if injob then
			if garbage_trashbag == math.floor(0) then
				if job.interactables ~= nil then
					for k,v in pairs(job.interactables) do
						if v.status == false then
							if GetDistanceBetweenCoords(playerpos.x,playerpos.y,playerpos.z,v.pos[math.floor(1)],v.pos[math.floor(2)],v.pos[math.floor(3)],true) <= 1.5 then
								sleep = 1
								if marker_id == nil then TriggerEvent("CORE_MARKERMENU:ShowMarker_c",job.service.grab_trash_text,function(_id) marker_id = _id end) end
								if IsControlJustPressed(math.floor(1),job.service.grab_trash_key) then
									TriggerEvent("CORE_MARKERMENU:StopMarker_c",marker_id)
									marker_id = nil
				
									TriggerServerEvent("CORE_JOB_GARBAGEMAN:CollectTrashJob_s",k)
								end
								goto done
							end
						end
					end
				end
			else
				local vehicle_pos = GetOffsetFromEntityInWorldCoords(job_vehicle,0.0,-4.5,1.0)
				if GetDistanceBetweenCoords(playerpos.x,playerpos.y,playerpos.z,vehicle_pos.x,vehicle_pos.y,vehicle_pos.z) <= 1.5 then
					sleep = 1
					if marker_id == nil then TriggerEvent("CORE_MARKERMENU:ShowMarker_c",job.service.deliver_trash_text,function(_id) marker_id = _id end) end
					if IsControlJustPressed(math.floor(1),job.service.deliver_trash_key) then
						TriggerEvent("CORE_MARKERMENU:StopMarker_c",marker_id)
						marker_id = nil
						
						TriggerEvent("CORE_JOB_GARBAGEMAN:DeliverTrashJob_c")
					end
					goto done
				end
			end
		end
		if job.service ~= nil then
			if GetDistanceBetweenCoords(playerpos.x,playerpos.y,playerpos.z,job.service.ped_pos[math.floor(1)],job.service.ped_pos[math.floor(2)],job.service.ped_pos[math.floor(3)],true) <= 1.5 then
				sleep = 1
				if injob == false then
					if marker_id == nil then TriggerEvent("CORE_MARKERMENU:ShowMarker_c",job.service.enter_job_text,function(_id) marker_id = _id end) end
					if IsControlJustPressed(math.floor(1),job.service.enter_job_key) then
						TriggerEvent("CORE_MARKERMENU:StopMarker_c",marker_id)
						marker_id = nil
	
						TriggerEvent("CORE_JOB_GARBAGEMAN:EnterJob_c")
					end
				else
					if marker_id == nil then TriggerEvent("CORE_MARKERMENU:ShowMarker_c",job.service.exit_job_text,function(_id) marker_id = _id end) end
					if IsControlJustPressed(math.floor(1),job.service.exit_job_key) then
						TriggerEvent("CORE_MARKERMENU:StopMarker_c",marker_id)
						marker_id = nil
	
						TriggerEvent("CORE_JOB_GARBAGEMAN:ExitJob_c")
					end
				end
				goto done
			end
		end
		if marker_id ~= nil then
			TriggerEvent("CORE_MARKERMENU:StopMarker_c",marker_id)
			marker_id = nil
		end
		::done::
		Citizen.Wait(sleep)
	end
end)

RegisterNetEvent("CORE_JOB_GARBAGEMAN:Notification_c")
AddEventHandler("CORE_JOB_GARBAGEMAN:Notification_c", function(msg)
	BeginTextCommandThefeedPost("STRING")
	AddTextComponentSubstringPlayerName(msg)
	EndTextCommandThefeedPostTicker(true, false)
end)