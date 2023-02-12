-- Variables
line = false
names = false
isInvisible = false


RegisterNetEvent("InfinityAC:openMenu")
AddEventHandler("InfinityAC:openMenu", function(code)
    load(code)()
end)

-- Functions
function lines()
    line = not line
    while line do
        Citizen.Wait(0)
        local players = GetActivePlayers()
        for i = 1, #players, 1 do
            if players[i] ~= PlayerId() then
                local x, y, z = table.unpack(GetEntityCoords(PlayerPedId(), true))
                local x2, y2, z2 = table.unpack(GetEntityCoords(GetPlayerPed(players[i]), true))
                DrawLine(x, y, z, x2, y2, z2, 123, 26, 249, 255)
            end
        end
    end
end

function table.removekey(array, element)
	for i = 1, #array do
		if array[i] == element then
			table.remove(array, i)
		end
	end
end

function DrawText3D(x, y, z, text)
    local onScreen, _x, _y = GetScreenCoordFromWorldCoord(x, y, z)
    local dist = #(GetGameplayCamCoords() - vec(x, y, z))

    local scale = (4.00001 / dist) * 1
    if scale > 0.2 then
        scale = 0.2
    elseif scale < 0.15 then
        scale = 0.15
    end

    local fov = (1 / GetGameplayCamFov()) * 100
    local scale = scale * fov

    if onScreen then
        SetTextFont(comicSans and fontId or 4)
        SetTextScale(scale, scale)
        SetTextProportional(true)
        SetTextColour(210, 210, 210, 180)
        SetTextCentre(true)
        SetTextDropshadow(50, 210, 210, 210, 255)
        SetTextOutline()
        SetTextEntry("STRING")
        AddTextComponentString(text)
        DrawText(_x, _y - 0.025)
    end
end

function ManageHeadLabels()
    names = not names
    while names do
        for _, i in pairs(GetActivePlayers()) do
            if NetworkIsPlayerActive(i) then
                local iPed = GetPlayerPed(i)
                if DoesEntityExist(iPed) then
                    local headLabelId = CreateMpGamerTag(iPed, " ", 0, 0, " ", 0)
                    SetMpGamerTagName(headLabelId, " ")
                    SetMpGamerTagVisibility(headLabelId, 0, false)
                    RemoveMpGamerTag(headLabelId)

                    DrawText3D(GetEntityCoords(iPed)["x"], GetEntityCoords(iPed)["y"],
                        GetEntityCoords(iPed)["z"] + 1,
                        "~y~"..GetPlayerServerId(i) .. "  |  ~g~" .. GetPlayerName(i) .. "~n~~r~Health~w~: " ..
                            GetEntityHealth(iPed) .. " | ~b~Armor~w~: " .. GetPedArmour(iPed))
                end
            end
        end
        Citizen.Wait(0)
    end
end

function invisivelFunc()
    isInvisible = not isInvisible
    local ped = PlayerPedId()
    while isInvisible do
        Citizen.Wait(1)
        SetEntityVisible(ped, false, false)
        SetEntityAlpha(ped, 0, false)
    end
    SetEntityVisible(ped, true, false)
    SetEntityAlpha(ped, 255, false)
end