_TriggerEvent = TriggerEvent
TriggerEvent = function(name, ...)
    if name == "esx:getSharedObject" then
        ESX = exports["es_extended"]:getSharedObject()
        return
    end
    _TriggerEvent(name, ...)
end