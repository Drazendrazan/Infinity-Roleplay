ESX.RegisterUsableItem('dopebag', function(source)
  local _source = source
  local xPlayer = ESX.GetPlayerFromId(source)
  while not xPlayer do Citizen.Wait(10); ESX.GetPlayerFromId(source); end
  if xPlayer.getInventoryItem('dopebag').count >= 1 and xPlayer.getInventoryItem('weed_10').count >= 1 then
    TriggerClientEvent("mythic_progbar:client:progress", source, {
      name = "unique_action_name",
      duration = 15000,
      label = "A empacotar as doses...",
      useWhileDead = false,
      canCancel = true,
      controlDisables = {
        disableMovement = true,
        disableCarMovement = true,
        disableMouse = false,
        disableCombat = true
      },
      animation = {
        animDict = "missheistdockssetup1clipboard@idle_a",
        anim = "idle_a"
      },
      prop = {}
    }, nil)
    xPlayer.showNotification("EMPACOTAMENTO", "Sacos empacotados", 2000, "success")
    xPlayer.removeInventoryItem('weed_10', 1)
    xPlayer.removeInventoryItem('dopebag', 1)
    xPlayer.addInventoryItem('bagofdope', 50)
    local log = "O jogador " .. GetPlayerName(_source) .. " empacotou 50 doses de erva"
    LogToDiscord(_source,
      "https://discord.com/api/webhooks/1043162401043906620/hJmX7GTwaQVLnw6QE1iMvpZJC5Fm3b-B66kclGiKombMHzs8gvKJMlSGyX6O7FqT94zk"
      , "Empacotamento de droga", log)
  elseif xPlayer.getInventoryItem('dopebag').count >= 1 and xPlayer.getInventoryItem('meth').count >= 1 then
    TriggerClientEvent("mythic_progbar:client:progress", source, {
      name = "unique_action_name",
      duration = 60000,
      label = "A empacotar as doses...",
      useWhileDead = false,
      canCancel = true,
      controlDisables = {
        disableMovement = true,
        disableCarMovement = true,
        disableMouse = false,
        disableCombat = true
      },
      animation = {
        animDict = "missheistdockssetup1clipboard@idle_a",
        anim = "idle_a"
      },
      prop = {}
    }, nil)
    xPlayer.showNotification("EMPACOTAMENTO", "Sacos empacotados", 2000, "success")
    xPlayer.removeInventoryItem('meth', 1)
    xPlayer.removeInventoryItem('dopebag', 1)
    xPlayer.addInventoryItem('bagofmeth', 50)
    local log = "O jogador " .. GetPlayerName(_source) .. " empacotou 50 doses de metanfetamina"
    LogToDiscord(_source,
      "https://discord.com/api/webhooks/1043162401043906620/hJmX7GTwaQVLnw6QE1iMvpZJC5Fm3b-B66kclGiKombMHzs8gvKJMlSGyX6O7FqT94zk"
      , "Empacotamento de droga", log)
  end
end)

function LogWeapons(item, arma, _source)
  local log = "O jogador " .. GetPlayerName(_source) .. " usou o item " ..
      item .. " fazendo com que equipasse um/uma " .. arma
  LogToDiscord(_source,
    "https://discord.com/api/webhooks/1040267139925430332/yC1_ui80sWy3ZNI4bjL6ycdC2XRs9L0q0JZFQzvZP9qM9xqLnSr_GLzThneXOupT5BwL"
    , "Equipamento de Armas", log)
end

