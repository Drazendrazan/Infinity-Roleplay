PlayerData = {}
isPhoneOpen = false
openingCd = false
InstaLink = ""

muted = false

RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function()
  Startup()
end)

RegisterNetEvent('InfinityPhone:startphone')
AddEventHandler('InfinityPhone:startphone', function()
  Startup()
end)

function Startup()
  PlayerData = ESX.GetPlayerData()

  ESX.TriggerServerCallback('InfinityPhone:server:getLink', function(callback)
    InstaLink = callback
  end)

  TriggerServerEvent("InfinityPhone:server:SetupApps") -- Apps
  TriggerServerEvent('InfinityPhone:server:GetAds') -- Paginas Amarelas
  TriggerServerEvent("InfinityPhone:server:getPlayerVehicles") -- Garage
  TriggerServerEvent('InfinityPhone:server:UpdateTwitter') -- Twitter
  TriggerServerEvent('InfinityPhone:server:UpdateIsta') -- Insta
  TriggerServerEvent('InfinityPhone:server:UpdateContact') -- Contactos
  TriggerServerEvent('InfinityPhone:server:GetTexts') -- msg
  TriggerServerEvent('InfinityPhone:server:SetUpHistory') -- historico
  TriggerServerEvent('InfinityPhone:server:SetupInfo') -- INFO
end

RegisterNetEvent('InfinityPhone:client:UpdateData')
AddEventHandler('InfinityPhone:client:UpdateData', function()
  TriggerServerEvent('InfinityPhone:server:UpdateTwitter') -- Twitter
  TriggerServerEvent('InfinityPhone:server:UpdateIsta') -- Insta
  TriggerServerEvent('InfinityPhone:server:UpdateContact') -- Contactos
  TriggerServerEvent('InfinityPhone:server:GetTexts') -- msg
  TriggerServerEvent('InfinityPhone:server:SetUpHistory') -- historico
  TriggerServerEvent('InfinityPhone:server:SetupInfo') -- INFO
end)

-- remover
--Citizen.CreateThread(function()
--  Wait(5000)
--  TriggerServerEvent("InfinityPhone:server:CharacterSpawned")
--end)

--[[ actionCb = {}

RegisterNetEvent('InfinityPhone:client:ActionCallback')
AddEventHandler('InfinityPhone:client:ActionCallback', function(identifier, data)
	if actionCb[identifier] ~= nil then
	    actionCb[identifier](data)
	    actionCb[identifier] = nil
	end
end) ]]

RegisterNetEvent('InfinityPhone:client:SetupData')
AddEventHandler('InfinityPhone:client:SetupData', function(data)
  if data[1].name == "cars" then
    for k, v in pairs(data[1].data) do
      v.vehicle_name = GetDisplayNameFromVehicleModel(v.vehicle.model)
    end
  end
  SendNUIMessage({
    action = 'setup',
    data = data
  })
end)

local counter = 0

Citizen.CreateThread(function()
  while true do
    if counter <= 0 then
      local time = CalculateTimeToDisplay()
      SendNUIMessage({
        action = 'updateTime',
        time = time.hour .. ':' .. time.minute
      })
      counter = 100
    else
      counter = counter - 1
    end
    Citizen.Wait(5)
  end
end)

RegisterKeyMapping('telemovel', 'Abrir Telemóvel', 'keyboard', 'f1')

RegisterCommand("telemovel", function()
  ESX.TriggerServerCallback('InfinityPhone:getItemAmount', function(result)
    if result > 0 then
      TogglePhone()
    else
      ESX.ShowNotification("TELEMÓVEL", 'Não tens nenhum telemóvel', 2000, 'error')
    end
  end, 'phone')
  Wait(500)
end)

RegisterCommand("setupdata", function(source, args)
  TriggerServerEvent("InfinityPhone:server:SetupApps") -- Apps
  TriggerServerEvent('InfinityPhone:server:GetAds') -- Paginas Amarelas
  TriggerServerEvent("InfinityPhone:server:SetupInfo") -- Info
  TriggerServerEvent("InfinityPhone:server:RefreshBills") -- Faturas
  TriggerServerEvent("InfinityPhone:server:getPlayerVehicles") -- Garagem
  TriggerServerEvent('InfinityPhone:server:UpdateTwitter') -- Twitter
  TriggerServerEvent('InfinityPhone:server:UpdateIsta') -- Insta
  TriggerServerEvent('InfinityPhone:server:UpdateContact') -- Contactos
  TriggerServerEvent('InfinityPhone:server:GetTexts') -- msg
  TriggerServerEvent('InfinityPhone:server:SetUpHistory') -- historico
end, false)




RegisterNUICallback('ClosePhone', function(data, cb)
  TogglePhone()
end)

RegisterNUICallback('RefreshBills', function(data, cb)
  TriggerServerEvent("InfinityPhone:server:RefreshBills")
  Wait(1000)
end)

RegisterCommand("fechartelemovel", function()
  TogglePhone()
end, false)

RegisterCommand("atender", function()
  if Call.status == 0 and not IsEntityDead(PlayerPedId()) then
    TriggerServerEvent('InfinityPhone:server:AcceptCall')
  end
end, false)

RegisterCommand("desligar", function()
  if Call.status == 0 and not IsEntityDead(PlayerPedId()) then
    TriggerServerEvent('InfinityPhone:server:EndCall', Call)
  end
end, false)

Citizen.CreateThread(function()
  TriggerEvent('chat:addSuggestion', '/atender', 'Atende a chamada')
  TriggerEvent('chat:addSuggestion', '/desligar', 'Desliga a chamada')
end)

