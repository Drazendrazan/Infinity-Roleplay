-- WinRate = If the value is 20, each game there is a 20% chance of winning the prize. 100 means always winnable. 0 means never winnable. When the prize is not winnable the claw will fail to pickup the prize

local defaultPrizes = {
    ['ch_prop_arcade_claw_plush_02a'] = { -- Left Back
        PickupBone = 2,
        offset = vector3(leftSidePrizeX, backPrizeY, defaultZOffsetFloor),
        WinRate = 20,
        Reward = {
            Type = 'Item',
            Item = 'claw2',
            Amount = 1,
        }
    },
    ['ch_prop_arcade_claw_plush_03a'] = { -- Left Center
        PickupBone = 2,
        offset = vector3(leftSidePrizeX, centerPrizeY, defaultZOffsetFloor),
        WinRate = 15,
        Reward = {
            Type = 'Item',
            Item = 'claw3',
            Amount = 1,
        }
    },
    ['ch_prop_arcade_claw_plush_04a'] = { -- Center Back
        PickupBone = 2,
        offset = vector3(centerSidePrizeX, backPrizeY, defaultZOffsetFloor),
        WinRate = 35,
        Reward = {
            Type = 'Item',
            Item = 'claw4',
            Amount = 1,
        }
    },
    ['ch_prop_arcade_claw_plush_05a'] = { -- Center Center
        PickupBone = 2,
        offset = vector3(centerSidePrizeX, centerPrizeY, defaultZOffsetFloor),
        WinRate = 50,
        Reward = {
            Type = 'Item',
            Item = 'claw5',
            Amount = 1,
        }
    },
    ['ch_prop_arcade_claw_plush_06a'] = { -- Center Front
        PickupBone = 0,
        offset = vector3(centerSidePrizeX, frontPrizeY, defaultZOffsetFloor),
        WinRate = 32,
        Reward = {
            Type = 'Item',
            Item = 'claw6',
            Amount = 1,
        }
    },
    ['ch_prop_princess_robo_plush_07a'] = { -- Right Back
        PickupBone = 2,
        offset = vector3(rightSidePrizeX, backPrizeY, defaultZOffsetFloor),
        WinRate = 43,
        Reward = {
            Type = 'Item',
            Item = 'claw9',
            Amount = 1,
        }
    },
    ['ch_prop_shiny_wasabi_plush_08a'] = { -- Right Center
        PickupBone = 2,
        offset = vector3(rightSidePrizeX, centerPrizeY, defaultZOffsetFloor),
        WinRate = 15,
        Reward = {
            Type = 'Item',
            Item = 'claw8',
            Amount = 1,
        }
    },
    ['ch_prop_master_09a'] = { -- Right Front
        PickupBone = 2,
        offset = vector3(rightSidePrizeX, frontPrizeY, defaultZOffsetFloor),
        WinRate = 5,
        Reward = {
            Type = 'Item',
            Item = 'claw7',
            Amount = 1,
        }
    }
}

Config = {
    LoggingLevel = 3, -- 0 = Errors, 1 = Warnings, 2 = Info, 3 = Debug, 4 = Trace
    TargettingMode = 'Command', -- Distance | Command | QBTarget | QTarget
    Machines = {
        ["legion"] = { -- Name of the machine
            MachineModel = 'ch_prop_arcade_claw_01a', -- This is the only model in GTA. If you stream custom claw machine models, change it here.
            Distance = 2.5, -- Distance you have to be from the machine to be able to use it.
            Position = vector3(-575.5870, -1065.2877, 22.3442), -- The position of the machine.
            Heading = 270.4466, -- The heading of the machine.
            ClawMoveSpeed = 0.005, -- The speed of the claw. Increase = faster | Decrease = slower
            Prizes = defaultPrizes, -- Prizes this machine contains
            Price = {
                Type = 'Item', -- Currency/Item
                Currency = 'ficha', -- Currency name/Item name
                Amount = 1, -- Amount to take from player
            },
            DeletePrizeOnWin = false, -- True = Will delete the entity when won | False = Will teleport the entity back to its starting position
            Networked = false  -- [Placeholder for future update] True = machine, claw and prizes will be networked. (This is not recommended as when entities move they are jittery) | False = machine, claw and prizes will be local (Players will not see what other players see)
        },
    }
}

Logger = exports["ssdev_framework"]:GetLogger(GetCurrentResourceName(), Config.LoggingLevel)
Framework = exports["ssdev_framework"]:GetFramework()
