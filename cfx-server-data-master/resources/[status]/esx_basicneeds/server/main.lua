ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

ESX.RegisterUsableItem('bread', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)

	xPlayer.removeInventoryItem('bread', 1)

	TriggerClientEvent('esx_status:add', source, 'hunger', 170000)
	TriggerClientEvent('esx_basicneeds:onEat', source)
	TriggerClientEvent('esx:showNotification', source, _U('used_bread'))
end)

ESX.RegisterUsableItem('water', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)

	xPlayer.removeInventoryItem('water', 1)

	TriggerClientEvent('esx_status:add', source, 'thirst', 90000)
	TriggerClientEvent('esx_basicneeds:onDrink', source)
	--TriggerClientEvent("pNotify:SendNotification",1, {text = "กำลังดื่มน้ำ", type = "success",layout = "bottomcenter"})
	TriggerClientEvent('esx:showNotification', source, _U('used_water'))
end)

ESX.RegisterUsableItem('cocacola', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)

	xPlayer.removeInventoryItem('cocacola', 1)

	TriggerClientEvent('esx_status:add', source, 'thirst', 90000)
	TriggerClientEvent('esx_basicneeds:onDrink', source)
--	TriggerClientEvent("pNotify:SendNotification", {text = "กำลังดื่มโค้ก", type = "success",layout = "bottomcenter"})
	TriggerClientEvent('esx:showNotification', source, _U('used_cocacola'))
end)

ESX.RegisterUsableItem('burger', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)

	xPlayer.removeInventoryItem('burger', 1)

	TriggerClientEvent('esx_status:add', source, 'hunger', 170000)
	TriggerClientEvent('esx_basicneeds:onEat', source)
--	TriggerClientEvent("pNotify:SendNotification", {text = "กำลังกินแฮมเบอร์เกอร์", type = "success",layout = "bottomcenter"})
	TriggerClientEvent('esx:showNotification', source, _U('used_burger'))
end)

ESX.RegisterUsableItem('cheesebows', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)

	xPlayer.removeInventoryItem('cheesebows', 1)

	TriggerClientEvent('esx_status:add', source, 'hunger', 120000)
	TriggerClientEvent('esx_basicneeds:onEat', source)
--	TriggerClientEvent("pNotify:SendNotification", {text = "กำลังกินขนมเทสโต้", type = "success",layout = "bottomcenter"})
	TriggerClientEvent('esx:showNotification', source, _U('used_cheesebows'))
end)

ESX.RegisterUsableItem('chips', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)

	xPlayer.removeInventoryItem('chips', 1)

	TriggerClientEvent('esx_status:add', source, 'hunger', 120000)
	TriggerClientEvent('esx_basicneeds:onEat', source)
--	TriggerClientEvent("pNotify:SendNotification", {text = "กำลังกินขนมเลย์", type = "success",layout = "bottomcenter"})
	TriggerClientEvent('esx:showNotification', source, _U('used_chips'))
end)


ESX.RegisterUsableItem('fanta', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)

	xPlayer.removeInventoryItem('fanta', 1)

	TriggerClientEvent('esx_status:add', source, 'thirst', 90000)
	TriggerClientEvent('esx_basicneeds:onDrink', source)
--	TriggerClientEvent("pNotify:SendNotification", {text = "กำลังดื่มแฟนต้าร์", type = "success",layout = "bottomcenter"})
	
end)

ESX.RegisterUsableItem('macka', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)

	xPlayer.removeInventoryItem('macka', 1)

	TriggerClientEvent('esx_status:add', source, 'hunger', 170000)
	TriggerClientEvent('esx_basicneeds:onEat', source)
--	TriggerClientEvent("pNotify:SendNotification", {text = "กำลังกินแซนด์วิส", type = "success",layout = "bottomcenter"})
	TriggerClientEvent('esx:showNotification', source, _U('used_macka'))
end)

