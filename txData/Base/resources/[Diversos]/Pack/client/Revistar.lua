RegisterCommand("revistar", function()

    local player, distance = ESX.Game.GetClosestPlayer()

    if player ~= -1 and distance <= 3.0 then
        local ped = GetPlayerPed(player)

        if DoesEntityExist(ped) then
            if IsEntityDead(ped) then
                TriggerServerEvent("inventory:server:OpenInventory", "otherplayer", GetPlayerServerId(player))

                LoadAnimDict("random@mugging5", function()
                    TaskPlayAnim(PlayerPedId(), "random@mugging5", "ig_1_guy_handoff", 8.0, 8.0, -1, 50, 0, false,
                        false, false)
                    Wait(1200)
                    ClearPedTasks(PlayerPedId())
                end)
            else
                if IsEntityPlayingAnim(ped, "missminuteman_1ig_2", "handsup_base", 3) or
                    IsEntityPlayingAnim(ped, "mp_arresting", "idle", 3) then
                    TriggerServerEvent("inventory:server:OpenInventory", "otherplayer", GetPlayerServerId(player))

                    LoadAnimDict("random@mugging5", function()
                        TaskPlayAnim(PlayerPedId(), "random@mugging5", "ig_1_guy_handoff", 8.0, 8.0, -1, 50, 0, false
                            , false, false)
                        Wait(1200)
                        ClearPedTasks(PlayerPedId())
                    end)
                end
            end
        end
    else
        ESX.ShowNotification("Sem jogadores por perto")
    end
end)
