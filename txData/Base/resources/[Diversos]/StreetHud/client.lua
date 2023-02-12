Citizen.CreateThread(function ()
    local ped
    local pedCoords
    local streetName
    local compass
    while true do
        ped = PlayerPedId()
        pedCoords = GetEntityCoords(ped)
        streetName, _ = GetStreetNameAtCoord(pedCoords.x, pedCoords.y, pedCoords.z)
        streetName = GetStreetNameFromHashKey(streetName)
        compass = math.floor(360.0 - GetEntityHeading(ped))
        if IsPedInAnyVehicle(ped, false) then
            SendNUIMessage({
                show = true,
                street = streetName,
                compass = (compass > 337.5 and compass < 22.5) and "N" or (compass > 22.5 and compass < 67.5) and "NE" or (compass > 67.5 and compass < 112.5) and "E" or (compass > 112.5 and compass < 157.5) and "SE" or (compass > 157.5 and compass < 202.5) and "S" or (compass > 202.5 and compass < 247.5) and "SO" or (compass > 247.5 and compass < 292.5) and "O" or (compass > 292.5 and compass < 337.5) and "NO" or "N",
                compassName = (compass > 337.5 and compass < 22.5) and "Norte" or (compass > 22.5 and compass < 67.5) and "Nordeste" or (compass > 67.5 and compass < 112.5) and "Este" or (compass > 112.5 and compass < 157.5) and "Sudeste" or (compass > 157.5 and compass < 202.5) and "Sul" or (compass > 202.5 and compass < 247.5) and "Sudoeste" or (compass > 247.5 and compass < 292.5) and "Oeste" or (compass > 292.5 and compass < 337.5) and "Noroeste" or "Norte"
            })
            Citizen.Wait(200)
        else
            SendNUIMessage({
                show = false
            })
            Citizen.Wait(1000)
        end
    end
end)