ESX.RegisterUsableItem('marabou', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)

	xPlayer.removeInventoryItem('marabou', 1)

	TriggerClientEvent('esx_status:add', source, 'hunger', 120000)
	TriggerClientEvent('esx_basicneeds:onEat', source)
--	TriggerClientEvent("pNotify:SendNotification",-1, {text = "กำลังกินช็อคโกแลต", type = "success",layout = "bottomcenter"})
	TriggerClientEvent('esx:showNotification', source, _U('used_marabou'))
end)


ESX.RegisterUsableItem('pastacarbonara', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)

	xPlayer.removeInventoryItem('pastacarbonara', 1)

	TriggerClientEvent('esx_status:add', source, 'hunger', 170000)
	TriggerClientEvent('esx_basicneeds:onEat', source)
--	TriggerClientEvent("pNotify:SendNotification", {text = "กำลังกินพาสต้า", type = "success",layout = "bottomcenter"})
	TriggerClientEvent('esx:showNotification', source, _U('used_pastacarbonara'))
end)

ESX.RegisterUsableItem('pizza', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)

	xPlayer.removeInventoryItem('pizza', 1)

	TriggerClientEvent('esx_status:add', source, 'hunger', 170000)
	TriggerClientEvent('esx_basicneeds:onEat', source)
--	TriggerClientEvent("pNotify:SendNotification", {text = "กำลังกินพิซซ่า", type = "success",layout = "bottomcenter"})
	TriggerClientEvent('esx:showNotification', source, _U('used_pizza'))

end)

ESX.RegisterUsableItem('sprite', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)

	xPlayer.removeInventoryItem('sprite', 1)

	TriggerClientEvent('esx_status:add', source, 'thirst', 90000)
	TriggerClientEvent('esx_basicneeds:onDrink', source)
--	TriggerClientEvent("pNotify:SendNotification",-1, {text = "กำลังดื่มสไปรท์", type = "success",layout = "bottomcenter"})
	TriggerClientEvent('esx:showNotification', source, _U('used_sprite'))

end)

ESX.RegisterUsableItem('loka', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)

	xPlayer.removeInventoryItem('loka', 1)

	TriggerClientEvent('esx_status:add', source, 'thirst', 90000)
	TriggerClientEvent('esx_basicneeds:onDrink', source)
--	TriggerClientEvent("pNotify:SendNotification", {text = "กำลังดื่มน้ำผลไม้", type = "success",layout = "bottomcenter"})
	TriggerClientEvent('esx:showNotification', source, _U('used_loka'))
	
end)




TriggerEvent('es:addGroupCommand', 'heal', 'admin', function(source, args, user)
	-- heal another player - don't heal source
	if args[1] then
		local playerId = tonumber(args[1])

		-- is the argument a number?
		if playerId then
			-- is the number a valid player?
			if GetPlayerName(playerId) then
				print(('esx_basicneeds: %s healed %s'):format(GetPlayerIdentifier(source, 0), GetPlayerIdentifier(playerId, 0)))
				TriggerClientEvent('esx_basicneeds:healPlayer', playerId)
				TriggerClientEvent('chat:addMessage', source, { args = { '^5HEAL', 'You have been healed.' } })
			else
				TriggerClientEvent('chat:addMessage', source, { args = { '^1SYSTEM', 'Player not online.' } })
			end
		else
			TriggerClientEvent('chat:addMessage', source, { args = { '^1SYSTEM', 'Invalid player id.' } })
		end
	else
		print(('esx_basicneeds: %s healed self'):format(GetPlayerIdentifier(source, 0)))
		TriggerClientEvent('esx_basicneeds:healPlayer', source)
	end
end, function(source, args, user)
	TriggerClientEvent('chat:addMessage', source, { args = { '^1SYSTEM', 'Insufficient Permissions.' } })
end, {help = 'Heal a player, or yourself - restores thirst, hunger and health.', params = {{name = 'playerId', help = '(optional) player id'}}})