ESX.RegisterUsableItem('fishingknife', function(source)
  local _source = source
  local xPlayer = ESX.GetPlayerFromId(_source)
  if xPlayer.getInventoryItem('fishingknife').count >= 1 and xPlayer.getInventoryItem('weed_100').count >= 1 then
    TriggerClientEvent("mythic_progbar:client:progress", source, {
      name = "unique_action_name",
      duration = 30000,
      label = "A cortar o tijolo...",
      useWhileDead = false,
      canCancel = true,
      controlDisables = {
        disableMovement = true,
        disableCarMovement = true,
        disableMouse = false,
        disableCombat = true
      },
      animation = {
        animDict = "missheistdockssetup1clipboard@idle_a",
        anim = "idle_a"
      },
      prop = {}
    }, nil)
    xPlayer.removeInventoryItem('fishingknife', 1)
    xPlayer.removeInventoryItem('weed_100', 1)
    xPlayer.addInventoryItem('weed_10', 10)
    xPlayer.showNotification("CORTAR", "Tijolo cortado", 2000, "success")
    local log = "O jogador " .. GetPlayerName(_source) .. " cortou um tijolo de erva"
    LogToDiscord(_source,
      "https://discord.com/api/webhooks/1043161340879048774/8h-b4AjSZYDzhKfMqpqNY00mSk1WqVDPUz8MaeVVDYRFY1cp_P1q7_3aIqlk_vdDTf7y"
      , "Erva", log)
  else
    xPlayer.showNotification("CORTAR", "Não tens nenhum tijolo", 2000, "error")
  end
end)

ESX.RegisterUsableItem('pistola', function(source)
  local xPlayer = ESX.GetPlayerFromId(source)
  local _source = source
  if xPlayer.hasWeapon("WEAPON_PISTOL") then
    xPlayer.showNotification("ARMAMENTO", "Já tens esta arma equipada", 2000, "warning")
  else
    xPlayer.showNotification("ARMAMENTO", "Equipaste uma pistola", 2000, "success")
    xPlayer.removeInventoryItem('pistola', 1)
    xPlayer.addWeapon('WEAPON_PISTOL', 100)
    LogWeapons("pistola", "WEAPON_PISTOl", _source)
  end
end)

ESX.RegisterUsableItem('vanDiamond', function(source)
  local xPlayer = ESX.GetPlayerFromId(source)
  if xPlayer.getInventoryItem('anel').count >= 1 then
    xPlayer.removeInventoryItem('vanDiamond', 1)
    xPlayer.removeInventoryItem('anel', 1)
    xPlayer.addInventoryItem('anel_rubi', 1)
    xPlayer.showNotification("JOIAS", "Anel de rubi fabricado", 2000, "success")
  else
    xPlayer.showNotification("JOIAS", "Não tens nenhum anel", 2000, "error")
  end
  
end)

ESX.RegisterUsableItem('taco', function(source)
  local xPlayer = ESX.GetPlayerFromId(source)
  local _source = source
  if xPlayer.hasWeapon("WEAPON_BAT") then
    xPlayer.showNotification("ARMAMENTO", "Equipaste um taco de baseball", 2000, "success")
    xPlayer.removeInventoryItem('taco', 1)
    xPlayer.addWeapon('WEAPON_BAT', 0)
    LogWeapons("taco", "WEAPON_BAT", _source)
  else
    xPlayer.showNotification("ARMAMENTO", "Já tens esta arma equipada", 2000, "warning")
  end
end)

ESX.RegisterUsableItem('switchblade', function(source)
  local xPlayer = ESX.GetPlayerFromId(source)
  local _source = source
  if xPlayer.hasWeapon("WEAPON_SWITCHBLADE") then
    xPlayer.showNotification("ARMAMENTO", "Equipaste uma faca", 2000, "success")
    xPlayer.removeInventoryItem('switchblade', 1)
    xPlayer.addWeapon('WEAPON_SWITCHBLADE', 0)
    LogWeapons("switchblade", "WEAPON_SWITCHBLADE", _source)
  else
    xPlayer.showNotification("ARMAMENTO", "Já tens esta arma equipada", 2000, "warning")
  end
end)


