local ESX = nil;
local PlayerLoaded = false
local currentAccounts = {}
local isDropMoney = false
local isDropBlackMoney = false
local isDropWeapon = false	
Citizen.CreateThread(function ()
	while ESX == nil do
		TriggerEvent("esx:getSharedObject", function(obj) ESX = obj end)
		Citizen.Wait(0)
	end

	while ESX.GetPlayerData().accounts == nil do
		Citizen.Wait(10)
	end

	PlayerData = ESX.GetPlayerData()
	currentAccounts = PlayerData.accounts
end)

RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(xPlayer)
	PlayerLoaded = true
	currentAccounts = xPlayer.accounts
end)

RegisterNetEvent("B_uiitem:SendNotify")
AddEventHandler("B_uiitem:SendNotify", function(type, item, options)
	SendNotify(type, item, options)
end)

function SendNotify(type, item, override_options)
	local options = {}

	if override_options ~= nil then
		options = override_options
	end

	options.inventory =  Config.InventoryPath
	options.timeout = Config.DisplayTimeout * 1000
	options.type = type
	if item.name ~= nil and item.label ~= nil then
		SendNUIMessage({type = 'notify', item = item, options = options})
	else
		print('[uiitem] = > Item Error!')
	end
end

RegisterNetEvent('esx:setAccountMoney')
AddEventHandler('esx:setAccountMoney', function(account)
	print('setAccountMoney')
	for i=1, #currentAccounts, 1 do
	
		if  currentAccounts[i].name == 'black_money' and not isDropBlackMoney	 then
			if currentAccounts[i].money > account.money then
				local money = currentAccounts[i].money - account.money

				TriggerEvent("B_uiitem:SendNotify", 'remove',  {
					name = 'black_money	',
					label = (Config.BlackMoneyLabel):format(ESX.Math.GroupDigits(ESX.Math.Round(money)))
				})
			else
				local money = account.money - currentAccounts[i].money
				TriggerEvent("B_uiitem:SendNotify", 'add',  {
					name = 'black_money	',
					label = (Config.BlackMoneyLabel):format(ESX.Math.GroupDigits(ESX.Math.Round(money)))
				})
			end
		end

		if currentAccounts[i].name == account.name then
			currentAccounts[i] = account
			break
		end

	end
	isDropBlackMoney = false
end)

RegisterNetEvent("es:addedMoney")
AddEventHandler("es:addedMoney", function(m, native, current)
	TriggerEvent("B_uiitem:SendNotify", 'add',  {
		name = 'cash',
		label = (Config.CashLabel):format(m)
	})
end)

RegisterNetEvent("es:removedMoney")
AddEventHandler("es:removedMoney", function(m, native, current)
	if not isDropMoney then
		TriggerEvent("B_uiitem:SendNotify", 'remove',  {
			name = 'cash',
			label = (Config.CashLabel):format(m)
		})
	end
	isDropMoney = false
end)


RegisterNetEvent('_esx:useItem')
AddEventHandler('_esx:useItem', function(item)
	if item.name ~= nil and item.label ~= nil then
		TriggerEvent("B_uiitem:SendNotify", 'use', item)
	end
end)

RegisterNetEvent('_esx:dropItem')
AddEventHandler('_esx:dropItem', function(item)
	if item.name == 'black_money' then
		isDropBlackMoney = true
		item.label = (Config.BlackMoneyLabel):format(item.label)
	end

	if item.name == 'cash' then
		isDropMoney = true
		item.label = (Config.CashLabel):format(item.label)
	end

	if item.name ~= nil and item.label ~= nil then
		TriggerEvent("B_uiitem:SendNotify", 'remove', item, {action = 'ทิ้ง'})
	end
end)

RegisterNetEvent('esx:addInventoryItem')
AddEventHandler('esx:addInventoryItem', function(item, count)
	if item.name ~= nil and item.label ~= nil then
		TriggerEvent("B_uiitem:SendNotify", 'add', item)
	end
end)

RegisterNetEvent('_esx:removeInventoryItem')
AddEventHandler('_esx:removeInventoryItem', function(item, count)

	if item.name ~= nil and item.label ~= nil then
		TriggerEvent("B_uiitem:SendNotify", 'remove', item)
	end
end)

RegisterNetEvent('esx:addWeapon')
AddEventHandler('esx:addWeapon', function(weaponName, ammo)
	local weaponLabel = ESX.GetWeaponLabel(weaponName)
	local item = {
		name = weaponName,
		label = weaponLabel
	}
	TriggerEvent("B_uiitem:SendNotify", 'add', item )
end)

RegisterNetEvent('_esx:dropWeapon')
AddEventHandler('_esx:dropWeapon', function(weaponName)
	isDropWeapon = true	
end)

RegisterNetEvent('esx:removeWeapon')
AddEventHandler('esx:removeWeapon', function(weaponName, ammo)
	if not isDropWeapon	then
		local weaponLabel = ESX.GetWeaponLabel(weaponName)
		local item = {
			name = weaponName,
			label = weaponLabel
		}
		TriggerEvent("B_uiitem:SendNotify", 'remove', item )
	end
	isDropWeapon = false
end)

Citizen.CreateThread(function()
	
	local currentWeapon
	while true do
		if ESX ~= nil then
			if Config.NotifyUseWeapon then
				local playerPed = GetPlayerPed(-1)
				if currentWeapon ~= GetSelectedPedWeapon(playerPed)then
					currentWeapon = GetSelectedPedWeapon(playerPed)
					local _, weapon = GetWeapon(currentWeapon)
					if weapon ~= nil then
						local item = {
							name = weapon.name,
							label = weapon.label
						}
						TriggerEvent("B_uiitem:SendNotify", 'use', item )
					end
				end
			end
		end
		Wait(500)
	end
end)

GetWeapon = function(weaponHash)
	local weapons = ESX.GetWeaponList()
	for i=1, #weapons, 1 do
		if GetHashKey(weapons[i].name) == weaponHash then
			return i, weapons[i]
		end
	end
end