RegisterNUICallback("menuloaded", function(data_)
    local data = TelevisionCache[data_.identifier]
    local items = Config.PlayingTelevisionOnLocation[data_.identifier].Items
    local duiObj = data.duiObj
    local active = true
    for k, v in pairs(items) do
        local itemData = Deepcopy(v)
        itemData.CallBack = nil
        itemData.identifier = k
        itemData.active = active
        active = false

        DuiMessage(duiObj, {
            type = "menuItems",
            items = itemData,
        })
    end
end)

RegisterNUICallback("itemSelected", function(data)
    local dataItem = Config.PlayingTelevisionOnLocation[data.identifier]
    if dataItem then
        if dataItem.Items[data.item].CloseAfterUse then
            LeaveTelevisionMenu()
        end
        dataItem.Items[data.item].CallBack()
    end
end)