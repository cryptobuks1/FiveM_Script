-- CLIENTSIDED --

Citizen.CreateThread(function()
    while true do
	Citizen.Wait(0)
	
		local playerPed = GetPlayerPed(-1)
		local playerVeh = GetVehiclePedIsIn(playerPed, false)
		
		if (GetPedInVehicleSeat(playerVeh, -1) == playerPed) or IsControlPressed(1, 44) then
			DisplayRadar(true)
			if IsControlPressed(1, 44) and (IsPedInAnyVehicle(playerPed, true) == false) then
				SetRadarBigmapEnabled(true, false)
			else
				SetRadarBigmapEnabled(false, false)
			end
		else
			DisplayRadar(false)
		end
    end
end)