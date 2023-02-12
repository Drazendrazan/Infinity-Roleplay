RegisterNetEvent('PedDensityModifier:RemoveBennysPeds', function()
    for _, v in pairs(GetAllPeds()) do
        if DoesEntityExist(v) and not IsPedAPlayer(v) then
            local coords = DoesEntityExist(v) and GetEntityCoords(v) or nil
            if coords ~= nil then
                if #(vector3(coords.x, coords.y, coords.z) - vector3(-208.7071, -1335.7456, 34.8893)) < 20.0 then
                    DeleteEntity(v)
                end
            end
        end
    end
end)
