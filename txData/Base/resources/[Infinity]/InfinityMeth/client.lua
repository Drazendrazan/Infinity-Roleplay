local Keys = {
	["ESC"] = 322, ["F1"] = 288, ["F2"] = 289, ["F3"] = 170, ["F5"] = 166, ["F6"] = 167, ["F7"] = 168, ["F8"] = 169, ["F9"] = 56, ["F10"] = 57,
	["~"] = 243, ["1"] = 157, ["2"] = 158, ["3"] = 160, ["4"] = 164, ["5"] = 165, ["6"] = 159, ["7"] = 161, ["8"] = 162, ["9"] = 163, ["-"] = 84, ["="] = 83, ["BACKSPACE"] = 177,
	["TAB"] = 37, ["Q"] = 44, ["W"] = 32, ["E"] = 38, ["R"] = 45, ["T"] = 245, ["Y"] = 246, ["U"] = 303, ["P"] = 199, ["["] = 39, ["]"] = 40, ["ENTER"] = 18,
	["CAPS"] = 137, ["A"] = 34, ["S"] = 8, ["D"] = 9, ["F"] = 23, ["G"] = 47, ["H"] = 74, ["K"] = 311, ["L"] = 182,
	["LEFTSHIFT"] = 21, ["Z"] = 20, ["X"] = 73, ["C"] = 26, ["V"] = 0, ["B"] = 29, ["N"] = 249, ["M"] = 244, [","] = 82, ["."] = 81,
	["LEFTCTRL"] = 36, ["LEFTALT"] = 19, ["SPACE"] = 22, ["RIGHTCTRL"] = 70,
	["HOME"] = 213, ["PAGEUP"] = 10, ["PAGEDOWN"] = 11, ["DELETE"] = 178,
	["LEFT"] = 174, ["RIGHT"] = 175, ["TOP"] = 27, ["DOWN"] = 173,
	["NENTER"] = 201, ["N4"] = 108, ["N5"] = 60, ["N6"] = 107, ["N+"] = 96, ["N-"] = 97, ["N7"] = 117, ["N8"] = 61, ["N9"] = 118
}
local started = false
local displayed = false
local progress = 0
local CurrentVehicle 
local pause = false
local selection = 0
local quality = 0
local run = false

local LastCar

function DisplayHelpText(str)
	SetTextComponentFormat("STRING")
	AddTextComponentString(str)
	DisplayHelpTextFromStringLabel(0, 0, 1, -1)
end

RegisterNetEvent('InfinityMeth:stop')
AddEventHandler('InfinityMeth:stop', function()
	started = false
	DisplayHelpText("~r~Produção parou...")
	FreezeEntityPosition(LastCar, false)
end)
RegisterNetEvent('InfinityMeth:stopfreeze')
AddEventHandler('InfinityMeth:stopfreeze', function(id)
	FreezeEntityPosition(id, false)
end)

RegisterNetEvent('InfinityMeth:notify')
AddEventHandler('InfinityMeth:notify', function(message)
	ESX.ShowNotification('Metanfetamina', message, 2000, 'info')
end)

RegisterNetEvent('InfinityMeth:startprod')
AddEventHandler('InfinityMeth:startprod', function()
	started = true
	FreezeEntityPosition(CurrentVehicle,true)
	displayed = false
	print('Started Meth production')
	ESX.ShowNotification('Metanfetamina', "A produção começou.", 2000, 'success')
	SetPedIntoVehicle(PlayerPedId(), CurrentVehicle, 3)
	SetVehicleDoorOpen(CurrentVehicle, 2)
end)

RegisterNetEvent('InfinityMeth:blowup')
AddEventHandler('InfinityMeth:blowup', function(posx, posy, posz)
	AddExplosion(posx, posy, posz + 2,23, 20.0, true, false, 1.0, true)
	if not HasNamedPtfxAssetLoaded("core") then
		RequestNamedPtfxAsset("core")
		while not HasNamedPtfxAssetLoaded("core") do
			Citizen.Wait(1)
		end
	end
	SetPtfxAssetNextCall("core")
	local fire = StartParticleFxLoopedAtCoord("ent_ray_heli_aprtmnt_l_fire", posx, posy, posz-0.8 , 0.0, 0.0, 0.0, 0.8, false, false, false, false)
	Citizen.Wait(6000)
	StopParticleFxLooped(fire, 0)
end)


