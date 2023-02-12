_TriggerEvent = TriggerEvent
TriggerEvent = function(name, ...)
    if name == 'esx:getSharedObject' then
        return
    end
    _TriggerEvent(name, ...)
end