ESX = nil
TriggerEvent('esx:getSharedObject', function(obj) 
    ESX = obj 
end)

-- RegisterCommand("get",function(source,args)
-- 	local argStr = table.concat(args,"")
-- 	MySQL.Async.fetchAll("SELECT * FROM items", {},
-- 	function(result)
-- 		print('result',json.encode(result))
-- 	end)
-- end)

ESX.RegisterServerCallback("j_inventory:getPlayerInventory", function(source, cb, target)
    local xPlayer = ESX.GetPlayerFromId(target)
    _inventory = xPlayer.inventory;

    if xPlayer ~= nil then
        cb({
            inventory = xPlayer.inventory, 
            money = xPlayer.getMoney(), 
            accounts = xPlayer.accounts, 
            weapons = xPlayer.loadout
        })
    else
        cb(nil)
    end
end)