Config = {}
FItems = {}

--░█████╗░██████╗░░█████╗░███████╗████████╗██╗███╗░░██╗░██████╗░
--██╔══██╗██╔══██╗██╔══██╗██╔════╝╚══██╔══╝██║████╗░██║██╔════╝░
--██║░░╚═╝██████╔╝███████║█████╗░░░░░██║░░░██║██╔██╗██║██║░░██╗░
--██║░░██╗██╔══██╗██╔══██║██╔══╝░░░░░██║░░░██║██║╚████║██║░░╚██╗
--╚█████╔╝██║░░██║██║░░██║██║░░░░░░░░██║░░░██║██║░╚███║╚██████╔╝
--░╚════╝░╚═╝░░╚═╝╚═╝░░╚═╝╚═╝░░░░░░░░╚═╝░░░╚═╝╚═╝░░╚══╝░╚═════╝░

Config.Crafting = {
    [1] = {
        name = 'Mesa de Craft',
        isjob = false, --job name or false
        grades = { 'all' }, -- 'all' to allow all grades, { 0 } to allow an specefic grade or { 0, 1, 2 } to a allow more than one grade.
        text =  "[E] - Craft",
        maxDistance = 8.0,
        blip = {
            enabled = false,
            title = "Craft",
            scale = 1.0,
            display = 4,
            colour = 0,
            id = 365
        },
        location = vector3(1716.7416, 3316.9988, 40.6535),
        items = {
            [1] = {
                name = "weapon_switchblade",
                amount = 1,
                info = {},
                costs = {
                    ["lamina"] = 1,
                    ["blowtorch"] = 1,
                    ["iron_metal"] = 1,
                    ["recipe_weapon_switchblade"] = 1,
                    ["arma_mola"] = 1,
                    ["screw"] = 2,
                },
                type = "weapon",
                slot = 1,
                threshold = 0,
                points = 1,
                time = 60000,
            },
            [2] = {
                name = "weapon_pistol",
                amount = 1,
                info = {},
                costs = {
                    ["recipe_weapon_pistol"] = 1,
                    ["cao_arma"] = 10,
                    ["tambor_arma"] = 10,
                    ["arma_mola"] = 10,
                    ["gatilho"] = 10,
                    ["armacao_pistola"] = 10,
                    ["percursor"] = 10,
                    ["cano_arma"] = 10,
                },
                type = "weapon",
                slot = 2,
                threshold = 0,
                points = 1,
                time = 10000,
            },
            [3] = {
                name = "weapon_snspistol",
                amount = 1,
                info = {},
                costs = {
                    ["recipe_weapon_pistolsns"] = 1,
                    ["cao_arma"] = 5,
                    ["tambor_arma"] = 5,
                    ["arma_mola"] = 5,
                    ["gatilho"] = 5,
                    ["armacao_pistola"] = 5,
                    ["percursor"] = 5,
                    ["cano_arma"] = 5,
                },
                type = "weapon",
                slot = 3,
                threshold = 0,
                points = 1,
                time = 10000,
            },
            [4] = {
                name = "weapon_heavypistol",
                amount = 1,
                info = {},
                costs = {
                    ["recipe_weapon_heavypistol"] = 1,
                    ["cao_arma"] = 20,
                    ["tambor_arma"] = 20,
                    ["arma_mola"] = 20,
                    ["gatilho"] = 20,
                    ["armacao_pistola"] = 20,
                    ["percursor"] = 20,
                    ["cano_arma"] = 20,
                },
                type = "weapon",
                slot = 4,
                threshold = 0,
                points = 1,
                time = 10000,
            },
            [5] = {
                name = "methlab",
                amount = 1,
                info = {},
                costs = {
                    ["recipe_methlab"] = 1,
                    ["iron_metal"] = 5,
                    ["seringa"] = 2,
                    ["cpu"] = 1,
                    ["plastico"] = 17,
                    ["vidro"] = 10,
                },
                type = "item",
                slot = 5,
                threshold = 0,
                points = 1,
                time = 10000,
            },
            [6] = {
                name = "advancedlockpick",
                amount = 1,
                info = {},
                costs = {
                    ["recipe_advancedlockpick"] = 1,
                    ["lockpick"] = 3,
                    ["iron_metal"] = 5,
                    ["screwdriver"] = 1,
                    ["screw"] = 15,
                    ["plastico"] = 10,
                },
                type = "item",
                slot = 6,
                threshold = 0,
                points = 1,
                time = 10000,
            },
            [7] = {
                name = "lockpick",
                amount = 1,
                info = {},
                costs = {
                    ["recipe_lockpick"] = 1,
                    ["iron_metal"] = 2,
                    ["screwdriver"] = 1,
                    ["aluminio"] = 15,
                },
                type = "item",
                slot = 7,
                threshold = 0,
                points = 1,
                time = 10000,
            },
            [8] = {
                name = "colete",
                amount = 1,
                info = {},
                costs = {
                    ["recipe_colete"] = 1,
                    ["iron_metal"] = 10,
                    ["aluminio"] = 15,
                    ["screw"] = 20,
                    ["hunter_animal_leather"] = 8,
                    ["kevlar"] = 1,
                },
                type = "item",
                slot = 8,
                threshold = 0,
                points = 1,
                time = 10000,
            },
            [8] = {
                name = "pentrite",
                amount = 1,
                info = {},
                costs = {
                    ["recipe_pentrite"] = 1,
                    ["iron_rock"] = 15,
                    ["plastico"] = 10,
                    ["polvora"] = 20,
                },
                type = "item",
                slot = 8,
                threshold = 0,
                points = 1,
                time = 10000,
            },
            [9] = {
                name = "pistol_ammo",
                amount = 1,
                info = {},
                costs = {
                    ["recipe_pistol_ammo"] = 1,
                    ["iron_rock"] = 10,
                    ["plastico"] = 10,
                    ["pentrite"] = 5,
                    ["cartucho"] = 20,
                },
                type = "item",
                slot = 9,
                threshold = 0,
                points = 1,
                time = 10000,
            },
            [10] = {
                name = "pistol_suppressor",
                amount = 1,
                info = {},
                costs = {
                    ["recipe_pistol_suppressor"] = 1,
                    ["iron_metal"] = 7,
                    ["blowtorch"] = 1,
                    ["screw"] = 20,
                },
                type = "item",
                slot = 10,
                threshold = 0,
                points = 1,
                time = 10000,
            },
            [11] = {
                name = "smg_ammo",
                amount = 1,
                info = {},
                costs = {
                    ["recipe_smg_ammo"] = 1,
                    ["iron_rock"] = 20,
                    ["plastico"] = 20,
                    ["pentrite"] = 10,
                    ["cartucho"] = 40,
                },
                type = "item",
                slot = 11,
                threshold = 0,
                points = 1,
                time = 10000,
            },
            [12] = {
                name = "rifle_ammo",
                amount = 1,
                info = {},
                costs = {
                    ["recipe_rifle_ammo"] = 1,
                    ["iron_rock"] = 30,
                    ["plastico"] = 30,
                    ["pentrite"] = 15,
                    ["cartucho"] = 60,
                },
                type = "item",
                slot = 12,
                threshold = 0,
                points = 1,
                time = 10000,
            },
        }
    }
}


