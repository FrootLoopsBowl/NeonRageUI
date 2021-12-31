ESX = nil

TriggerEvent('::{korioz#0110}::esx:getSharedObject', function(obj) ESX = obj end)

ESX.RegisterServerCallback('neon:getItem', function(source, cb, item)
	local xPlayer = ESX.GetPlayerFromId(source)
        local items = xPlayer.getInventoryItem(item)
        if items == nil then
            cb(0)
        else
            cb(items.count)
        end
end)