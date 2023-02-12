local huntPoint = {
    x = -580.4203,
    y = -1060.8580,
    z = 22.3473
}

local animalsSpawnedCount = 0
Citizen.CreateThread(function()
    while true do
        Citizen.Wait(100)
        local pos = GetEntityCoords(PlayerPedId())
        local land = false
        local X, Y = 0, 0

        if Vdist(pos.x, pos.y, pos.z, -580.4203, -1060.8580, 22.3473) > 20 then
            if animalsSpawnedCount < 10 then
                if GetDistanceBetweenCoords(pos, huntPoint.x, huntPoint.y, huntPoint.z, true) < 150 then
                    X = huntPoint.x
                    Y = huntPoint.y
                end
                local pedModel = GetHashKey("a_c_cat_01")
                if not pedModel then return end
                RequestModel(pedModel)
                while not HasModelLoaded(pedModel) or not HasCollisionForModelLoaded(pedModel) do
                    Wait(100)
                end
                posX = X + math.random(-10, 10)
                posY = Y + math.random(-10, 10)
                posZ = 22.3463
                entity = CreatePed(5, pedModel, posX, posY, posZ, 0.0, true, false)
                animalsSpawnedCount = animalsSpawnedCount + 1
                TaskWanderStandard(entity, true, true)
                SetEntityAsMissionEntity(entity, true, true)
            end
        else
            Citizen.Wait(1000)
            animalsSpawnedCount = 0
        end
    end
end)