--██╗░░░██╗██╗░██████╗██╗░░░██╗░█████╗░██╗░░░░░
--██║░░░██║██║██╔════╝██║░░░██║██╔══██╗██║░░░░░
--╚██╗░██╔╝██║╚█████╗░██║░░░██║███████║██║░░░░░
--░╚████╔╝░██║░╚═══██╗██║░░░██║██╔══██║██║░░░░░
--░░╚██╔╝░░██║██████╔╝╚██████╔╝██║░░██║███████╗
--░░░╚═╝░░░╚═╝╚═════╝░░╚═════╝░╚═╝░░╚═╝╚══════╝

Config.Marker = { --Modify the Stash marker as you like.
    enablemarker = true,
    type = 27,
    scale = {x = 0.5, y = 0.5, z = 0.5}, 
    colour = {r = 255, g = 255, b = 255, a = 180},
    movement = 1 --Use 0 to disable movement.
}

function DrawText3D(x, y, z, text)
	SetTextScale(0.35, 0.35)
    SetTextFont(4)
    SetTextProportional(1)
    SetTextColour(255, 255, 255, 215)
    SetTextEntry("STRING")
    SetTextCentre(true)
    AddTextComponentString(text)
    SetDrawOrigin(x,y,z, 0)
    DrawText(0.0, 0.0)
    local factor = (string.len(text)) / 370
    DrawRect(0.0, 0.0+0.0125, 0.017+ factor, 0.03, 0, 0, 0, 75)
    ClearDrawOrigin()
end


--███████╗██╗░░░██╗███╗░░██╗░█████╗░████████╗██╗░█████╗░███╗░░██╗░██████╗
--██╔════╝██║░░░██║████╗░██║██╔══██╗╚══██╔══╝██║██╔══██╗████╗░██║██╔════╝
--█████╗░░██║░░░██║██╔██╗██║██║░░╚═╝░░░██║░░░██║██║░░██║██╔██╗██║╚█████╗░
--██╔══╝░░██║░░░██║██║╚████║██║░░██╗░░░██║░░░██║██║░░██║██║╚████║░╚═══██╗
--██║░░░░░╚██████╔╝██║░╚███║╚█████╔╝░░░██║░░░██║╚█████╔╝██║░╚███║██████╔╝
--╚═╝░░░░░░╚═════╝░╚═╝░░╚══╝░╚════╝░░░░╚═╝░░░╚═╝░╚════╝░╚═╝░░╚══╝╚═════╝░

-- NOTE: If you are using second job you should add the event at the end of the code here and add the check you want on the function below
function IsPlayerAuthorized(data) -- Do not edit this if you don't know what you're doing
    if data.isjob then
        if Config.Framework == 'ESX' then
            if ESX.PlayerData.job.name == data.isjob then
                if data.grades == 'all' then
                    return true
                else
                    for k,v in pairs(data.grades) do
                        if ESX.PlayerData.job.grade == v then
                            return true
                        end
                    end
                    return false
                end
                return false
            end
        elseif Config.Framework == 'QBCore' then
            local DataPlayer = QBCore.Functions.GetPlayerData().job
            if DataPlayer.name == data.isjob then
                if data.grades == 'all' then
                    return true
                else
                    for k,v in pairs(data.grades) do
                        if DataPlayer.grade.name == v then
                            return true
                        end
                    end
                    return false
                end
                return false
            end
        end
        return false
    else
        return true
    end
end

--Event Example (** The event must include the "CreateBlips()" function called to refresh the blips.**)

--RegisterNetEvent('esx:setJob2', function(data)
--  ESX.PlayerData.job2 = data
--  CreateBlips()
--end)