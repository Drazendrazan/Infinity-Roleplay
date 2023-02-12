if Config.QuickAnim.Enabled then 
    
    function HandleQuickAnim(slot)
        if IsPedSprinting(PlayerPedId()) then return end
        if IsPedRunning(PlayerPedId()) then return end
        local prev = UseDefaultFlags
        local animId = GetAnimationFromSet(ActiveSet, slot)
        if not animId then return end
        PlayAnim(animId, flags)
    end


    RegisterCommand('+bindAnim1', function()
        if IsControlPressed(0, 21) or IsDisabledControlPressed(0, 21) then
            HandleQuickAnim(1)
        end
    end, false)

    RegisterCommand('-bindAnim1', function() end, false)
    
    RegisterKeyMapping('+bindAnim1', Translations.QuickAnim1, 'keyboard', Config.QuickAnim.Key1)

    
    RegisterCommand('+bindAnim2', function()
        if IsControlPressed(0, 21) or IsDisabledControlPressed(0, 21) then
            HandleQuickAnim(2)
        end
    end, false)

    RegisterCommand('-bindAnim2', function() end, false)
    RegisterKeyMapping('+bindAnim2', Translations.QuickAnim2, 'keyboard', Config.QuickAnim.Key2)


    RegisterCommand('+bindAnim3', function()
        if IsControlPressed(0, 21) or IsDisabledControlPressed(0, 21) then
            HandleQuickAnim(3)
        end
    end, false)

    RegisterCommand('-bindAnim3', function() end, false)

    RegisterKeyMapping('+bindAnim3', Translations.QuickAnim3, 'keyboard', Config.QuickAnim.Key3)
    
    RegisterCommand('+bindAnim4', function()
        if IsControlPressed(0, 21) or IsDisabledControlPressed(0, 21) then
            HandleQuickAnim(4)
        end
    end, false)

    RegisterCommand('-bindAnim4', function() end, false)

    RegisterKeyMapping('+bindAnim4', Translations.QuickAnim4, 'keyboard', Config.QuickAnim.Key4)

    RegisterCommand('+bindAnim5', function()
        if IsControlPressed(0, 21) or IsDisabledControlPressed(0, 21) then
            HandleQuickAnim(5)
        end
    end, false)
    
    RegisterCommand('-bindAnim5', function() end, false)

    RegisterKeyMapping('+bindAnim5', Translations.QuickAnim5, 'keyboard', Config.QuickAnim.Key5)

    RegisterNetEvent('rd-animations:PlayQuickAnim', function(target, args)
        HandleQuickAnim(args.id)
    end)

    RegisterCommand(Config.ChangeAnimationSetCommand, function(source, args)
        local value = args[1]
        local number = tonumber(value)
        if number then
            ActiveSet = number
        end
    end)

    RegisterNetEvent('rd-animations:ChangeSet', function(target, args)
        ActiveSet = args.id
    end)
end

AddEventHandler('rd-animations:notification', function(message)
    ESX.ShowNotification("ANIMAÇÕES", message, 2000, 'info')
end)