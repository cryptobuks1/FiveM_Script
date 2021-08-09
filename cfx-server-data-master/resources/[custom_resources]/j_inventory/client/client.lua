ESX = nil
toggleCard = true
items = {}
slot = {}

Citizen.CreateThread(function()

    while ESX == nil do
        TriggerEvent('esx:getSharedObject', function(obj)
            ESX = obj
        end)
        Citizen.Wait(0)
    end

    while ESX.GetPlayerData().job == nil do
        Citizen.Wait(10)
    end

    PlayerData = ESX.GetPlayerData()
end)

RegisterKeyMapping('toggle_inventory', 'Inventory', 'keyboard', 'TAB')

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
            for k, v in pairs(data.inventory) do
                if data.inventory[k].count <= 0 then
                    data.inventory[k] = nil
                else
                    data.inventory[k].type = 'item_standard'
                    table.insert(items, data.inventory[k])
                end
            end
        end
        if data.weapons ~= nil then
            for k, v in pairs(data.weapons) do
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

RegisterNUICallback("UseItem", function(data, cb)
    TriggerServerEvent("esx:useItem", data.item.name)
    Citizen.Wait(50)
    createPedScreen()
    TriggerEvent('j_inventory:open', true)

    cb("ok")
end)

RegisterNUICallback("DropItem", function(data, cb)
    local ped = PlayerPedId()
    if IsPedSittingInAnyVehicle(playerPed) then
        return
    end

    if data.item.name == "identitycard" or data.item.name == "drivercard" or data.item.name == "weaponcard" then
        exports['mythic_notify']:DoCustomHudText('inform', "ไม่สามารถทิ้งได้", 4000)
    elseif type(data.number) == "number" and math.floor(data.number) == data.number then
        Wait(250)
        ESX.Streaming.RequestAnimDict('pickup_object', function()
            -- loop => 8.0, -8, -1, 49, 0, 0, 0, 0
            TaskPlayAnim(ped, 'pickup_object', 'pickup_low', 8.0, -8, 1750, 49, 0, 0, 0, 0)
            Citizen.Wait(1000)
            TriggerServerEvent("esx:removeInventoryItem", data.item.type, data.item.name, data.number)
        end)
        -- RequestAnimDict("pickup_object")
        -- Wait(250)
        -- TaskPlayAnim(ped, "pickup_object", "pickup_low",  8.0, -8, 2250, 49, 0, 0, 0, 0)
        -- Wait(400)
        -- TriggerServerEvent("esx:removeInventoryItem", data.item.type, data.item.name, data.number)

        -- การ Clear animation => ClearPedSecondaryTask(ped)
    end

    Wait(250)
    TriggerEvent('j_inventory:open', true)
    createPedScreen()

    cb("ok")
end)

-- RegisterNUICallback(
--     "GiveItem",
--     function(data, cb)
--         local playerPed = PlayerPedId()
--         local players, nearbyPlayer = ESX.Game.GetPlayersInArea(GetEntityCoords(playerPed), 3.0)
--         local foundPlayer = false
--         for i = 1, #players, 1 do
--             if players[i] ~= PlayerId() then
--                 if GetPlayerServerId(players[i]) == data.player then
--                     foundPlayer = true
--                 end
--             end
--         end
--         if foundPlayer then
--             local count = tonumber(data.number)

--             if data.item.type == "item_weapon" then
--                 count = GetAmmoInPedWeapon(PlayerPedId(), GetHashKey(data.item.name))
--                 TriggerServerEvent("esx:giveInventoryItem", data.player, data.item.type, data.item.name, count)
--             elseif data.item.name == "identitycard" then
--               for i = 1, #players, 1 do
--                   if players[i] ~= PlayerId() then
--                       if GetPlayerServerId(players[i]) == data.player then
--                           TriggerEvent('monster-idcard:open', GetPlayerServerId(players[i]))
--                       end
--                   end
--               end

--             elseif data.item.name == "drivercard" then
--               for i = 1, #players, 1 do
--                   if players[i] ~= PlayerId() then
--                       if GetPlayerServerId(players[i]) == data.player then
--                           TriggerEvent('monster-idcard:open', GetPlayerServerId(players[i]), "driver")

--                       end
--                   end
--               end

--             elseif data.item.name == "weaponcard" then
--               -- TriggerEvent('monster-idcard:open', data.player)
--               for i = 1, #players, 1 do
--                   if players[i] ~= PlayerId() then
--                       if GetPlayerServerId(players[i]) == data.player then
--                           TriggerEvent('monster-idcard:open', GetPlayerServerId(players[i]), "weapon")

--                       end
--                   end
--               end

--             else
--               TriggerServerEvent("esx:giveInventoryItem", data.player, data.item.type, data.item.name, count)
--             end

--             TriggerServerEvent("esx:giveInventoryItem", data.player, data.item.type, data.item.name, count)
--             Wait(250)
--             TriggerEvent('j_inventory:open', true)
--         else
--             exports.pNotify:SendNotification(
--                 {
--                     text = _U("player_nearby"),
--                     type = "error",
--                     timeout = 3000,
--                     layout = "bottomCenter",
--                     queue = "inventoryhud"
--                 }
--             )
--         end
--         cb("ok")
--     end
-- )

function createPedScreen()
    CreateThread(function()
        heading = GetEntityHeading(PlayerPedId())
        upaljeno = true
        SetFrontendActive(true)
        ActivateFrontendMenu(GetHashKey("FE_MENU_VERSION_EMPTY_NO_BACKGROUND"), true, -1)
        Citizen.Wait(100)
        N_0x98215325a695e78a(false)

        PlayerPedPreview = ClonePed(PlayerPedId(), heading, true, false)
        local x, y, z = table.unpack(GetEntityCoords(PlayerPedPreview))
        SetEntityCoords(PlayerPedPreview, x, y, z - 10)
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

RegisterCommand('+slot1', function()
	useSlotItem(1)
end,false)
RegisterKeyMapping('+slot1', 'Slot1', 'keyboard', '1')
RegisterCommand('+slot2', function()
	useSlotItem(2)
end,false)
RegisterKeyMapping('+slot2', 'Slot2', 'keyboard', '2')
RegisterCommand('+slot3', function()
	useSlotItem(3)
end,false)
RegisterKeyMapping('+slot3', 'Slot3', 'keyboard', '3')
RegisterCommand('+slot4', function()
	useSlotItem(4)
end,false)
RegisterKeyMapping('+slot4', 'Slot1', 'keyboard', '4')
RegisterCommand('+slot5', function()
	useSlotItem(5)
end,false)
RegisterKeyMapping('+slot5', 'Slot5', 'keyboard', '5')


RegisterNUICallback("setItemSlot", function(data, cb)
    slot[data.key] = data.item
    print(json.encode(data))
	-- TriggerServerEvent("esx:useItem", data.item)
	cb("ok")
end)


function useSlotItem(key)
    TriggerServerEvent("esx:useItem", slot[key])
    Citizen.Wait(50)
    if not toggleCard then
        TriggerEvent('j_inventory:open', true)
    end
end