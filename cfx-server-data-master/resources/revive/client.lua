--------------------------------
--- RP Revive, Made by FAXES ---
--------------------------------
--- Config ---
local reviveWait = 10 -- Change the amount of time to wait before allowing revive (in seconds).
local featureColor = "~y~" -- Game color used as the button key colors.

--- Code ---
local timerCount = reviveWait
local isDead = false
cHavePerms = false

AddEventHandler('playerSpawned', function()
    local src = source
    TriggerServerEvent("RPRevive:CheckPermission", src)
end)

RegisterNetEvent("RPRevive:CheckPermission:Return")
AddEventHandler("RPRevive:CheckPermission:Return", function(havePerms)
    cHavePerms = havePerms
end)

-- Turn off automatic respawn here instead of updating FiveM file.
AddEventHandler('onClientMapStart', function()
    Citizen.Trace("RPRevive: Disabling the autospawn.")
    exports.spawnmanager:spawnPlayer() -- Ensure player spawns into server.
    Citizen.Wait(2500)
    exports.spawnmanager:setAutoSpawn(false)
    Citizen.Trace("RPRevive: Autospawn is disabled.")
end)

function respawnPed(ped, coords)
    SetEntityCoordsNoOffset(ped, coords.x, coords.y, coords.z, false, false, false, true)
    NetworkResurrectLocalPlayer(coords.x, coords.y, coords.z, coords.heading, true, false)
    SetPlayerInvincible(ped, false)
    -- TriggerEvent('playerSpawned', coords.x, coords.y, coords.z, coords.heading)
    ClearPedBloodDamage(ped)
end

function revivePed(ped)
    local playerPos = GetEntityCoords(ped, true)
    isDead = false
    timerCount = reviveWait
    NetworkResurrectLocalPlayer(playerPos, true, true, false)
    SetPlayerInvincible(ped, false)
    ClearPedBloodDamage(ped)
end

function ShowInfoRevive(text)
    SetNotificationTextEntry("STRING")
    AddTextComponentSubstringPlayerName(text)
    DrawNotification(true, true)
end

Citizen.CreateThread(function()
    local respawnCount = 0
    local spawnPoints = {}
    local playerIndex = NetworkGetPlayerIndex(-1) or 0
    math.randomseed(playerIndex)

    local positions = { -- spawn position
    {
        x = 298.45,
        y = -585.20,
        z = 43.26,
        h = 90.2
    }, -- your spawn position
    {
        x = -247.55,
        y = 6330.77,
        z = 32.43,
        h = 252.67
    }}

    while true do
        Citizen.Wait(0)
        local ped = GetPlayerPed(-1)
        if IsEntityDead(ped) then
            isDead = true
            SetPlayerInvincible(ped, true)
            SetEntityHealth(ped, 1)
            ShowInfoRevive('You are dead. Use ~y~E ~w~to revive or ~y~R ~w~to respawn.')
            if IsControlJustReleased(0, 38) and GetLastInputMethod(0) then
                if timerCount <= 0 or cHavePerms then
                    revivePed(ped)
                else
                    TriggerEvent('chat:addMessage', {
                        args = {'^*Wait ' .. timerCount .. ' more seconds before reviving.'}
                    })
                end
            elseif IsControlJustReleased(0, 45) and GetLastInputMethod(0) then
                respawnPed(ped, positions[math.random(1, #positions)])
                isDead = false
                timerCount = reviveWait
                respawnCount = respawnCount + 1
                math.randomseed(playerIndex * respawnCount)
            end
        end
    end
end)

Citizen.CreateThread(function()
    while true do
        if isDead then
            timerCount = timerCount - 1
        end
        Citizen.Wait(1000)
    end
end)
