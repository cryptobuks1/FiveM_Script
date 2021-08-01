ESX = nil
toggleCard = true
items = {}

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end

	while ESX.GetPlayerData().job == nil do
		Citizen.Wait(10)
	end

	PlayerData = ESX.GetPlayerData()
end)

RegisterKeyMapping('toggle_inventory', 'Inventory', 'keyboard', 'F1')

RegisterCommand("toggle_inventory", function()
    if toggleCard then
        TriggerEvent('j_inventory:open', true)
    else
        TriggerEvent("j_inventory:close", true)
    end
    toggleCard = not toggleCard
end)

RegisterNetEvent('j_inventory:open')
AddEventHandler('j_inventory:open', function()
	items = {}
    ESX.TriggerServerCallback('j_inventory:getPlayerInventory', function(data)
		if data.money ~= nil then
			table.insert(items, {
				label = 'Pare', 
				name = 'money',
				type = 'item_money',
				count = data.money,
				usable = false,
				rare = false,
				canRemove = true,
				desc = 'Sluzi za kupovinu'
			})
		end
		if data.inventory ~= nil then
			for k,v in pairs(data.inventory) do
				print(json.encode(data.inventory[k]))
				if data.inventory[k].count <= 0 then
					data.inventory[k] = nil
				else
					data.inventory[k].type = 'item_standard'
					table.insert(items, data.inventory[k])
				end
			end
		end
		if data.weapons ~= nil then
			for k,v in pairs(data.weapons) do
				if data.weapons[k].name ~= 'WEAPON_UNARMED' then
					local found = false
					if found == false then
						local ammo = GetAmmoInPedWeapon(PlayerPedId(), GetHashKey(data.weapons[k].name))
						table.insert(items, {
							label = data.weapons[k].label,
							count = ammo,
							limit = 250,
							type = 'item_weapon',
							name = data.weapons[k].name,
							usable = false,
							rare = false,
							canRemove = true
						})
					end
				end
			end
		end
		SetNuiFocus(true, true)
		SetNuiFocusKeepInput(true)
		createPedScreen()
		SendNUIMessage({
			type = "ui",
			display = true,
			items = items
		})
	end, GetPlayerServerId(PlayerId()))
	
end)

RegisterNetEvent('j_inventory:close')
AddEventHandler('j_inventory:close', function()
    SetNuiFocus(false, false)
    SetNuiFocusKeepInput(false)
    deletePedScreen()
    SendNUIMessage({
        type = "ui",
        display = false
    })
end)

function createPedScreen() 
	CreateThread(function()
		heading = GetEntityHeading(PlayerPedId())
		upaljeno = true
		SetFrontendActive(true)
		ActivateFrontendMenu(GetHashKey("FE_MENU_VERSION_EMPTY_NO_BACKGROUND"), true, -1)
		Citizen.Wait(100)
		N_0x98215325a695e78a(false)

 		PlayerPedPreview = ClonePed(PlayerPedId(), heading, true, false)
 		local x,y,z = table.unpack(GetEntityCoords(PlayerPedPreview))
 		SetEntityCoords(PlayerPedPreview, x,y,z-10)
 		FreezeEntityPosition(PlayerPedPreview, true)
		SetEntityVisible(PlayerPedPreview, false, false)
		NetworkSetEntityInvisibleToNetwork(PlayerPedPreview, false)
		Wait(200)
		SetPedAsNoLongerNeeded(PlayerPedPreview)
		GivePedToPauseMenu(PlayerPedPreview, 2)
		SetPauseMenuPedLighting(true)
		SetPauseMenuPedSleepState(true)
	end)
end

function deletePedScreen()
	 DeleteEntity(PlayerPedPreview)
	SetFrontendActive(false)
	PlayerPedPreview = nil
end