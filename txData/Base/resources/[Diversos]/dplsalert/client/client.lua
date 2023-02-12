RegisterNetEvent("dplsalertas:switch")
AddEventHandler("dplsalertas:switch", function(value)
  SendNUIMessage({
    display = value
  })
end)

RegisterCommand("alerta", function(source)
  if ESX.PlayerData.job.name == 'police' then
    OpenMenu()
  end
end, false)

function OpenMenu()
  ESX.UI.Menu.CloseAll()

  ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'alerts', {
    title    = "ALERTA ASSALTO",
    align    = 'top-left',
    elements = {
      { label = "10-4 no 10-90", value = 'desligar' },
      { label = "ASSALTO A DECORRER", value = 'ligar' },
    }
  }, function(data, menu)
    if data.current.value == 'desligar' then
      TriggerServerEvent("dplsalertas:switch", false)


    elseif data.current.value == 'ligar' then
      TriggerServerEvent("dplsalertas:switch", true)

    end

    menu.close()
  end, function(data, menu)
    menu.close()
  end)
end
