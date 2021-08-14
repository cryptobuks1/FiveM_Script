ESX                = nil
PlayersHarvesting  = {}
PlayersHarvesting2 = {}
PlayersHarvesting3 = {}
PlayersCrafting    = {}
PlayersCrafting2   = {}
PlayersCrafting3   = {}

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

if Config.MaxInService ~= -1 then
	TriggerEvent('esx_service:activateService', 'mechanic', Config.MaxInService)
end

TriggerEvent('esx_phone:registerNumber', 'mechanic', _U('mechanic_customer'), true, true)
TriggerEvent('esx_society:registerSociety', 'mechanic', 'mechanic', 'society_mechanic', 'society_mechanic', 'society_mechanic', {type = 'private'})

local function Harvest(source)
	SetTimeout(4000, function()

		if PlayersHarvesting[source] == true then
			local xPlayer = ESX.GetPlayerFromId(source)
			local GazBottleQuantity = xPlayer.getInventoryItem('gazbottle').count

			if GazBottleQuantity >= 5 then
				TriggerClientEvent('esx:showNotification', source, _U('you_do_not_room'))
			else
				xPlayer.addInventoryItem('gazbottle', 1)
				Harvest(source)

				local sendToDiscord = ''	.. xPlayer.name .. ' เบิก ' .. ESX.GetItemLabel('gazbottle') .. ' จำนวน 1'
				TriggerEvent('azael_discordlogs:sendToDiscord', 'MechanicHarvestItem', sendToDiscord, xPlayer.source, '^2')
			end
		end

	end)
end

RegisterServerEvent('esx_mechanicjob:startHarvest')
AddEventHandler('esx_mechanicjob:startHarvest', function()
	local _source = source
	PlayersHarvesting[_source] = true
	TriggerClientEvent('esx:showNotification', _source, _U('recovery_gas_can'))
	Harvest(source)
end)

RegisterServerEvent('esx_mechanicjob:stopHarvest')
AddEventHandler('esx_mechanicjob:stopHarvest', function()
	local _source = source
	PlayersHarvesting[_source] = false
end)

local function Harvest2(source)
	SetTimeout(4000, function()

		if PlayersHarvesting2[source] == true then
			local xPlayer = ESX.GetPlayerFromId(source)
			local FixToolQuantity = xPlayer.getInventoryItem('fixtool').count

			if FixToolQuantity >= 5 then
				TriggerClientEvent('esx:showNotification', source, _U('you_do_not_room'))
			else
				xPlayer.addInventoryItem('fixtool', 1)
				Harvest2(source)

				local sendToDiscord = ''	.. xPlayer.name .. ' เบิก ' .. ESX.GetItemLabel('fixtool') .. ' จำนวน 1'
				TriggerEvent('azael_discordlogs:sendToDiscord', 'MechanicHarvestItem', sendToDiscord, xPlayer.source, '^2')
			end
		end

	end)
end

RegisterServerEvent('esx_mechanicjob:startHarvest2')
AddEventHandler('esx_mechanicjob:startHarvest2', function()
	local _source = source
	PlayersHarvesting2[_source] = true
	TriggerClientEvent('esx:showNotification', _source, _U('recovery_repair_tools'))
	Harvest2(_source)
end)

RegisterServerEvent('esx_mechanicjob:stopHarvest2')
AddEventHandler('esx_mechanicjob:stopHarvest2', function()
	local _source = source
	PlayersHarvesting2[_source] = false
end)

local function Harvest3(source)
	SetTimeout(4000, function()

		if PlayersHarvesting3[source] == true then
			local xPlayer = ESX.GetPlayerFromId(source)
			local CaroToolQuantity = xPlayer.getInventoryItem('carotool').count
			if CaroToolQuantity >= 5 then
				TriggerClientEvent('esx:showNotification', source, _U('you_do_not_room'))
			else
				xPlayer.addInventoryItem('carotool', 1)
				Harvest3(source)

				local sendToDiscord = ''	.. xPlayer.name .. ' เบิก ' .. ESX.GetItemLabel('carotool') .. ' จำนวน 1'
				TriggerEvent('azael_discordlogs:sendToDiscord', 'MechanicHarvestItem', sendToDiscord, xPlayer.source, '^2')
			end
		end

	end)
end

