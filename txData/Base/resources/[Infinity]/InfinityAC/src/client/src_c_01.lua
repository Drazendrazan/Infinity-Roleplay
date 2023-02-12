Spawned = false
Loaded = false
Table = {}
flags = 0
isAdmin = nil

AddEventHandler("esx:playerLoaded", function()
    OriginalPed = GetEntityModel(PlayerPedId())
    Loaded = true
end)

AddEventHandler("playerSpawned", function()
    Spawned = true
end)

RegisterNetEvent("InfinityAC:LoadTables")
AddEventHandler("InfinityAC:LoadTables", function(table)
    Table = table
end)

ESX.TriggerServerCallback('InfinityAC:isAdmin', function(data)
    isAdmin = data
end)

Citizen.CreateThread(function()
    while not isAdmin do
        ESX.TriggerServerCallback('InfinityAC:isAdmin', function(data)
            isAdmin = data
        end)
        Citizen.Wait(500)
    end
    -- SpeedHack
    Citizen.CreateThread(function()
        while true do
            if isAdmin then break end
            Citizen.Wait(1000)
            local ped = PlayerPedId()
            local player = PlayerId()
            local speed = GetEntitySpeed(ped)
            local inveh = IsPedInAnyVehicle(ped, false)
            local ragdoll = IsPedRagdoll(ped)
            local jumping = IsPedJumping(ped)
            local falling = IsPedFalling(ped)
            if not inveh then
                if not ragdoll then
                    if not falling then
                        if not jumping then
                            if speed > 13 then
                                flags = flags + 1
                            end
                        end
                    end
                end
            end
        end
    end)

    -- Blacklist Weapon
    Citizen.CreateThread(function()
        if isAdmin then return end
        while not Table["Weapons"] do
            Citizen.Wait(1000)
        end
        local ped
        while true do
            ped = PlayerPedId()
            if IsPedArmed(ped, 6) then
                for _, weapon in pairs(Table["Weapons"]) do
                    if HasPedGotWeapon(PlayerPedId(), GetHashKey(weapon), false) then
                        TriggerServerEvent("InfinityAC:ban", "Utilização de arma na blacklist: " .. weapon)
                    end
                end
            end
            Citizen.Wait(3500)
        end
    end)

    -- Weapon Spawning
    CreateThread(function()
        while true do
            if isAdmin then break end
            local _ped = PlayerPedId()
            local weaponsHasGot = {}
            for _, v in ipairs(ListWeapons) do
                local weaponHash = GetHashKey(v)
                if HasPedGotWeapon(_ped, weaponHash, false) == 1 then
                    table.insert(weaponsHasGot, weaponHash)
                end
            end
            TriggerServerEvent('InfinityAC:VerifyWeapon', weaponsHasGot)
            Wait(5000)
        end
    end)

    -- Blocked CMDS
    Citizen.CreateThread(function()
        if isAdmin then return end
        while not Table["Commands"] do
            Citizen.Wait(1000)
        end
        while true do
            Citizen.Wait(5000)
            for _, cmds in ipairs(GetRegisteredCommands()) do
                for _, blockedcmds in ipairs(Table["Commands"]) do
                    if cmds.name == blockedcmds then
                        TriggerServerEvent("InfinityAC:ban", "Utilização de comando na blacklist: " .. blockedcmds)
                    end
                end
            end
        end
    end)

    -- Spectate
    Citizen.CreateThread(function()
        while true do
            if isAdmin then break end
            Citizen.Wait(3000)
            if NetworkIsInSpectatorMode() then
                TriggerServerEvent("InfinityAC:ban", "Modo espectador detetado")
            end
        end
    end)

    -- Anti Infinite Ammo
    Citizen.CreateThread(function()
        while true do
            if isAdmin then break end
            Citizen.Wait(7500)
            SetPedInfiniteAmmoClip(PlayerPedId(), false)
        end
    end)

    -- Godmode
    Citizen.CreateThread(function()
        local pedHealth
        while true do
            if isAdmin then break end
            Citizen.Wait(5000)
            pedHealth = GetEntityHealth(PlayerPedId())
            if GetPlayerInvincible(PlayerId()) and (Spawned and Loaded) then
                flags = flags + 1
            end
            SetEntityHealth(PlayerPedId(), pedHealth - 2)
            Wait(250)
            if not IsPlayerDead(PlayerPedId()) then
                if GetEntityHealth(PlayerPedId()) == pedHealth and GetEntityHealth(PlayerPedId()) ~= 0 then
                    flags = flags + 1
                elseif GetEntityHealth(PlayerPedId()) == pedHealth - 2 then
                    SetEntityHealth(PlayerPedId(), GetEntityHealth(PlayerPedId()) + 2)
                end
            end
        end
    end)

    -- Plate Changer
    Citizen.CreateThread(function()
        local ped
        local vehicle
        local plate
        local vehicleHash
        local rvehicle
        local rplate
        local rvehicleHash
        while true do
            if isAdmin then break end
            ped = PlayerPedId()
            if IsPedInAnyVehicle(ped, false) then
                vehicle = GetVehiclePedIsIn(ped, false)
                plate = GetVehicleNumberPlateText(vehicle)
                vehicleHash = GetHashKey(vehicle)
                rvehicle = GetVehiclePedIsIn(ped, false)
                rplate = GetVehicleNumberPlateText(rvehicle)
                rvehicleHash = GetHashKey(rvehicle)
                if rplate ~= plate and rvehicleHash == vehicleHash then
                    TriggerServerEvent("InfinityAC:ban", "Alteração de matrícula detetado")
                end
                Wait(0)
            else
                Wait(1000)
            end
        end
    end)

    -- Infinite Stamina
    Citizen.CreateThread(function()
        local ped
        local staminalevel
        while true do
            if isAdmin then break end
            Citizen.Wait(2500)
            ped = PlayerPedId()
            if GetEntitySpeed(ped) > 7 and not IsPedInAnyVehicle(ped, true) and not IsPedFalling(ped) and
                not IsPedInParachuteFreeFall(ped) and not IsPedJumpingOutOfVehicle(ped) and not IsPedRagdoll(ped) then
                staminalevel = GetPlayerSprintStaminaRemaining(PlayerId())
                if tonumber(staminalevel) == tonumber(0.0) then
                    flags = flags + 1
                end
            end
        end
    end)

    -- Anti Ragdoll
    Citizen.CreateThread(function()
        local ped
        while true do
            if isAdmin then break end
            Citizen.Wait(2500)
            ped = PlayerPedId()
            if not CanPedRagdoll(ped) and not IsPedInAnyVehicle(ped, true) and
                not IsEntityDead(ped) and not IsPedJumpingOutOfVehicle(ped) and
                not IsPedJacking(ped) and IsPedRagdoll(ped) then
                flags = flags + 1
            end
        end
    end)

    -- Blacklist Plate
    Citizen.CreateThread(function()
        if isAdmin then return end
        while not Table["Plates"] do
            Citizen.Wait(1000)
        end
        local ped
        local plate
        while true do
            Citizen.Wait(1000)
            ped = PlayerPedId()
            if IsPedInAnyVehicle(ped, false) then
                for _, blockedPlate in ipairs(Table["Plates"]) do
                    plate = GetVehicleNumberPlateText(GetVehiclePedIsIn(ped, false), false)
                    if plate == blockedPlate then
                        TriggerServerEvent("InfinityAC:ban", "Utilização de matrícula na blacklist: " .. blockedPlate)
                    end
                end
            end
        end
    end)

    -- Thermal Vision
    Citizen.CreateThread(function()
        while true do
            if isAdmin then break end
            Citizen.Wait(1000)
            local ped = PlayerPedId()
            if GetUsingseethrough() then
                if not IsPedInAnyHeli(ped) then
                    flags = flags + 1
                end
            end
        end
    end)

    -- Night Vision
    Citizen.CreateThread(function()
        while true do
            if isAdmin then break end
            Citizen.Wait(1000)
            local ped = PlayerPedId()
            if GetUsingnightvision() then
                if not IsPedInAnyHeli(ped) then
                    flags = flags + 1
                end
            end
        end
    end)

    -- Invisible
    Citizen.CreateThread(function()
        while true do
            if isAdmin then break end
            Citizen.Wait(1000)
            local ped = PlayerPedId()
            if not IsEntityVisible(ped) then
                SetEntityVisible(ped, 1, 0)
                flags = flags + 1
                ESX.ShowNotification("Voltaste a ser visível")
            end
        end
    end)

    -- SuperJump
    Citizen.CreateThread(function()
        while true do
            if isAdmin then break end
            Citizen.Wait(1000)
            local ped = PlayerPedId()
            local player = PlayerId()
            if IsPedJumping(ped) then
                local firstCoord = GetEntityCoords(ped)

                while IsPedJumping(ped) do
                    Wait(0)
                end

                local secondCoord = GetEntityCoords(ped)
                local lengthBetweenCoords = #(firstCoord - secondCoord)

                if (lengthBetweenCoords > 20.0) then
                    flags = flags + 1
                end
            end
        end
    end)

    -- FreeCam
    Citizen.CreateThread(function()
        local x, y, z
        while true do
            if isAdmin then break end
            Citizen.Wait(1000)
            if (Spawned and Loaded) then
                x, y, z = table.unpack(GetEntityCoords(PlayerPedId()) - GetFinalRenderedCamCoord())
                if (x > 50) or (y > 50) or (z > 50) or (x < -50) or (y < -50) or (z < -50) then
                    TriggerServerEvent("InfinityAC:ban", "Freecam detetado")
                end
            end
        end
    end)

    -- Menyoo
    Citizen.CreateThread(function()
        while true do
            if isAdmin then break end
            Citizen.Wait(1000)
            if (Spawned and Loaded) then
                if IsPlayerCamControlDisabled() ~= false then
                    TriggerServerEvent("InfinityAC:ban", "Menyoo detetado")
                end
            end
        end
    end)

    -- Armor
    Citizen.CreateThread(function()
        while true do
            if isAdmin then break end
            Citizen.Wait(1000)
            local armor = GetPedArmour(PlayerPedId())
            if armor > 100 then
                TriggerServerEvent("InfinityAC:ban", "Armadura acima do permitido: " .. armor .. "/100")
            end
        end
    end)

    -- Weapon Damage Changer
    Citizen.CreateThread(function()
        if isAdmin then return end
        while not Table["Weapons"] do
            Citizen.Wait(1000)
        end
        local weapon
        local damage
        while true do
            Citizen.Wait(1000)
            weapon = GetSelectedPedWeapon(PlayerPedId())
            damage = math.floor(GetWeaponDamage(weapon))
            local weapon = Table["Weapons"][weapon]
            if weapon and damage > weapon.damage then
                TriggerServerEvent("InfinityAC:ban",
                    "Alteração do dano das armas:\nArma: " .. weapon .. "\nDano: " .. damage .. "/" .. weapon.damage)
            end
        end
    end)

    -- AimAssist
    Citizen.CreateThread(function()
        while true do
            if isAdmin then break end
            Citizen.Wait(5000)
            SetPlayerTargetingMode(0)
        end
    end)

    -- Anti Aimbot
    Citizen.CreateThread(function()
        while true do
            if isAdmin then break end
            Citizen.Wait(1000)
            if IsAimCamActive() then
                local isAiming, Entity = GetEntityPlayerIsFreeAimingAt(PlayerId())
                if isAiming and Entity then
                    if IsEntityAPed(Entity) and not IsEntityDead(Entity) and not IsPedStill(Entity) and
                        not IsPedStopped(Entity) and not IsPedInAnyVehicle(Entity, false) then
                        local EntityCoords = GetEntityCoords(Entity)
                        local _, screenx, screeny = GetScreenCoordFromWorldCoord(EntityCoords.x, EntityCoords.y,
                            EntityCoords.z)
                        if screenx == lastcoordsx or screeny == lastcoordsy then
                            TriggerServerEvent("InfinityAC:ban", "Aimbot detetado")
                        end
                        lastcoordsx = screenx
                        lastcoordsy = screeny
                    end
                end
            end
        end
    end)

    -- Anti Explosive Ammo
    Citizen.CreateThread(function()
        local weapon
        local damage
        while true do
            if isAdmin then break end
            Citizen.Wait(1000)
            weapon = GetSelectedPedWeapon(PlayerPedId())
            damage = GetWeaponDamageType(weapon)
            SetWeaponDamageModifier(GetHashKey("WEAPON_EXPLOSION"), 0.0)
            if damage == 4 or damage == 5 or damage == 6 or damage == 13 then
                TriggerServerEvent("InfinityAC:ban", "Munição explosiva detetado")
            end
        end
    end)

    -- Anti Blacklist Tasks
    Citizen.CreateThread(function()
        if isAdmin then return end
        while not Table["Tasks"] do
            Citizen.Wait(1000)
        end
        while true do
            Citizen.Wait(1000)
            for _, task in pairs(Table["Tasks"]) do
                if GetIsTaskActive(PlayerPedId(), task) then
                    TriggerServerEvent("InfinityAC:ban", "Utilização de tarefa na blacklist: " .. task)
                end
            end
        end
    end)

    -- Anti Blacklist Animations
    Citizen.CreateThread(function()
        if isAdmin then return end
        while not Table["Anims"] do
            Citizen.Wait(1000)
        end
        while true do
            Citizen.Wait(1000)
            for _, anim in pairs(Table["Anims"]) do
                if IsEntityPlayingAnim(PlayerPedId(), anim[1], anim[2], 3) then
                    TriggerServerEvent("InfinityAC:ban", "Utilização de animação na blacklist: " .. anim)
                    ClearPedTasksImmediately(PlayerPedId())
                    ClearPedTasks(PlayerPedId())
                    ClearPedSecondaryTask(PlayerPedId())
                end
            end
        end
    end)

    -- Anti Tiny Ped
    Citizen.CreateThread(function()
        while true do
            Citizen.Wait(1000)
            if isAdmin then break end
            local Tiny = GetPedConfigFlag(PlayerPedId(), 223, true)
            if Tiny then
                TriggerServerEvent("InfinityAC:ban", "Modificação do tamanho do personagem detetado")
            end
            Wait(100)
        end
    end)

    Citizen.CreateThread(function()
        while true do
            if isAdmin then break end
            local playerPed = PlayerPedId()
            local playercoords = GetEntityCoords(PlayerPedId())
            if (playercoords.x > 0 or playercoords.x < 0) then
                Citizen.Wait(500)
                local newplayercoords = GetEntityCoords(PlayerPedId())
                if GetEntityHeightAboveGround(playerPed) > 25 and not IsPedInAnyVehicle(playerPed, false) and
                    not IsPedInParachuteFreeFall(playerPed) and not IsPedFalling(playerPed) and
                    not IsPedJumpingOutOfVehicle(playerPed) and not IsEntityVisible(playerPed) and
                    not IsPlayerDead(playerPed) and GetPedParachuteState(playerPed) == -1 then
                    if (not IsPedInAnyVehicle(playerPed, 0) and not IsPedOnVehicle(playerPed) and
                        not IsPlayerRidingTrain(PlayerId())) then
                        if (
                            GetDistanceBetweenCoords(playercoords.x, playercoords.y, playercoords.z, newplayercoords.x,
                                newplayercoords.y, newplayercoords.z, 0) > 10.0) then
                            TriggerServerEvent("InfinityAC:ban", "Teleport/NoClip detetado")
                        end
                    end
                    playercoords = newplayercoords
                else
                    playercoords = newplayercoords
                end
            end
            Citizen.Wait(2000)
        end
    end)

    Citizen.CreateThread(function()
        for i = 1, #ListWeaponsHashes do
            local dmg_mod = GetWeaponComponentDamageModifier(ListWeaponsHashes[i])
            local accuracy_mod = GetWeaponComponentAccuracyModifier(ListWeaponsHashes[i])
            if dmg_mod > 1.1 or accuracy_mod > 1.2 then
                TriggerServerEvent("InfinityAC:ban", "Alteração na pasta AI detetado")
            end
        end
    end)

    Citizen.CreateThread(function()
        if isAdmin then return end
        while not Table["Vehicles"] do
            Citizen.Wait(1000)
        end
        local vehicle
        local vehicleModel
        while true do
            local ped = PlayerPedId()
            if IsPedInAnyVehicle(ped, false) then
                vehicle = GetVehiclePedIsIn(ped, false)
                vehicleModel = GetEntityModel(vehicle)
                for _, v in pairs(Table["Vehicles"]) do
                    if vehicleModel == GetHashKey(v) then
                        TriggerServerEvent("InfinityAC:ban", "Utilização de veículo na blacklist: " .. v)
                    end
                end
            end
            Citizen.Wait(5000)
        end
    end)

    -- AntiMenus
    Citizen.CreateThread(function()
        while true do
            if isAdmin then break end
            Citizen.Wait(2000)
            local DetectableTextures = {
                { txd = "HydroMenu", txt = "HydroMenuHeader", name = "HydroMenu" },
                { txd = "John", txt = "John2", name = "SugarMenu" },
                { txd = "darkside", txt = "logo", name = "Darkside" },
                { txd = "ISMMENU", txt = "ISMMENUHeader", name = "ISMMENU" },
                { txd = "dopatest", txt = "duiTex", name = "Copypaste Menu" },
                { txd = "fm", txt = "menu_bg", name = "Fallout Menu" },
                { txd = "wave", txt = "logo", name = "Wave" },
                { txd = "wave1", txt = "logo1", name = "Wave (alt.)" },
                { txd = "meow2", txt = "woof2", name = "Alokas66", x = 1000, y = 1000 },
                { txd = "adb831a7fdd83d_Guest_d1e2a309ce7591dff86",
                    txt = "adb831a7fdd83d_Guest_d1e2a309ce7591dff8Header6",
                    name = "Guest Menu" },
                { txd = "hugev_gif_DSGUHSDGISDG", txt = "duiTex_DSIOGJSDG", name = "HugeV Menu" },
                { txd = "MM", txt = "menu_bg", name = "Metrix Mehtods" },
                { txd = "wm", txt = "wm2", name = "WM Menu" },
                { txd = "NeekerMan", txt = "NeekerMan1", name = "Lumia Menu" },
                { txd = "Blood-X", txt = "Blood-X", name = "Blood-X Menu" },
                { txd = "Dopamine", txt = "Dopameme", name = "Dopamine Menu" },
                { txd = "Fallout", txt = "FalloutMenu", name = "Fallout Menu" },
                { txd = "Luxmenu", txt = "Lux meme", name = "LuxMenu" },
                { txd = "Reaper", txt = "reaper", name = "Reaper Menu" },
                { txd = "absoluteeulen", txt = "Absolut", name = "Absolut Menu" },
                { txd = "KekHack", txt = "kekhack", name = "KekHack Menu" },
                { txd = "Maestro", txt = "maestro", name = "Maestro Menu" },
                { txd = "SkidMenu", txt = "skidmenu", name = "Skid Menu" },
                { txd = "Brutan", txt = "brutan", name = "Brutan Menu" },
                { txd = "FiveSense", txt = "fivesense", name = "Fivesense Menu" },
                { txd = "NeekerMan", txt = "NeekerMan1", name = "Lumia Menu" },
                { txd = "Auttaja", txt = "auttaja", name = "Auttaja Menu" },
                { txd = "BartowMenu", txt = "bartowmenu", name = "Bartow Menu" },
                { txd = "Hoax", txt = "hoaxmenu", name = "Hoax Menu" },
                { txd = "FendinX", txt = "fendin", name = "Fendinx Menu" },
                { txd = "Hammenu", txt = "Ham", name = "Ham Menu" },
                { txd = "Lynxmenu", txt = "Lynx", name = "Lynx Menu" },
                { txd = "Oblivious", txt = "oblivious", name = "Oblivious Menu" },
                { txd = "malossimenuv", txt = "malossimenu", name = "Malossi Menu" },
                { txd = "memeeee", txt = "Memeeee", name = "Memeeee Menu" },
                { txd = "tiago", txt = "Tiago", name = "Tiago Menu" },
                { txd = "Hydramenu", txt = "hydramenu", name = "Hydra Menu" },
                { txd = "dopamine", txt = "Swagamine", name = "Dopamine" },
                { txd = "HydroMenu", txt = "HydroMenuHeader", name = "Hydro Menu" },
                { txd = "HydroMenu", txt = "HydroMenuLogo", name = "Hydro Menu" },
                { txd = "HydroMenu", txt = "https://i.ibb.co/0GhPPL7/Hydro-New-Header.png", name = "Hydro Menu" },
                { txd = "test", txt = "Terror Menu", name = "Terror Menu" },
                { txd = "lynxmenu", txt = "lynxmenu", name = "Lynx Menu" },
                { txd = "Maestro 2.3", txt = "Maestro 2.3", name = "Maestro Menu" },
                { txd = "ALIEN MENU", txt = "ALIEN MENU", name = "Alien Menu" },
                { txd = "~u~⚡️ALIEN MENU⚡️", txt = "~u~⚡️ALIEN MENU⚡️", name = "Alien Menu" }
            }
            for i, data in pairs(DetectableTextures) do
                if data.x and data.y then
                    if GetTextureResolution(data.txd, data.txt).x == data.x and
                        GetTextureResolution(data.txd, data.txt).y == data.y then
                        TriggerServerEvent("InfinityAC:ban", "Utilização de menu detetado: " .. data.name)
                    end
                else
                    if GetTextureResolution(data.txd, data.txt).x ~= 4.0 then
                        TriggerServerEvent("InfinityAC:ban", "Utilização de menu detetado: " .. data.name)
                    end
                end
            end
        end
    end)

    CreateThread(function()
        while true do
            Wait(500)
            if flags >= 5 then
                flags = 0
                TriggerServerEvent("InfinityAC:ban", "Cheating")
            end
        end
    end)
end)
