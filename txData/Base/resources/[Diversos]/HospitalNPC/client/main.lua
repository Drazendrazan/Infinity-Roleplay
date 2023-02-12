Citizen.CreateThread(function()
    while not ESX do
        ESX = exports["es_extended"]:getSharedObject()

        Citizen.Wait(100)
    end

    Initialized()
end)

Citizen.CreateThread(function()
    while true do
        local sleepThread = 5000

        local newPed = PlayerPedId()

        if Ped ~= newPed then
            Ped = newPed
        end

        Citizen.Wait(sleepThread)
    end
end)

Citizen.CreateThread(function()
    Citizen.Wait(500)

    while true do
        local sleepThread = 1000

        local ped = Ped
        local pedCoords = GetEntityCoords(ped)

        if Medics[1] ~= nil then
            local vectorloc = vector3(312.22305297852, -592.88073730469, 43.284034729004)
            local dstCheck = #(pedCoords - vectorloc)

            if dstCheck <= 1.7 then
                sleepThread = 5
                
                local usable = Medics[1]

                local displayText = usable and "[~y~E~s~] ~b~Tratamento hospitalar~s~ (~g~€1000~s~)" or "O ~b~Sr. Mário~s~ está ~r~indisponível~s~, aguarda."

                if usable and IsControlJustPressed(0, 38) then
                    TryToGetMedicalTreatment(1)
                end

                DrawScriptText(vectorloc, displayText)
            else
                Citizen.Wait(sleepThread)
            end
        end

        Citizen.Wait(sleepThread)
    end
end)
