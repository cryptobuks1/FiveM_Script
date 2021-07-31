local display = false
toggleCard = true
local playerPed = GetPlayerPed(-1)

RegisterKeyMapping('card','Card','keyboard','F1')

-- Citizen.CreateThread(function()
-- 	local inVeh = false
	
-- 	while true do
-- 		Wait(1)
--     print('playerPed',playerPed)
-- 		playerVeh = GetPedMoney(playerPed)
--     print(playerVeh)
-- 	end
-- end)

RegisterCommand("card",function()
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
  SendNUIMessage({
    type = "ui",
    display = true,
    _id = playerPed
  })
end)

RegisterNetEvent('nui:off')
AddEventHandler('nui:off', function()
  SendNUIMessage({
    type = "ui",
    display = false,
    _id = playerPed
  })
end)

RegisterNetEvent('nui:aaa')
AddEventHandler('nui:aaa', function()
  SendNUIMessage({
    type = "aaa",
    display = true,
    _id = playerPed
  })
end)
