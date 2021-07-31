local display = false
toggleCard = true
local playerPed = GetPlayerPed(-1)

RegisterKeyMapping('card', 'Card', 'keyboard', 'F1')

-- Citizen.CreateThread(function()
-- 	local inVeh = false

-- 	while true do
-- 		Wait(1)
--     print('playerPed',playerPed)
-- 		playerVeh = GetPedMoney(playerPed)
--     print(playerVeh)
-- 	end
-- end)

RegisterCommand("card", function()
    if toggleCard then
        print('on')
        TriggerEvent('nui:on', true)
    else
        print('off')
        TriggerEvent("nui:off", true)
    end
    toggleCard = not toggleCard
end)

-- RegisterCommand("on", function()
--     Citizen.CreateThread(function()
--       TriggerEvent('nui:on', true)
--     end)
-- end)

-- RegisterCommand("off", function()
--   Citizen.CreateThread(function()
--       TriggerEvent("nui:off", true)
--   end)
-- end)

--[[ ////////////////////////////////////////// ]]

RegisterNetEvent('nui:on')
AddEventHandler('nui:on', function()
    local playerPed = PlayerPedId()
    local playerX, playerY, playerZ = table.unpack(GetEntityCoords(playerPed))
    local playerH = GetEntityHeading(playerPed)
    SendNUIMessage({
        type = "ui",
        display = true,
        _id = playerPed,
        picasso = {
            ["playerX"] = playerX,
            ["playerY"] = playerY,
            ["playerZ"] = playerZ,
            ["playerH"] = playerH
        }
    })
end)

RegisterNetEvent('nui:off')
AddEventHandler('nui:off', function()
    SendNUIMessage({
        type = "ui",
        display = false,
        _id = playerPed,
        picasso = {}
    })
end)

function DrawGenericText(text)
	SetTextColour(186, 186, 186, 255)
	SetTextFont(7)
	SetTextScale(0.378, 0.378)
	SetTextWrap(0.0, 1.0)
	SetTextCentre(false)
	SetTextDropshadow(0, 0, 0, 0, 255)
	SetTextEdge(1, 0, 0, 0, 205)
	SetTextEntry("STRING")
	AddTextComponentString(text)
	DrawText(0.40, 0.00)
end

Citizen.CreateThread(function()
    while true do
		local sleepThread = 250
		
		if true then
			sleepThread = 5

			local playerPed = PlayerPedId()
			local playerX, playerY, playerZ = table.unpack(GetEntityCoords(playerPed))
			local playerH = GetEntityHeading(playerPed)
			DrawGenericText(("~g~X~w~: %s ~g~Y~w~: %s ~g~Z~w~: %s ~g~H~w~: %s"):format(FormatCoord(playerX), FormatCoord(playerY), FormatCoord(playerZ), FormatCoord(playerH)))
		end

		Citizen.Wait(sleepThread)
	end
end)

FormatCoord = function(coord)
	if coord == nil then
		return "unknown"
	end

	return tonumber(string.format("%.2f", coord))
end