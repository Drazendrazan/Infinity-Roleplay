--░██████╗░███████╗███╗░░██╗███████╗██████╗░░█████╗░██╗░░░░░
--██╔════╝░██╔════╝████╗░██║██╔════╝██╔══██╗██╔══██╗██║░░░░░
--██║░░██╗░█████╗░░██╔██╗██║█████╗░░██████╔╝███████║██║░░░░░
--██║░░╚██╗██╔══╝░░██║╚████║██╔══╝░░██╔══██╗██╔══██║██║░░░░░
--╚██████╔╝███████╗██║░╚███║███████╗██║░░██║██║░░██║███████╗
--░╚═════╝░╚══════╝╚═╝░░╚══╝╚══════╝╚═╝░░╚═╝╚═╝░░╚═╝╚══════╝

Config = Config or {}

-- which slots are your hot bar
Config.Hotbar = {
     1, 2, 3, 4, 5
}

Config.duration = {
     open = 1, --sec
     close = 1
}

Config.PasswordLength = {
     min = 3,
     max = 5
}

Config.Animation = {
     close = { -- Animation when close the backpack
          Dict = 'clothingshirt',
          Anim = 'try_shirt_positive_d',
          Flag = 49
     },

     open = { -- Animation when Open the backpack
          Dict = 'clothingshirt',
          Anim = 'try_shirt_positive_d',
          Flag = 49
     }
}

-- (important) do not use both prop and cloth at same time just one.
-- (IMPORTANT INTEGRATION WITH QS-SHOPS)
-- If you want to add the backpack to a qs-shop, you must add an ID to the item. this is the example :

--[[ 

     qs-shops/config/config.lua
     
     [1] = {
          name = "backpack",
          label = 'Backpack',
          price = 250,
          amount = 100,
          info = { bagid = 'ID-'..math.random(111111,999999) },
          type = "item",
          slot = 1,
     }, 
     [2] = {
          name = "my_custom_backpack",
          label = 'UwU Backpack',
          price = 250,
          amount = 100,
          info = { bagid = 'UwU ID-'..math.random(111111,999999) },
          type = "item",
          slot = 2,
     }, 
 ]]

Config.items = {
     ['backpack'] = { --- Item name
          slots = 10, -- Slots in inventory
          weight = 10000, -- Max Weight
          locked = false, -- or 'password' to add password
          prop = {
               model = 'vw_prop_vw_backpack_01a',
               animation = {
                    dict = 'amb@world_human_hiker_standing@female@base',
                    anim = 'base',
                    bone = 'Back', -- LeftHand | RightHand
                    attaching_position = {
                         x = -0.10, -- Up - Down
                         y = -0.05, -- Forward Backward
                         z = 0.0, -- Left - Right
                         x_rotation = 10.0,
                         y_rotation = 90.0,
                         z_rotation = 175.0,
                    }
               },
          },
     },
     ['backpack2'] = {
          slots = 6,
          weight = 10000,
          cloth = {
               -- qb-clothing
               --["bag"] = { item = 45, texture = 0 }

               --[[ esx-skin
               male = { ['bags_1'] = 29},
               female = { ['bags_1'] = 93 },
          ]]

          }
     },
     ['briefcase'] = {
          slots = 5,
          weight = 5000,
          locked = 'password', -- Add password
          prop = {
               model = 'prop_ld_suitcase_01',
               animation = {
                    dict = 'missheistdocksprep1hold_cellphone',
                    anim = 'static',
                    bone = 'RightHand',
                    attaching_position = {
                         x = 0.10,
                         y = 0.0,
                         z = 0.0,
                         x_rotation = 0.0,
                         y_rotation = 280.0,
                         z_rotation = 53.0,
                    }
               },
          },
     },
     ['paramedicbag'] = {
          slots = 10,
          weight = 10000,
          prop = {
               model = 'xm_prop_smug_crate_s_medical',
               animation = {
                    dict = 'missheistdocksprep1hold_cellphone',
                    anim = 'static',
                    bone = 'RightHand',
                    attaching_position = {
                         x = 0.29,
                         y = -0.05,
                         z = 0.0,
                         x_rotation = -25.0,
                         y_rotation = 280.0,
                         z_rotation = 75.0,
                    }
               },
          }
     },
}

function SendTextMessage(msg, type) --You can add your notification system here for simple messages.
     if type == 'inform' then
          --SetNotificationTextEntry('STRING')
          --AddTextComponentString(msg)
          --DrawNotification(0, 1)

          -- exports['qs-core']:Notify(msg, "primary")
          -- exports['mythic_notify']:DoHudText('inform', msg)
          exports['okokNotify']:Alert('MOCHILA', msg, 2000, 'info')
          -- QBCore.Functions.Notify(msg, 'primary', 5000)
     end
     if type == 'error' then
          --SetNotificationTextEntry('STRING')
          --AddTextComponentString(msg)
          --DrawNotification(0, 1)

          -- exports['qs-core']:Notify(msg, "error")
          -- exports['mythic_notify']:DoHudText('error', msg)
          exports['okokNotify']:Alert('MOCHILA', msg, 2000, 'error')
          -- QBCore.Functions.Notify(msg, 'error', 5000)
     end
     if type == 'success' then
          --SetNotificationTextEntry('STRING')
          --AddTextComponentString(msg)
          --DrawNotification(0, 1)

          -- exports['qs-core']:Notify(msg, "success")
          -- exports['mythic_notify']:DoHudText('success', msg)
          exports['okokNotify']:Alert('MOCHILA', msg, 2000, 'success')
          -- QBCore.Functions.Notify(msg, 'success', 5000)
     end
end

function Progressbar(name, label, duration, useWhileDead, canCancel, disableControls, animation, prop, propTwo, onFinish
                     , onCancel)
     exports['progressbar']:Progress({
          name = name:lower(),
          duration = duration,
          label = label,
          useWhileDead = useWhileDead,
          canCancel = canCancel,
          controlDisables = disableControls,
          animation = animation,
          prop = prop,
          propTwo = propTwo,
     }, function(cancelled)
          if not cancelled then
               if onFinish ~= nil then
                    onFinish()
               end
          else
               if onCancel ~= nil then
                    onCancel()
               end
          end
     end)
end

function RemoveClothes()

     --[[ ESX     
     local cloth = {
          male = { ['bags_1'] = 0 },
          female = { ['bags_1'] = 0 },
     }
     ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin, jobSkin)
          if skin.sex == 0 then
               TriggerEvent('skinchanger:loadClothes', skin, cloth.male)
               elseif skin.sex == 1 then
               TriggerEvent('skinchanger:loadClothes', skin, cloth.female)
          end
     end)  
     ]]

     --[[ QBCore
     TriggerEvent('qb-clothing:client:loadOutfit', {
          outfitData = {
               ["bag"] = { item = -1, texture = 0 }
          }
     })
]]

end