ESX.RegisterUsableItem('pistola_sns', function(source)
  local xPlayer = ESX.GetPlayerFromId(source)
  local _source = source
  if xPlayer.hasWeapon("WEAPON_SNSPISTOL") then
    xPlayer.showNotification("ARMAMENTO", "Já tens esta arma equipada", 2000, "warning")
  else 
    xPlayer.showNotification("ARMAMENTO", "Equipaste uma pistola SNS", 2000, "success")
    xPlayer.removeInventoryItem('pistola_sns', 1)
    xPlayer.addWeapon('WEAPON_SNSPISTOL', 100)
    LogWeapons("pistola_sns", "WEAPON_SNSPISTOL", _source)
  end
end)

ESX.RegisterUsableItem('heavy_pistol', function(source)
  local xPlayer = ESX.GetPlayerFromId(source)
  local _source = source
  if xPlayer.hasWeapon("WEAPON_HEAVYPISTOL") then
    xPlayer.showNotification("ARMAMENTO", "Já tens esta arma equipada", 2000, "warning")
  else
    xPlayer.showNotification("ARMAMENTO", "Equipaste uma pistola pesada", 2000, "success")
    xPlayer.removeInventoryItem('heavy_pistol', 1)
    xPlayer.addWeapon('WEAPON_HEAVYPISTOL', 100)
    LogWeapons("heavy_pistol", "WEAPON_HEAVYPISTOL", _source)
  end
end)

ESX.RegisterUsableItem('bzgas', function(source)
  local xPlayer = ESX.GetPlayerFromId(source)
  local _source = source
  if xPlayer.hasWeapon("WEAPON_BZGAS") then
    xPlayer.showNotification("ARMAMENTO", "Já tens esta arma equipada", 2000, "warning")
  else
    xPlayer.showNotification("ARMAMENTO", "Equipaste uma granada de gás", 2000, "success")
    xPlayer.removeInventoryItem('bzgas', 1)
    xPlayer.addWeapon('WEAPON_BZGAS', 1)
    LogWeapons("bzgas", "WEAPON_BZGAS", _source)
  end
end)

ESX.RegisterUsableItem('lockpick', function(source)
  local xPlayer = ESX.GetPlayerFromId(source)
  TriggerClientEvent("lockpick:open", xPlayer.source)
end)

RegisterServerEvent("lockpick:remove")
AddEventHandler("lockpick:remove", function()
  local _source = source
  local xPlayer = ESX.GetPlayerFromId(_source)
  xPlayer.removeInventoryItem('lockpick', 1)
end)

ESX.RegisterUsableItem('oxygen_mask', function(source)
  TriggerClientEvent('Infinity:oxygen_mask', source)
  local xPlayer = ESX.GetPlayerFromId(source)
  xPlayer.removeInventoryItem('oxygen_mask', 1)
end)

local itens = {
  { name = "uwubentobox", value = 500000, type = "hunger" },
  { name = "uwububbleteablueberry", value = 500000, type = "thirst" },
  { name = "uwububbleteamint", value = 500000, type = "thirst" },
  { name = "uwububbletearose", value = 500000, type = "thirst" },
  { name = "uwubudhabowl", value = 500000, type = "hunger" },
  { name = "uwuchocsandy", value = 500000, type = "hunger" },
  { name = "uwucupcake", value = 500000, type = "hunger" },
  { name = "uwumisosoup", value = 500000, type = "thirst" },
  { name = "uwupancake", value = 500000, type = "hunger" },
  { name = "uwushushi", value = 500000, type = "hunger" },
  { name = "uwuvanillasandy", value = 500000, type = "hunger" },
}

for k, v in pairs(itens) do
  ESX.RegisterUsableItem(v.name, function(source)
    local xPlayer = ESX.GetPlayerFromId(source)
    xPlayer.removeInventoryItem(v.name, 1)
    TriggerClientEvent('esx_status:add', source, v.type, v.value)
    TriggerClientEvent('esx_basicneeds:onEat', source, nil)
  end)
end
