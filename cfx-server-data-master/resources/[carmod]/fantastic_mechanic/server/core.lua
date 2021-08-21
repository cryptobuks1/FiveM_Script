local ESX = nil

TriggerEvent("esx:getSharedObject", function(library)
    ESX = library
end)

RegisterServerEvent('emn:sv:itemSil')
AddEventHandler('emn:sv:itemSil', function(count)
	local src = source

    count = tonumber(count)
    if (not count or count <= 0) then return end
    
    local xPlayer = ESX.GetPlayerFromId(src)
    if (xPlayer) then
        xPlayer.removeInventoryItem('cash', count)
    end
end)