function TogglePhone()
  if not IsEntityDead(PlayerPedId()) then
    if not openingCd or isPhoneOpen then
      isPhoneOpen = not isPhoneOpen
      if isPhoneOpen == true then
        PhonePlayIn()
        SetNuiFocus(true, true)
        if Call ~= nil then
          SendNUIMessage({ action = 'show', number = Call.number, initiator = Call.initiator })
        else
          SendNUIMessage({ action = 'show' })
        end
      else
        SetNuiFocus(false, false)
        if not IsInCall() then
          PhonePlayOut()
        end
        SendNUIMessage({ action = 'hide' })
      end

      openingCd = true
    end

    Citizen.CreateThread(function()
      Citizen.Wait(1000)
      openingCd = false
    end)
  end
end

RegisterNUICallback('OpenNEWS', function(data, cb)
  TogglePhone()
  TriggerEvent("irp_news:openNews")
end)

RegisterNUICallback('RemoveFocus', function(data, cb)
  SetNuiFocus(false, false)
end)

RegisterNUICallback('SetMuted', function(data, cb)
  muted = true
end)

RegisterNUICallback('SetNotMuted', function(data, cb)
  muted = false
end)

function CalculateTimeToDisplay()
  hour = GetClockHours()
  minute = GetClockMinutes()

  local obj = {}

  if hour <= 9 then
    hour = "0" .. hour
  end

  if minute <= 9 then
    minute = "0" .. minute
  end

  obj.hour = hour
  obj.minute = minute

  return obj
end

function DisableControls()
  Citizen.CreateThread(function()
    while isPhoneOpen do
      DisableControlAction(0, 1, true) -- LookLeftRight
      DisableControlAction(0, 2, true) -- LookUpDown
      DisableControlAction(0, 106, true) -- VehicleMouseControlOverride
      DisableControlAction(0, 30, true) -- disable left/right
      DisableControlAction(0, 31, true) -- disable forward/back
      DisableControlAction(0, 36, true) -- INPUT_DUCK
      DisableControlAction(0, 21, true) -- disable sprint
      DisableControlAction(0, 63, true) -- veh turn left
      DisableControlAction(0, 64, true) -- veh turn right
      DisableControlAction(0, 71, true) -- veh forward
      DisableControlAction(0, 72, true) -- veh backwards
      DisableControlAction(0, 75, true) -- disable exit vehicle

      DisablePlayerFiring(PlayerId(), true) -- Disable weapon firing
      DisableControlAction(0, 24, true) -- disable attack
      DisableControlAction(0, 25, true) -- disable aim
      DisableControlAction(1, 37, true) -- disable weapon select
      DisableControlAction(0, 47, true) -- disable weapon
      DisableControlAction(0, 58, true) -- disable weapon
      DisableControlAction(0, 140, true) -- disable melee
      DisableControlAction(0, 141, true) -- disable melee
      DisableControlAction(0, 142, true) -- disable melee
      DisableControlAction(0, 143, true) -- disable melee
      DisableControlAction(0, 263, true) -- disable melee
      DisableControlAction(0, 264, true) -- disable melee
      DisableControlAction(0, 257, true) -- disable melee
      Citizen.Wait(5)
    end
  end)
end

Citizen.CreateThread(function()
  while true do
    if IsInCall() then
      if Call.status == 0 then
        DrawUIText("A ligar ~g~[CAPS LOCK]~w~ desligar", 4, 1, 0.5, 0.965, 0.65, 255, 255, 255, 255)
      else
        DrawUIText("Em chamada ~g~[CAPS LOCK]~w~ desligar", 4, 1, 0.5, 0.965, 0.65, 255, 255, 255, 255)
      end
      if (IsControlPressed(1, 137)) then
        TriggerServerEvent('InfinityPhone:server:EndCall', Call)
        Wait(1000)
      end
      Citizen.Wait(5)
    else
      Citizen.Wait(1000)
    end
  end
end)


function DrawUIText(text, font, centre, x, y, scale, r, g, b, a)
  SetTextFont(font)
  SetTextProportional(0)
  SetTextScale(scale, scale)
  SetTextColour(r, g, b, a)
  SetTextDropShadow(0, 0, 0, 0, 255)
  SetTextEdge(1, 0, 0, 0, 255)
  SetTextDropShadow()
  SetTextOutline()
  SetTextCentre(centre)
  SetTextEntry("STRING")
  AddTextComponentString(text)
  DrawText(x, y)
end

---------------------- DAR NUMERO

--RegisterCommand("num", function()
--  local player, distance = ESX.Game.GetClosestPlayer()
--
--  if distance ~= -1 and distance <= 5.0 then
--    ESX.TriggerServerCallback('InfinityPhone:server:GetPhoneNumber', function(num)
--      TriggerServerEvent("InfinityPhone:server:giveNumber", num, GetPlayerServerId(player))
--    end)
--  else
--    ESX.ShowNotification("TELEMÓVEL", 'Ninguém nas proximidades', 2000, 'error')
--  end
--end, false)
--
--Citizen.CreateThread(function()
--  TriggerEvent('chat:addSuggestion', '/num', 'Dar o número de telemóvel à pessoa mais perto')
--end)

RegisterNetEvent('InfinityPhone:client:showNumToMe')
AddEventHandler('InfinityPhone:client:showNumToMe', function(num)
  PlaySoundFrontend(-1, "Event_Message_Purple", "GTAO_FM_Events_Soundset", 1)
  exports["mythic_notify"]:SendAlert('error', 'Número recebido: ' .. num)
end)
