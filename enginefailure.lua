-- Client 

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)
		TriggerEvent("enginefailure")
	end
end)

local dmgtokillengine = 1000

RegisterNetEvent("enginefailure")
AddEventHandler("enginefailure", function()

	local ped = GetPlayerPed(-1)
		local veh = GetVehiclePedIsIn(ped, false)
		local enginehp = GetVehicleEngineHealth(veh)
		
	if enginehp < dmgtokillengine then
		SetVehicleEngineHealth(veh, 300)
        SetVehicleEngineOn(veh, false, true)
	end

end)

-- Download Link
# https://www.sendspace.com/file/al1pe4
