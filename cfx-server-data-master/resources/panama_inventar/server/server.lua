ESX = nil
TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

ESX.RegisterServerCallback("panama_inventar:getPlayerInventory", function(source, cb, target)
		local xPlayer = ESX.GetPlayerFromId(target)

		if xPlayer ~= nil then
			cb({inventory = xPlayer.inventory, money = xPlayer.getMoney(), accounts = xPlayer.accounts, weapons = xPlayer.loadout})
		else
			cb(nil)
		end
	end
)

RegisterServerEvent('panama_inventar:removeMoney')
AddEventHandler('panama_inventar:removeMoney', function(source, account, num) 
	local _source = source
	if account == 'money' then
		local _source = source
		local xPlayer = ESX.GetPlayerFromId(_source)
		if xPlayer.getMoney() - num >= 0 then
			xPlayer.removeAccountMoney(account, num)
		else 
			TriggerClientEvent('panama_notifikacije:sendNotification', _source, 'fas fa-user', 'Nemate dovoljno novca', 3000)
		end
	elseif account == 'black_money' then
		local _source = source
		local xPlayer = ESX.GetPlayerFromId(_source)
		if xPlayer.getMoney() - num >= 0 then
			xPlayer.removeAccountMoney(account, num)
		else 
			TriggerClientEvent('panama_notifikacije:sendNotification', _source, 'fas fa-user', 'Nemate dovoljno novca', 3000)
		end
	end
end)