RegisterServerEvent('esx_mechanicjob:startHarvest3')
AddEventHandler('esx_mechanicjob:startHarvest3', function()
	local _source = source
	PlayersHarvesting3[_source] = true
	TriggerClientEvent('esx:showNotification', _source, _U('recovery_body_tools'))
	Harvest3(_source)
end)

RegisterServerEvent('esx_mechanicjob:stopHarvest3')
AddEventHandler('esx_mechanicjob:stopHarvest3', function()
	local _source = source
	PlayersHarvesting3[_source] = false
end)

local function Craft(source)
	SetTimeout(4000, function()

		if PlayersCrafting[source] == true then
			local xPlayer = ESX.GetPlayerFromId(source)
			local GazBottleQuantity = xPlayer.getInventoryItem('gazbottle').count

			if GazBottleQuantity <= 0 then
				TriggerClientEvent('esx:showNotification', source, _U('not_enough_gas_can'))
			else
				xPlayer.removeInventoryItem('gazbottle', 1)
				xPlayer.addInventoryItem('blowpipe', 1)
				Craft(source)

				local sendToDiscord = '' .. xPlayer.name .. ' นำ ' .. ESX.GetItemLabel('gazbottle') .. ' จำนวน 1 ใช้ในการคราฟ'
				TriggerEvent('azael_discordlogs:sendToDiscord', 'MechanicCraftItem', sendToDiscord, xPlayer.source, '^1')

				Citizen.Wait(100)

				local sendToDiscord2 = '' .. xPlayer.name .. ' ได้รับ ' .. ESX.GetItemLabel('blowpipe') .. ' จำนวน 1 จากการคราฟ'
				TriggerEvent('azael_discordlogs:sendToDiscord', 'MechanicCraftItem', sendToDiscord2, xPlayer.source, '^2')
			end
		end

	end)
end

RegisterServerEvent('esx_mechanicjob:startCraft')
AddEventHandler('esx_mechanicjob:startCraft', function()
	local _source = source
	PlayersCrafting[_source] = true
	TriggerClientEvent('esx:showNotification', _source, _U('assembling_blowtorch'))
	Craft(_source)
end)

RegisterServerEvent('esx_mechanicjob:stopCraft')
AddEventHandler('esx_mechanicjob:stopCraft', function()
	local _source = source
	PlayersCrafting[_source] = false
end)

local function Craft2(source)
	SetTimeout(4000, function()

		if PlayersCrafting2[source] == true then
			local xPlayer = ESX.GetPlayerFromId(source)
			local FixToolQuantity = xPlayer.getInventoryItem('fixtool').count

			if FixToolQuantity <= 0 then
				TriggerClientEvent('esx:showNotification', source, _U('not_enough_repair_tools'))
			else
				xPlayer.removeInventoryItem('fixtool', 1)
				xPlayer.addInventoryItem('fixkit', 1)
				Craft2(source)

				local sendToDiscord = '' .. xPlayer.name .. ' นำ ' .. ESX.GetItemLabel('fixtool') .. ' จำนวน 1 ใช้ในการคราฟ'
				TriggerEvent('azael_discordlogs:sendToDiscord', 'MechanicCraftItem', sendToDiscord, xPlayer.source, '^1')

				Citizen.Wait(100)

				local sendToDiscord2 = '' .. xPlayer.name .. ' ได้รับ ' .. ESX.GetItemLabel('fixkit') .. ' จำนวน 1 จากการคราฟ'
				TriggerEvent('azael_discordlogs:sendToDiscord', 'MechanicCraftItem', sendToDiscord2, xPlayer.source, '^2')
			end
		end

	end)
end

RegisterServerEvent('esx_mechanicjob:startCraft2')
AddEventHandler('esx_mechanicjob:startCraft2', function()
	local _source = source
	PlayersCrafting2[_source] = true
	TriggerClientEvent('esx:showNotification', _source, _U('assembling_repair_kit'))
	Craft2(_source)
end)

RegisterServerEvent('esx_mechanicjob:stopCraft2')
AddEventHandler('esx_mechanicjob:stopCraft2', function()
	local _source = source
	PlayersCrafting2[_source] = false
end)

