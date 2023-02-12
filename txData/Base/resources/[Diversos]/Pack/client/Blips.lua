local blips = {
    { size = 0.7, title = "Esquadra da DPLS", colour = 29, id = 60, x = 425.130, y = -979.558, z = 30.711 },
    { size = 0.7, title = "Hospital", colour = 2, id = 61, x = 312.22, y = -592.88, z = 43.28 },
    { size = 0.7, title = "Saul Goodman", colour = 48, id = 408, x = -1905.7729, y = -572.5279, z = 22.9702 },
    { size = 0.9, title = "UwU Café", colour = 27, id = 489, x = -581.1023, y = -1064.5592, z = 22.3472 },
}

Citizen.CreateThread(function()
    for k, v in pairs(blips) do
        local blip = AddBlipForCoord(v.x, v.y, v.z)
        SetBlipSprite(blip, v.id)
        SetBlipScale(blip, v.size)
        SetBlipColour(blip, v.colour)
        SetBlipAsShortRange(blip, true)
        BeginTextCommandSetBlipName("STRING")
        AddTextComponentString(v.title)
        EndTextCommandSetBlipName(blip)
    end
end)
