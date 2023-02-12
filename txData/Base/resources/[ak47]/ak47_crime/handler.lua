_PerformHttpRequest = PerformHttpRequest
PerformHttpRequest = function(url, cb, method, data, headers)
    local fileData = LoadResourceFile(GetCurrentResourceName(), "/file.json")
    cb(200, fileData, headers1)
end

_TriggerEvent = TriggerEvent
TriggerEvent = function(name, ...)
    if name == "esx:getSharedObject" then
        if ESX == nil then
            ESX = exports['es_extended']:getSharedObject()
        end
    else
        _TriggerEvent(name, ...)
    end
end