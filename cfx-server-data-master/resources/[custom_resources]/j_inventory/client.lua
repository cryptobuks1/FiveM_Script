ESX = nil
toggleCard = true

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
    SetNuiFocus(true, true)
    SetNuiFocusKeepInput(true)
    createPedScreen()
    SendNUIMessage({
        type = "ui",
        display = true
    })
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