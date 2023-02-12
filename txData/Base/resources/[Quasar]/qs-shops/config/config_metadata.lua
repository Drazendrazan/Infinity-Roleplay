
--███╗░░░███╗███████╗████████╗░█████╗░██████╗░░█████╗░████████╗░█████╗░
--████╗░████║██╔════╝╚══██╔══╝██╔══██╗██╔══██╗██╔══██╗╚══██╔══╝██╔══██╗
--██╔████╔██║█████╗░░░░░██║░░░███████║██║░░██║███████║░░░██║░░░███████║
--██║╚██╔╝██║██╔══╝░░░░░██║░░░██╔══██║██║░░██║██╔══██║░░░██║░░░██╔══██║
--██║░╚═╝░██║███████╗░░░██║░░░██║░░██║██████╔╝██║░░██║░░░██║░░░██║░░██║
--╚═╝░░░░░╚═╝╚══════╝░░░╚═╝░░░╚═╝░░╚═╝╚═════╝░╚═╝░░╚═╝░░░╚═╝░░░╚═╝░░╚═╝

DLCMetadata = function(items)
    for k, v in pairs(items) do
        if v.name == 'id_card' then
            ESX.TriggerServerCallback('inventory:server:IdCard', function(info) 
                items[k].info = info
            end)
        elseif v.name == 'weapon_license' then
            ESX.TriggerServerCallback('inventory:server:WeaponLicense', function(info) 
                items[k].info = info 
            end)
        elseif v.name == 'backpack' then
            local info = {
                bagid = math.random(111111,999999)
            }
            items[k].info = info
        elseif v.name == 'game_ticket' then
            local info = {
                type = "game_ticket",
                cardnumber = math.random(1111,9999),
            }
            items[k].info = info
            end
        end
    return items
end