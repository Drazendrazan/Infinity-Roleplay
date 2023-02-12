exports["ssdev_framework"]:CheckForUpdates(GetCurrentResourceName())

local games = {}

Framework:RegisterServerCallback("ssdev_arcade_claw:CreateGame", function (source, cb, machineName)
    local machine = Config.Machines[machineName]
    if not machine then
        Logger:Error("Machine not found: " .. machineName)
        cb(false, {Message = "Machine not found: " .. machineName, WipeGameData = false})
        return
    end

    if(machine.InUseBy) then
        Logger:Error("Machine is already in use")
        cb(false, {Message = "Machine is already in use", WipeGameData = false})
        return
    end
    machine.InUseBy = source

    if(machine.Price) then
        local enough = false
        if(machine.Price.Type == 'Currency') then
            enough = Framework:HasEnoughMoney(source, machine.Price.Currency, machine.Price.Amount)
        elseif(machine.Price.Type == 'Item') then
            enough = Framework:CheckInventoryForItem(source, machine.Price.Currency, machine.Price.Amount)
        end

        if(not enough) then
            Logger:Error("Not enough funds")
            cb(false, {Message = "You do not have enough funds", WipeGameData = false})
            machine.InUseBy = nil
            return
        else
            if(machine.Price.Type == 'Currency') then
                Framework:RemoveMoney(source, machine.Price.Currency, machine.Price.Amount)
            elseif(machine.Price.Type == 'Item') then
                Framework:RemoveItemFromInventory(source, machine.Price.Currency, machine.Price.Amount)
            end
        end
    end

    math.randomseed(os.time())
    local winnablePrizes = {}
    for key, value in pairs(machine.Prizes) do
        local rando = math.random(1, 100)
        if(rando <= value.WinRate) then
            Logger:Debug(key .. ' Is winnable')
            winnablePrizes[key] = true
        else
            Logger:Debug(key .. ' Is not winnable')
            winnablePrizes[key] = false
        end
    end

    for key, value in pairs(winnablePrizes) do
        Logger:Trace("Winnable: " ..   key .. " " .. tostring(value))
    end

    local gameData = {
        Id = Framework:GetRandomString(10),
        MachineName = machineName,
        CreatedAt = GetGameTimer(),
        Source = source,
        WinnablePrizes = winnablePrizes,
        ClaimedPrize = false
    }

    games[gameData.Id] = gameData
    cb(true, gameData)
end)

RegisterServerEvent('ssdev_arcade_claw:Claim')
AddEventHandler('ssdev_arcade_claw:Claim', function(gameId, prize)
    local _source = source
    local game = games[gameId]

    if(prize ~= nil and prize ~= '') then
        if(game == nil) then
            Logger:Warning(_source .. ' attempted to claim a game that does not exist')
            Framework:BanPlayer(_source, "You tried to claim from a game that doesn't exist")
            return
        end

        if(not game.WinnablePrizes[prize]) then
            Logger:Warning(_source .. ' attempted to claim a prize that could not have been winnable in this game')
            Framework:BanPlayer(source, "You tried to claim a prize that could not have been winnable in this game")
            return
        end

        if(game.Source ~= _source) then
            Logger:Warning(_source .. ' attempted to claim a game that is not theirs')
            Framework:BanPlayer(_source, "You tried to claim a game that is not yours")
            return
        end

        if(game.ClaimedPrize) then
            Logger:Warning(_source .. ' attempted to claim a game that has already been claimed')
            Framework:BanPlayer(_source, "You tried to claim a game that has already been claimed")
            return
        end

        local machine = Config.Machines[game.MachineName]
        local reward = machine.Prizes[prize].Reward
        if(reward) then
            if(reward.Type == 'Currency') then
                Framework:AddMoney(_source, reward.Currency, reward.Amount, 'Arcade Claw Machine Reward - ' .. prize .. ' (' .. game.MachineName .. ')')
            elseif(reward.Type == 'Item') then
                Framework:AddItemToInventory(_source, reward.Item, reward.Amount)
            elseif(reward.Type == 'Event') then
                TriggerEvent(_source, reward.Event, game, prize)
            end
        end

        Logger:Info(_source .. ' claimed a prize from game ' .. gameId .. ": " .. prize)
    end

    Config.Machines[game.MachineName].InUseBy = nil
    game.ClaimedPrize = true
    games[gameId] = nil
end)

AddEventHandler('playerDropped', function (reason)
    local _source = source
    for key, machine in pairs(Config.Machines) do
        if(machine.InUseBy == _source) then
            Logger:Info("Machine " .. key .. " was in use by " .. _source .. " but they left, so it is now available")
            machine.InUseBy = nil
        end
    end
end)

AddEventHandler('ssdev_arcade_claw:ExampleWinEvent', function (source, game, prizeName)
    local machine = Config.Machines[game.MachineName]
    local reward = machine.Prizes[prizeName].Reward
    Logger:Debug(source .. " just won " .. prizeName .. " from " .. game.MachineName .. " with reward " .. reward.Type)
end)