local function Craft3(source)
	SetTimeout(4000, function()

		if PlayersCrafting3[source] == true then
			local xPlayer = ESX.GetPlayerFromId(source)
			local CaroToolQuantity = xPlayer.getInventoryItem('carotool').count

			if CaroToolQuantity <= 0 then
				TriggerClientEvent('esx:showNotification', source, _U('not_enough_body_tools'))
			else
				xPlayer.removeInventoryItem('carotool', 1)
				xPlayer.addInventoryItem('carokit', 1)
				Craft3(source)

				local sendToDiscord = '' .. xPlayer.name .. ' นำ ' .. ESX.GetItemLabel('carotool') .. ' จำนวน 1 ใช้ในการคราฟ'
				TriggerEvent('azael_discordlogs:sendToDiscord', 'MechanicCraftItem', sendToDiscord, xPlayer.source, '^1')

				Citizen.Wait(100)

				local sendToDiscord2 = '' .. xPlayer.name .. ' ได้รับ ' .. ESX.GetItemLabel('carokit') .. ' จำนวน 1 จากการคราฟ'
				TriggerEvent('azael_discordlogs:sendToDiscord', 'MechanicCraftItem', sendToDiscord2, xPlayer.source, '^2')
			end
		end

	end)
end

RegisterServerEvent('esx_mechanicjob:startCraft3')
AddEventHandler('esx_mechanicjob:startCraft3', function()
	local _source = source
	PlayersCrafting3[_source] = true
	TriggerClientEvent('esx:showNotification', _source, _U('assembling_body_kit'))
	Craft3(_source)
end)

RegisterServerEvent('esx_mechanicjob:stopCraft3')
AddEventHandler('esx_mechanicjob:stopCraft3', function()
	local _source = source
	PlayersCrafting3[_source] = false
end)

RegisterServerEvent('esx_mechanicjob:onNPCJobMissionCompleted')
AddEventHandler('esx_mechanicjob:onNPCJobMissionCompleted', function()
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	local total   = math.random(Config.NPCJobEarnings.min, Config.NPCJobEarnings.max);

	if xPlayer.job.grade >= 3 then
		total = total * 2
	end

	TriggerEvent('esx_addonaccount:getSharedAccount', 'society_mechanic', function(account)
		account.addMoney(total)
	end)

	TriggerClientEvent("esx:showNotification", _source, _U('your_comp_earned').. total)
end)

ESX.RegisterUsableItem('blowpipe', function(source)
	local _source = source
	local xPlayer  = ESX.GetPlayerFromId(source)

	xPlayer.removeInventoryItem('blowpipe', 1)

	TriggerClientEvent('esx_mechanicjob:onHijack', _source)
	TriggerClientEvent('esx:showNotification', _source, _U('you_used_blowtorch'))

	local sendToDiscord = ''	.. xPlayer.name .. ' ใช้ ' .. ESX.GetItemLabel('blowpipe') .. ' จำนวน 1'
	TriggerEvent('azael_discordlogs:sendToDiscord', 'MechanicUseItem', sendToDiscord, xPlayer.source, '^2')
end)

ESX.RegisterUsableItem('rag', function(source)
	local _source = source
	local xPlayer  = ESX.GetPlayerFromId(source)
	local xItemCount = math.random(0, 100)
	local xItem = xPlayer.getInventoryItem('wash')
	if xItem.count >= 1 then
		--xPlayer.removeInventoryItem('rag', 1)
		xPlayer.removeInventoryItem('wash', 1)

		TriggerClientEvent("pNotify:SendNotification", source, {
			text = '<center><strong class="red-text">คุณใช้น้ำยาล้างรถไปแล้ว 1 ขวด</strong><center>',
			type = "error",
			timeout = 3000,
			layout = "bottomCenter",
			queue = "global"
		}) 

		if xItemCount >= 75 then
			xPlayer.removeInventoryItem('rag', 1)
			TriggerClientEvent("pNotify:SendNotification", source, {
				text = '<center><strong class="red-text">ผ้าเช็ครถของคุณได้ขาดไปแล้ว</strong><center>',
				type = "error",
				timeout = 3000,
				layout = "bottomCenter",
				queue = "global"
			}) 
		end	

		local sendToDiscord = ''	.. xPlayer.name .. ' ใช้ ' .. ESX.GetItemLabel('rag') .. ' จำนวน 1'
		TriggerEvent('azael_discordlogs:sendToDiscord', 'MechanicUseItem', sendToDiscord, xPlayer.source, '^2')
		TriggerClientEvent('esx_mechanicjob:clean',_source)
		

		
		
		else 
			TriggerClientEvent("pNotify:SendNotification", source, {
				text = '<center><strong class="red-text">คุณไม่มีน้ำยาล้างรถ</strong><center>',
				type = "error",
				timeout = 3000,
				layout = "bottomCenter",
				queue = "global"
			}) 
			print("NO ITEM WASH")
	end
	

end)

