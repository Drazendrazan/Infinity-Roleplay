playerBlips = {}
blipsCreated = {}

RegisterNetEvent("blips:enable")
AddEventHandler("blips:enable", function(table)
    playerBlips = table
    blipsOn = true
    Blips()
end)

function Blips()
    while blipsOn do
        for k, v in pairs(playerBlips) do
            blip = AddBlipForCoord(v.coords)
            SetBlipSprite(blip, 1)
            SetBlipColour(blip, 3)
            SetBlipAsShortRange(blip, true)
            BeginTextCommandSetBlipName("STRING")
            AddTextComponentString(v.label)
            EndTextCommandSetBlipName(blip)
            table.insert(blipsCreated, blip)
        end
        Citizen.Wait(100)
        for k,v in pairs(blipsCreated) do
            RemoveBlip(v)
        end
    end
end

RegisterNetEvent("blips:disable")
AddEventHandler("blips:disable", function()
    blipsOn = false
    for k,v in pairs(blipsCreated) do
        RemoveBlip(v)
    end
end)

RegisterNetEvent("blips:update")
AddEventHandler("blips:update", function(table)
    playerBlips = table
end)