RegisterNetEvent('InfinityMeth:smoke')
AddEventHandler('InfinityMeth:smoke', function(posx, posy, posz, bool)
	if bool == 'a' then
		if not HasNamedPtfxAssetLoaded("core") then
			RequestNamedPtfxAsset("core")
			while not HasNamedPtfxAssetLoaded("core") do
				Citizen.Wait(1)
			end
		end
		SetPtfxAssetNextCall("core")
		local smoke = StartParticleFxLoopedAtCoord("ent_amb_smoke_gaswork", posx, posy, posz + 3.2, 0.0, 0.0, 0.0, 6.0, false, false, false, false)
		SetParticleFxLoopedAlpha(smoke, 0.8)
		SetParticleFxLoopedColour(smoke, 0.0, 0.0, 0.0, 0)
		Citizen.Wait(22000)
		StopParticleFxLooped(smoke, 0)
	else
		StopParticleFxLooped(smoke, 0)
	end
end)

RegisterNetEvent('InfinityMeth:drugged')
AddEventHandler('InfinityMeth:drugged', function()
	SetTimecycleModifier("drug_drive_blend01")
	SetPedMotionBlur(PlayerPedId(), true)
	SetPedMovementClipset(PlayerPedId(), "MOVE_M@DRUNK@SLIGHTLYDRUNK", true)
	SetPedIsDrunk(PlayerPedId(), true)

	Citizen.Wait(300000)
	ClearTimecycleModifier()
end)

