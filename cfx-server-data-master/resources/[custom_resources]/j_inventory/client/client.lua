ESX = nil
toggleCard = true
items = {}
slot = {}
local keysSlot = true;
local Keys = {
    ["1"] = 157,
    ["2"] = 158,
    ["3"] = 160,
    ["4"] = 164,
    ["5"] = 165,
    ["6"] = 159,
    ["7"] = 161,
    ["8"] = 162,
    ["9"] = 163
}

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

local isUseItem = true
RegisterNUICallback("UseItem", function(data, cb)
    if isUseItem then
        isUseItem = false
        exports['progressBars']:startUI(3000, "กำลังกิน...")
        TriggerServerEvent("esx:useItem", data.item.name)
        toggleCard = not toggleCard
        TriggerEvent("j_inventory:close", true)
        createPedScreen()
        Citizen.Wait(3000)
        isUseItem = true
        toggleCard = not toggleCard
        TriggerEvent('j_inventory:open', true)
    end
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
        if isUseItem then
            isUseItem = false
            ESX.Streaming.RequestAnimDict('pickup_object', function()
                -- loop => 8.0, -8, -1, 49, 0, 0, 0, 0
                exports['progressBars']:startUI(1750, "กำลังทิ้ง...")
                TaskPlayAnim(ped, 'pickup_object', 'pickup_low', 8.0, -8, 1750, 49, 0, 0, 0, 0)
                Citizen.Wait(1000)
                TriggerServerEvent("esx:removeInventoryItem", data.item.type, data.item.name, data.number)
                Citizen.Wait(700)
                isUseItem = true
            end)
        end
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

RegisterNUICallback("GetNearPlayers", function(data, cb)
    local playerPed = PlayerPedId()
    local players, nearbyPlayer = ESX.Game.GetPlayersInArea(GetEntityCoords(playerPed), 3.0)
    local foundPlayers = false
    local elements = {}
    local liseUser = {}
    local index = 0;
    -- print("data.item :", data.item.name)
    -- print("data.count :", data.count)
    local timeoutState = true

    for i = 1, #players, 1 do
        if players[i] ~= PlayerId() then
            index = index + 1
            foundPlayers = true
            local origCoords = GetEntityCoords(GetPlayerPed(players[i]))

            table.insert(elements, {
                label = GetPlayerName(players[i]),
                player = GetPlayerServerId(players[i])
            })

            table.insert(liseUser, {
                ['data'] = {
                    ["player"] = players[i],
                    ["item"] = data.item,
                    ["number"] = data.count
                },
                ['origCoords'] = origCoords
            })
        end
    end

    while timeoutState do
        Citizen.Wait(0)
        Citizen.CreateThread(function()
            Wait(3000)
            timeoutState = false
        end)

        keysSlot = false

        for i = 1, index, 1 do
            Draw3DText(liseUser[i].origCoords.x, liseUser[i].origCoords.y, liseUser[i].origCoords.z - 1.800,
                '(' .. i .. ')', 4, 0.1, 0.1)
            local data = {
                ["player"] = liseUser[i].data.player,
                ["item"] = liseUser[i].data.item,
                ["number"] = liseUser[i].data.number
            }

            if IsControlJustReleased(0, Keys['' .. i .. '']) and GetLastInputMethod(0) then
                index = liseUser
                Wait(250)
                ESX.Streaming.RequestAnimDict('mp_safehouselost@', function()
                    TaskPlayAnim(playerPed, 'mp_safehouselost@', 'package_dropoff', 8.0, -8, 3000, 49, 0, 0, 0, 0)
                    Citizen.Wait(1000)
                    TriggerEvent('j_inventory_GiveItem', data)
                end)
                toggleCard = not toggleCard
                keysSlot = true;
                timeoutState = false
            end
            -- print(i)
        end
        TriggerEvent("j_inventory:close", true)
        -- print(liseUser[index].index)
        -- Draw3DText(origCoords.x, origCoords.y, origCoords.z - 1.800, '(' .. i .. ')', 4, 0.1, 0.1)

    end

    if not foundPlayers then
        exports.pNotify:SendNotification({
            text = _U("players_nearby"),
            type = "error",
            timeout = 3000,
            layout = "bottomCenter",
            queue = "inventoryhud"
        })
    else
        SendNUIMessage({
            action = "nearPlayers",
            foundAny = foundPlayers,
            players = elements,
            item = data.item
        })
    end

    cb("ok")
end)

RegisterNetEvent('j_inventory_GiveItem')
AddEventHandler('j_inventory_GiveItem', function(data)
    -- print('data', data.player, data.item.type, data.item.name, count)
    local playerPed = PlayerPedId()
    local foundPlayer = false
    -- if foundPlayer then
    local count = tonumber(data.number)
    if data.item.type == "item_weapon" then
        count = GetAmmoInPedWeapon(PlayerPedId(), GetHashKey(data.item.name))
    end
    --     print('___________________Start_____________________________')
    TriggerServerEvent("esx:giveInventoryItem", GetPlayerServerId(data.player), data.item.type, data.item.name, count)
    -- else
    --     exports.pNotify:SendNotification({
    --         text = _U("player_nearby"),
    --         type = "error",
    --         timeout = 3000,
    --         layout = "bottomCenter",
    --         queue = "inventoryhud"
    --     })
    -- end
    -- cb("ok")
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
    if keysSlot then
        useSlotItem(1)
    end
end, false)
RegisterKeyMapping('+slot1', 'Slot1', 'keyboard', '1')
RegisterCommand('+slot2', function()
    if keysSlot then
        useSlotItem(2)
    end
end, false)
RegisterKeyMapping('+slot2', 'Slot2', 'keyboard', '2')
RegisterCommand('+slot3', function()
    if keysSlot then
        useSlotItem(3)
    end
end, false)
RegisterKeyMapping('+slot3', 'Slot3', 'keyboard', '3')
RegisterCommand('+slot4', function()
    if keysSlot then
        useSlotItem(4)
    end
end, false)
RegisterKeyMapping('+slot4', 'Slot1', 'keyboard', '4')
RegisterCommand('+slot5', function()
    if keysSlot then
        useSlotItem(5)
    end
end, false)
RegisterKeyMapping('+slot5', 'Slot5', 'keyboard', '5')

RegisterNUICallback("setItemSlot", function(data, cb)
    slot[data.key] = data.data
    cb("ok")
end)

function useSlotItem(key)
    DisableControlAction(0, 24, true) -- attack
    DisableControlAction(0, 25, true) -- aim
    DisableControlAction(0, 37, true) -- weapon wheel
    DisableControlAction(0, 44, true) -- cover
    DisableControlAction(0, 45, true) -- reload
    DisableControlAction(0, 140, true) -- light attack
    DisableControlAction(0, 141, true) -- heavy attack
    DisableControlAction(0, 142, true) -- alternative attack
    DisablePlayerFiring(GetPlayerPed(-1), true) -- Disable weapon firing
    if isUseItem and next(slot[key]) then
        isUseItem = false
        -- loop => 8.0, -8, -1, 49, 0, 0, 0, 0
        exports['progressBars']:startUI(1750, "กำลังกิน...")
        TriggerServerEvent("esx:useItem", slot[key]['name'])
        slot[key]['count'] = slot[key]['count'] - 1
        if slot[key]['count'] == 0 then
            SendNUIMessage({
                option = "remove_slot",
                key = key
            })
            slot[key] = {}
            -- table.remove(slot, key)
        end
        Citizen.Wait(1700)
        isUseItem = true
    end
    Citizen.Wait(50)
    if not toggleCard then
        TriggerEvent('j_inventory:open', true)
    end
end

function Draw3DText(x, y, z, textInput, fontId, scaleX, scaleY)
    local px, py, pz = table.unpack(GetGameplayCamCoords())
    local dist = GetDistanceBetweenCoords(px, py, pz, x, y, z, 1)
    local scale = (1 / dist) * 20
    local fov = (1 / GetGameplayCamFov()) * 100
    local scale = scale * fov
    SetTextScale(scaleX * scale, scaleY * scale)
    SetTextFont(fontId)
    SetTextProportional(1)
    SetTextColour(250, 250, 250, 255) -- You can change the text color here
    SetTextDropshadow(1, 1, 1, 1, 255)
    SetTextEdge(2, 0, 0, 0, 150)
    SetTextDropShadow()
    SetTextOutline()
    SetTextEntry("STRING")
    SetTextCentre(1)
    AddTextComponentString(textInput)
    SetDrawOrigin(x, y, z + 2, 0)
    DrawText(0.0, 0.0)
    ClearDrawOrigin()
end