ESX.RegisterUsableItem('fixkit', function(source)
	local _source = source
	local xPlayer  = ESX.GetPlayerFromId(source)

	xPlayer.removeInventoryItem('fixkit', 1)

	TriggerClientEvent('esx_mechanicjob:onFixkit', _source)
	TriggerClientEvent('esx:showNotification', _source, _U('you_used_repair_kit'))

	local sendToDiscord = ''	.. xPlayer.name .. ' ใช้ ' .. ESX.GetItemLabel('fixkit') .. ' จำนวน 1'
	TriggerEvent('azael_discordlogs:sendToDiscord', 'MechanicUseItem', sendToDiscord, xPlayer.source, '^2')
end)

ESX.RegisterUsableItem('carokit', function(source)
	local _source = source
	local xPlayer  = ESX.GetPlayerFromId(source)

	xPlayer.removeInventoryItem('carokit', 1)

	TriggerClientEvent('esx_mechanicjob:onCarokit', _source)
	TriggerClientEvent('esx:showNotification', _source, _U('you_used_body_kit'))

	local sendToDiscord = ''	.. xPlayer.name .. ' ใช้ ' .. ESX.GetItemLabel('carokit') .. ' จำนวน 1'
	TriggerEvent('azael_discordlogs:sendToDiscord', 'MechanicUseItem', sendToDiscord, xPlayer.source, '^2')
end)

RegisterServerEvent('esx_mechanicjob:getStockItem')
AddEventHandler('esx_mechanicjob:getStockItem', function(itemName, count)
	local xPlayer = ESX.GetPlayerFromId(source)

	TriggerEvent('esx_addoninventory:getSharedInventory', 'society_mechanic', function(inventory)
		local item = inventory.getItem(itemName)

		-- is there enough in the society?
		if count > 0 and item.count >= count then

			-- can the player carry the said amount of x item?
			if xPlayer.canCarryItem(itemName, count) then
				inventory.removeItem(itemName, count)
				xPlayer.addInventoryItem(itemName, count)
				xPlayer.showNotification(_U('have_withdrawn', count, item.label))

				local sendToDiscord = '' .. xPlayer.name .. ' นำ ' .. item.label .. ' จำนวน ' .. ESX.Math.GroupDigits(count) .. ' ออกจากคลัง'
				TriggerEvent('azael_discordlogs:sendToDiscord', 'MechanicGetItem', sendToDiscord, xPlayer.source, '^3')
			else
				xPlayer.showNotification(_U('player_cannot_hold'))
			end
		else
			xPlayer.showNotification(_U('invalid_quantity'))
		end
	end)
end)

ESX.RegisterServerCallback('esx_mechanicjob:getStockItems', function(source, cb)
	TriggerEvent('esx_addoninventory:getSharedInventory', 'society_mechanic', function(inventory)
		cb(inventory.items)
	end)
end)

RegisterServerEvent('esx_mechanicjob:putStockItems')
AddEventHandler('esx_mechanicjob:putStockItems', function(itemName, count)
	local xPlayer = ESX.GetPlayerFromId(source)

	TriggerEvent('esx_addoninventory:getSharedInventory', 'society_mechanic', function(inventory)
		local item = inventory.getItem(itemName)
		local playerItemCount = xPlayer.getInventoryItem(itemName).count

		if item.count >= 0 and count <= playerItemCount then
			xPlayer.removeInventoryItem(itemName, count)
			inventory.addItem(itemName, count)

			local sendToDiscord = '' .. xPlayer.name .. ' เก็บ ' .. item.label .. ' จำนวน ' .. ESX.Math.GroupDigits(count) .. ' เก็บเข้าคลัง'
			TriggerEvent('azael_discordlogs:sendToDiscord', 'MechanicPutItem', sendToDiscord, xPlayer.source, '^2')
		else
			xPlayer.showNotification(_U('invalid_quantity'))
		end

		xPlayer.showNotification(_U('have_deposited', count, item.label))
	end)
end)

ESX.RegisterServerCallback('esx_mechanicjob:getPlayerInventory', function(source, cb)
	local xPlayer    = ESX.GetPlayerFromId(source)
	local items      = xPlayer.inventory

	cb({items = items})
end)
