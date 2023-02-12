function OpenExtraMenu()
    open = true
    local elements = {}
    local vehicle = GetVehiclePedIsIn(PlayerPedId(), false)
    for id = 0, 12 do
        if DoesExtraExist(vehicle, id) then
            local state = IsVehicleExtraTurnedOn(vehicle, id)

            if state then
                table.insert(elements, {
                    label = "Extra: " .. id .. " | " .. ('<span style="color:green;">%s</span>'):format("On"),
                    value = id,
                    state = not state
                })
            else
                table.insert(elements, {
                    label = "Extra: " .. id .. " | " .. ('<span style="color:red;">%s</span>'):format("Off"),
                    value = id,
                    state = not state
                })
            end
        end
    end
    ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'extra_actions', {
        title    = "Menu de Extras",
        align    = 'top-left',
        elements = elements
    }, function(data, menu)
        ESX.Game.SetVehicleProperties(vehicle, {
            extras = {
                [data.current.value] = data.current.state
            }
        })
        local newData = data.current
        if data.current.state then
            newData.label = "Extra: " .. data.current.value ..
                " | " .. ('<span style="color:green;">%s</span>'):format("On")
        else
            newData.label = "Extra: " .. data.current.value ..
                " | " .. ('<span style="color:red;">%s</span>'):format("Off")
        end
        newData.state = not data.current.state

        menu.update({ value = data.current.value }, newData)
        menu.refresh()
    end, function(data, menu)
        open = false
        menu.close()
    end)
end

function OpenLiveryMenu()
    open = true
    local elements = {}

    local vehicle = GetVehiclePedIsIn(PlayerPedId())
    local liveryCount = GetVehicleLiveryCount(vehicle)

    for i = 1, liveryCount do
        local state = GetVehicleLivery(vehicle)
        local text

        if state == i then
            text = "Livery: " .. i .. " | " .. ('<span style="color:green;">%s</span>'):format("On")
        else
            text = "Livery: " .. i .. " | " .. ('<span style="color:red;">%s</span>'):format("Off")
        end

        table.insert(elements, {
            label = text,
            value = i,
            state = not state
        })
    end

    ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'livery_menu', {
        title    = "Menu de Pinturas",
        align    = 'top-left',
        elements = elements
    }, function(data, menu)
        ESX.Game.SetVehicleProperties(vehicle, {
            modLivery = data.current.value
        })
        local newData = data.current
        if data.current.state then
            newData.label = "Livery: " ..
                data.current.value .. " | " .. ('<span style="color:green;">%s</span>'):format("On")
        else
            newData.label = "Livery: " .. data.current.value ..
                " | " .. ('<span style="color:red;">%s</span>'):format("Off")
        end
        newData.state = not data.current.state
        menu.update({ value = data.current.value }, newData)
        menu.refresh()
        OpenLiveryMenu()
    end, function(data, menu)
        open = false
        menu.close()
    end)
end

function OpenMainMenu()
    open = true
    local elements = {
        { label = "Extras", value = 'extra' },
        { label = "Pinturas", value = 'livery' }
    }
    ESX.UI.Menu.CloseAll()

    ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'color_menu', {
        title    = "Menu de modificações",
        align    = 'top-left',
        elements = elements
    }, function(data, menu)
        if data.current.value == 'extra' then
            OpenExtraMenu()
        elseif data.current.value == 'livery' then
            OpenLiveryMenu()
        end
    end, function(data, menu)
        open = false
        menu.close()
    end)
end

local shown = false

local coords = {
    { x = 449.7627, y = -975.8979, z = 25.6998},
    { x = 340.4255, y = -570.6953, z = 28.7968}
}

Citizen.CreateThread(function()
    local isInMarker
    local ped
    while true do
        Citizen.Wait(0)
        ped = PlayerPedId()
        isInMarker = false
        if IsPedInAnyVehicle(ped, false) then
            for k, v in pairs(coords) do
                if Vdist(GetEntityCoords(ped), v.x, v.y, v.z) < 10.0 then
                    DrawMarker(27, v.x, v.y, v.z - 0.95, 0, 0, 0, 0, 0, 0, 0.5, 0.5, 0.5, 255, 255, 255, 160,
                        0, 0, 0, 0)
                    if Vdist(GetEntityCoords(ped), v.x, v.y, v.z) < 2.0 then
                        isInMarker = true
                        if IsControlJustReleased(0, 38) then
                            if shown then
                                exports["okokTextUI"]:Close()
                                shown = false
                            end
                            OpenMainMenu()
                        end
                    end
                end
            end
            if isInMarker and not shown and not open then
                exports["okokTextUI"]:Open("Pressione [E] para abrir o menu de extras", "darkblue", "right")
                shown = true
            end
            if not isInMarker and (shown or open) then
                exports["okokTextUI"]:Close()
                ESX.UI.Menu.CloseAll()
                shown = false
                open = false
                Citizen.Wait(1000)
            end
        else
            if shown or open then
                exports["okokTextUI"]:Close()
                ESX.UI.Menu.CloseAll()
                open = false
                shown = false
            end
            Citizen.Wait(1000)
        end
    end
end)