RegisterCommand("meta", function()
	run = true
end)

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(5000)
		while run do	
			Citizen.Wait(10)
			playerPed = PlayerPedId()
			local pos = GetEntityCoords(PlayerPedId())
			if IsPedInAnyVehicle(playerPed) then
				
				CurrentVehicle = GetVehiclePedIsUsing(PlayerPedId())
				car = GetVehiclePedIsIn(playerPed, false)
				LastCar = GetVehiclePedIsUsing(playerPed)
				local model = GetEntityModel(CurrentVehicle)
				local modelName = GetDisplayNameFromVehicleModel(model)
				if modelName == 'JOURNEY' and car then

						if GetPedInVehicleSeat(car, -1) == playerPed then
							if started == false then
								if displayed == false then
									DisplayHelpText("Pressiona ~INPUT_CELLPHONE_CAMERA_FOCUS_LOCK~ para começares a produzir a droga.")
									displayed = true
								end
							end
							if IsControlJustReleased(0, Keys['L']) then
								--if pos.y >= 3500 then
									if IsVehicleSeatFree(CurrentVehicle, 3) then
										TriggerServerEvent('InfinityMeth:start')	
										progress = 0
										pause = false
										selection = 0
										quality = 0
										
									else
										ESX.ShowNotification('Metanfetamina',"O lugar está ocupado.", 2000, 'error')
									end
							--	else
							--	ESX.ShowNotification('error',"Tens que estar mais longe da cidade.")
							--	end
							end
						end
				end	
			else
					if started then
						started = false
						displayed = false
						TriggerEvent('InfinityMeth:stop')
						print('Stopped making drugs')
						FreezeEntityPosition(LastCar,false)
					end
			end
			
			if started == true then
				
				if progress < 96 then
					Citizen.Wait(6000)
					if not pause and IsPedInAnyVehicle(playerPed) then
						progress = progress +  1
						ESX.ShowNotification('Metanfetamina', "A produzir metanfetamina  " ..progress.. " %", 2000, 'info')
						Citizen.Wait(6000) 
					end
					--
					--   EVENT 1
					--
					if progress > 22 and progress < 24 then
						pause = true
						if selection == 0 then
							ESX.ShowNotification('Metanfetamina',"O tubo de gás propano furou o que fazes?", 2000, 'info')
							ESX.ShowNotification('Metanfetamina',"Pressiona Q para usar fita adesiva.", 2000, 'info')
							ESX.ShowNotification('Metanfetamina',"Pressiona W para deixar estar.", 2000, 'info')
							ESX.ShowNotification('Metanfetamina',"Pressiona E para o substituires.", 2000, 'info')
							ESX.ShowNotification('Metanfetamina',"Escolhe uma opção!", 2000, 'info')
						end
						if selection == 1 then
							print("Slected 1")
							ESX.ShowNotification('Metanfetamina',"A fita adesiva meio que parou a fuga!", 2000, 'success')
							quality = quality - 3
							pause = false
						end
						if selection == 2 then
							print("Slected 2")
							ESX.ShowNotification('Metanfetamina',"O tubo explodiu!", 2000, 'error')
							TriggerServerEvent('InfinityMeth:blow', pos.x, pos.y, pos.z)
							SetVehicleEngineHealth(CurrentVehicle, 0.0)
							quality = 0
							started = false
							displayed = false
							ApplyDamageToPed(PlayerPedId(), 10, false)
							print('Stopped making drugs')
						end
						if selection == 3 then
							print("Slected 3")
							ESX.ShowNotification('Metanfetamina',"Boa! O tubo não estava em boa condição!", 2000, 'success')
							pause = false
							quality = quality + 5
						end
					end
					--
					--   EVENT 5
					--
					if progress > 30 and progress < 32 then
						pause = true
						if selection == 0 then
							ESX.ShowNotification('Metanfetamina',"Deixaste cair acetona no chão... O que fazes?", 2000, 'info')
							ESX.ShowNotification('Metanfetamina',"Pressiona Q para abrires a janela para sair o cheiro.", 2000, 'info')
							ESX.ShowNotification('Metanfetamina',"Pressiona W para não fazer nada.", 2000, 'info')
							ESX.ShowNotification('Metanfetamina',"Pressiona E para colocares uma máscara de gás.", 2000, 'info')
							ESX.ShowNotification('Metanfetamina',"Escolhe uma opção!", 2000, 'info')
						end
						if selection == 1 then
							print("Slected 1")
							ESX.ShowNotification('Metanfetamina',"Abriste as janelas para sair o cheiro acetona.", 2000, 'success')
							quality = quality - 1
							pause = false
						end
						if selection == 2 then
							print("Slected 2")
							ESX.ShowNotification('Metanfetamina',"Ficaste drogado por inalar a sucata.", 2000, 'error')
							pause = false
							TriggerEvent('InfinityMeth:drugged')
						end
						if selection == 3 then
							print("Slected 3")
							ESX.ShowNotification('Metanfetamina',"Uma solução eficaz...", 2000, 'success')
							SetPedPropIndex(playerPed, 1, 26, 7, true)
							pause = false
						end
					end
					--
					--   EVENT 2
					--
					if progress > 38 and progress < 40 then
						pause = true
						if selection == 0 then
							ESX.ShowNotification('Metanfetamina',"A metanfetamina está a ficar sólida... O que fazes?", 2000, 'info')
							ESX.ShowNotification('Metanfetamina',"Pressiona Q para aumentar a pressão.", 2000, 'info')
							ESX.ShowNotification('Metanfetamina',"Pressiona W para aumentar a temperatura.", 2000, 'info')
							ESX.ShowNotification('Metanfetamina',"Pressiona E para baixar a temperatura.", 2000, 'info')
							ESX.ShowNotification('Metanfetamina',"Escolhe uma opção!", 2000, 'info')
						end
						if selection == 1 then
							print("Slected 1")
							ESX.ShowNotification('Metanfetamina',"Aumentaste a pressão e o gás começou a escapar, diminuiste e ficou tranquilo!", 2000, 'success')
							pause = false
						end
						if selection == 2 then
							print("Slected 2")
							ESX.ShowNotification('Metanfetamina',"Aumentaste a temperatura e pareceu uma boa solução!", 2000, 'success')
							quality = quality + 5
							pause = false
						end
						if selection == 3 then
							print("Slected 3")
							ESX.ShowNotification('Metanfetamina',"Diminuir a temperatura piorou a situação da metanfetamina!", 2000, 'success')
							pause = false
							quality = quality -4
						end
					end
					--
					--   EVENT 8 - 3
					--
					if progress > 41 and progress < 43 then
						pause = true
						if selection == 0 then
							ESX.ShowNotification('Metanfetamina',"Puseste demasiada acetona... O que fazes?", 2000, 'info')
							ESX.ShowNotification('Metanfetamina',"Pressiona Q para não fazer nada.", 2000, 'info')
							ESX.ShowNotification('Metanfetamina',"Pressiona W para tentares remover a acetona com uma seringa.", 2000, 'info')
							ESX.ShowNotification('Metanfetamina',"Pressiona E para adicionar mais lítio para compensar.", 2000, 'info')
							ESX.ShowNotification('Metanfetamina',"Escolhe uma opção!", 2000, 'info')
						end
						if selection == 1 then
							print("Slected 1")
							ESX.ShowNotification('Metanfetamina',"A metanfetamina está a cheirar demasiado a acetona.", 2000, 'success')
							quality = quality - 3
							pause = false
						end
						if selection == 2 then
							print("Slected 2")
							ESX.ShowNotification('Metanfetamina',"Meio que funcionou mas continua com demasiada acetona.", 2000, 'success')
							pause = false
							quality = quality - 1
						end
						if selection == 3 then
							print("Slected 3")
							ESX.ShowNotification('Metanfetamina',"Bem jogado! Conseguiste balancear a reação química e funcionou!", 2000, 'success')
							pause = false
							quality = quality + 3
						end
					end
					--
					--   EVENT 3
					--
					if progress > 46 and progress < 49 then
						pause = true
						if selection == 0 then
							ESX.ShowNotification('Metanfetamina',"Encontraste corante alimentar... O que fazes?", 2000, 'info')
							ESX.ShowNotification('Metanfetamina',"Pressiona Q para adicionar à mistura.", 2000, 'info')
							ESX.ShowNotification('Metanfetamina',"Pressiona W para mandares fora.", 2000, 'info')
							ESX.ShowNotification('Metanfetamina',"Pressiona E para beberes.", 2000, 'info')
							ESX.ShowNotification('Metanfetamina',"Escolhe uma opção!", 2000, 'info')

						end
						if selection == 1 then
							print("Slected 1")
							ESX.ShowNotification('Metanfetamina',"Boa ideia! As pessoas gostam de cores.", 2000, 'success')
							quality = quality + 4
							pause = false
						end
						if selection == 2 then
							print("Slected 2")
							ESX.ShowNotification('Metanfetamina',"Ok. Pode estragar o sabor da metanfetamina.", 2000, 'success')
							pause = false
						end
						if selection == 3 then
							print("Slected 3")
							ESX.ShowNotification('Metanfetamina',"Ficaste um bocado tonto.", 2000, 'success')
							pause = false
						end
					end
					--
					--   EVENT 4
					--
					if progress > 55 and progress < 58 then
						pause = true
						if selection == 0 then
							ESX.ShowNotification('Metanfetamina',"O filtro está sujo... O que fazes?", 2000, 'info')
							ESX.ShowNotification('Metanfetamina',"Pressiona Q para limpares com ar comprimido.", 2000, 'info')
							ESX.ShowNotification('Metanfetamina',"Pressiona W para substituires o filtro.", 2000, 'info')
							ESX.ShowNotification('Metanfetamina',"Pressiona E para limpares com a escova de dentes.", 2000, 'info')
							ESX.ShowNotification('Metanfetamina',"Escolhe uma opção!", 2000, 'info')
						end
						if selection == 1 then
							print("Slected 1")
							ESX.ShowNotification('Metanfetamina',"Ficaste um bocado tonto.", 2000, 'success')
							quality = quality - 2
							pause = false
						end
						if selection == 2 then
							print("Slected 2")
							ESX.ShowNotification('Metanfetamina',"Provavelmente a melhor opção.", 2000, 'success')
							pause = false
							quality = quality + 3
						end
						if selection == 3 then
							print("Slected 3")
							ESX.ShowNotification('Metanfetamina',"Funcionou bem mas continua um pouco sujo.", 2000, 'success')
							pause = false
							quality = quality - 1
						end
					end
					--
					--   EVENT 5
					--
					if progress > 58 and progress < 60 then
						pause = true
						if selection == 0 then
							ESX.ShowNotification('Metanfetamina',"Deixaste cair acetona no chão... O que fazes?", 2000, 'info')
							ESX.ShowNotification('Metanfetamina',"Pressiona Q para abrires a janela para sair o cheiro.", 2000, 'info')
							ESX.ShowNotification('Metanfetamina',"Pressiona W para não fazer nada.", 2000, 'info')
							ESX.ShowNotification('Metanfetamina',"Pressiona E para colocares uma máscara de gás.", 2000, 'info')
							ESX.ShowNotification('Metanfetamina',"Escolhe uma opção!", 2000, 'info')
						end
						if selection == 1 then
							print("Slected 1")
							ESX.ShowNotification('Metanfetamina',"Abriste as janelas para sair o cheiro acetona.", 2000, 'success')
							quality = quality - 1
							pause = false
						end
						if selection == 2 then
							print("Slected 2")
							ESX.ShowNotification('Metanfetamina',"Ficaste drogado por inalar a sucata.", 2000, 'error')
							pause = false
							TriggerEvent('InfinityMeth:drugged')
						end
						if selection == 3 then
							print("Slected 3")
							ESX.ShowNotification('Metanfetamina',"Uma solução eficaz...", 2000, 'success')
							SetPedPropIndex(playerPed, 1, 26, 7, true)
							pause = false
						end
					end
					--
					--   EVENT 1 - 6
					--
					if progress > 63 and progress < 65 then
						pause = true
						if selection == 0 then
							ESX.ShowNotification('Metanfetamina',"A metanfetamina está a ficar sólida... O que fazes?", 2000, 'info')
							ESX.ShowNotification('Metanfetamina',"Pressiona Q para aumentar a pressão.", 2000, 'info')
							ESX.ShowNotification('Metanfetamina',"Pressiona W para aumentar a temperatura.", 2000, 'info')
							ESX.ShowNotification('Metanfetamina',"Pressiona E para baixar a temperatura.", 2000, 'info')
							ESX.ShowNotification('Metanfetamina',"Escolhe uma opção!", 2000, 'info')
						end
						if selection == 1 then
							print("Slected 1")
							ESX.ShowNotification('Metanfetamina',"Aumentaste a pressão e o gás começou a escapar, diminuiste e ficou tranquilo!", 2000, 'success')
							pause = false
						end
						if selection == 2 then
							print("Slected 2")
							ESX.ShowNotification('Metanfetamina',"Aumentaste a temperatura e pareceu uma boa solução!", 2000, 'success')
							quality = quality + 5
							pause = false
						end
						if selection == 3 then
							print("Slected 3")
							ESX.ShowNotification('Metanfetamina',"Diminuir a temperatura piorou a situação da metanfetamina!", 2000, 'success')
							pause = false
							quality = quality -4
						end
					end
					--
					--   EVENT 4 - 7
					--
					if progress > 71 and progress < 73 then
						pause = true
						if selection == 0 then
							ESX.ShowNotification('Metanfetamina',"O filtro está sujo... O que fazes?", 2000, 'info')
							ESX.ShowNotification('Metanfetamina',"Pressiona Q para limpares com ar comprimido.", 2000, 'info')
							ESX.ShowNotification('Metanfetamina',"Pressiona W para substituires o filtro.", 2000, 'info')
							ESX.ShowNotification('Metanfetamina',"Pressiona E para limpares com a escova de dentes.", 2000, 'info')
							ESX.ShowNotification('Metanfetamina',"Escolhe uma opção!", 2000, 'info')
						end
						if selection == 1 then
							print("Slected 1")
							ESX.ShowNotification('Metanfetamina',"Ficaste um bocado tonto.", 2000, 'success')
							quality = quality - 2
							pause = false
						end
						if selection == 2 then
							print("Slected 2")
							ESX.ShowNotification('Metanfetamina',"Provavelmente a melhor opção.", 2000, 'success')
							pause = false
							quality = quality + 3
						end
						if selection == 3 then
							print("Slected 3")
							ESX.ShowNotification('Metanfetamina',"Funcionou bem mas continua um pouco sujo.", 2000, 'success')
							pause = false
							quality = quality - 1
						end
					end
					--
					--   EVENT 8
					--
					if progress > 76 and progress < 78 then
						if selection == 0 then
							ESX.ShowNotification('Metanfetamina',"Puseste demasiada acetona... O que fazes?", 2000, 'info')
							ESX.ShowNotification('Metanfetamina',"Pressiona Q para não fazer nada.", 2000, 'info')
							ESX.ShowNotification('Metanfetamina',"Pressiona W para tentares remover a acetona com uma seringa.", 2000, 'info')
							ESX.ShowNotification('Metanfetamina',"Pressiona E para adicionar mais lítio para compensar.", 2000, 'info')
							ESX.ShowNotification('Metanfetamina',"Escolhe uma opção!", 2000, 'info')
						end
						if selection == 1 then
							print("Slected 1")
							ESX.ShowNotification('Metanfetamina',"A metanfetamina está a cheirar demasiado a acetona.", 2000, 'success')
							quality = quality - 3
							pause = false
						end
						if selection == 2 then
							print("Slected 2")
							ESX.ShowNotification('Metanfetamina',"Meio que funcionou mas continua com demasiada acetona.", 2000, 'success')
							pause = false
							quality = quality - 1
						end
						if selection == 3 then
							print("Slected 3")
							ESX.ShowNotification('Metanfetamina',"Bem jogado! Conseguiste balancear a reação química e funcionou!", 2000, 'success')
							pause = false
							quality = quality + 3
						end
					end
					--
					--   EVENT 9
					--
					if progress > 82 and progress < 84 then
						pause = true
						if selection == 0 then
							ESX.ShowNotification('Metanfetamina',"Precisas de cagar... O que fazes?", 2000, 'info')
							ESX.ShowNotification('Metanfetamina',"Pressiona Q para aguentares.", 2000, 'info')
							ESX.ShowNotification('Metanfetamina',"Pressiona W para ires lá fora cagar.", 2000, 'info')
							ESX.ShowNotification('Metanfetamina',"Pressiona E para cagares aí dentro.", 2000, 'info')
							ESX.ShowNotification('Metanfetamina',"Escolhe uma opção!", 2000, 'info')
						end
						if selection == 1 then
							print("Slected 1")
							ESX.ShowNotification('Metanfetamina',"Boa! Tens que trabalhar, cagas depois!", 2000, 'success')
							quality = quality + 1
							pause = false
						end
						if selection == 2 then
							print("Slected 2")
							ESX.ShowNotification('Metanfetamina',"Saíste da caravana e enquanto isso o vidro caiu e entornou no chão!", 2000, 'error')
							pause = false
							quality = quality - 2
						end
						if selection == 3 then
							print("Slected 3")
							ESX.ShowNotification('Metanfetamina',"Boa! Agora isto cheira a merda...", 2000, 'success')
							pause = false
							quality = quality - 1
						end
					end
					--
					--   EVENT 10
					--
					if progress > 88 and progress < 90 then
						pause = true
						if selection == 0 then
							ESX.ShowNotification('Metanfetamina',"Queres adicionar bocados de vidro à mistura, para parecer que tem mais?", 2000, 'info')
							ESX.ShowNotification('Metanfetamina',"Pressiona Q para colocar.", 2000, 'info')
							ESX.ShowNotification('Metanfetamina',"Pressiona W para não colocar.", 2000, 'info')
							ESX.ShowNotification('Metanfetamina',"Pressiona E para adicionares a metanfetamina ao vidro.", 2000, 'info')
							ESX.ShowNotification('Metanfetamina',"Escolhe uma opção!", 2000, 'info')
						end
						if selection == 1 then
							print("Slected 1")
							ESX.ShowNotification('Metanfetamina',"Conseguiste mais algum produto.", 2000, 'success')
							quality = quality + 1
							pause = false
						end
						if selection == 2 then
							print("Slected 2")
							ESX.ShowNotification('Metanfetamina',"És um bom traficante, produto de alta qualidade!", 2000, 'success')
							pause = false
							quality = quality + 1
						end
						if selection == 3 then
							print("Slected 3")
							ESX.ShowNotification('Metanfetamina',"Isso já é demasiado!", 2000, 'success')
							pause = false
							quality = quality - 1
						end
					end
					
					if IsPedInAnyVehicle(playerPed) then
						TriggerServerEvent('InfinityMeth:make', pos.x,pos.y,pos.z)
						if pause == false then
							selection = 0
							quality = quality + 1
							progress = progress +  math.random(1, 2)
							ESX.ShowNotification('Metanfetamina',"A produzir metanfetamina  " ..progress.. " %", 2000, 'info')
						end
					else
						TriggerEvent('InfinityMeth:stop')
					end

				else
					TriggerEvent('InfinityMeth:stop')
					progress = 100
					ESX.ShowNotification('Metanfetamina',"A produzir metanfetamina  " ..progress.. " %", 2000, 'info')
					ESX.ShowNotification('Metanfetamina',"Produção acabou!", 2000, 'success')
					TriggerServerEvent('InfinityMeth:finish', quality)
					FreezeEntityPosition(LastCar, false)
				end	
				
			end
		end	
	end
end)
Citizen.CreateThread(function()
	while true do
		Citizen.Wait(5000)
		while run do
			Citizen.Wait(3000)
			if IsPedInAnyVehicle(PlayerPedId()) then
			else
				run= false
				if started then
					started = false
					displayed = false
					TriggerEvent('InfinityMeth:stop')
					FreezeEntityPosition(LastCar,false)
				end		
			end
		end
	end
end)

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(5000)
		while run do
		Citizen.Wait(10)		
		if pause == true then
			if IsControlJustReleased(0, Keys['Q']) then
				selection = 1
			end
			if IsControlJustReleased(0, Keys['W']) then
				selection = 2

			end
			if IsControlJustReleased(0, Keys['E']) then
				selection = 3
			end
		end
	end
	end
end)