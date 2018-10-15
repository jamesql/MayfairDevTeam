-- Client

RegisterCommand("fix", function(source, args, raw)

TriggerEvent("mgn:fix")

end)

local fixtime = math.random(8000, 15000)

-- VV Mechanic Locations VV --
local coord = {
    {x = 2516.0,y = 4119.0,z = 39.0}, -- Joshua Rd / Seaview Rd
	{x = 2006.0,y = 3798.0,z = 32.0}, -- Marina Dr / Zancudo Rd
	{x = 1180.0,y = 2648.0,z = 38.0}, -- Route 68 LSC
	{x = 258.0,y = 2601.0,z = 45.0}, -- Joshua Rd / Route 68
	{x = 389.0,y = 3587.0,z = 34.0}, -- Marina Dr / W Joshua Rd
	{x = 116.0,y = 6621.0,z = 32.0}, -- Paleto Bay LSC
	{x = -447.0,y = 5995.0,z = 31.0}, -- Paleto Bay SD
	{x = -339.0,y = -137.0,z = 39.0}, -- Big LSC in City
	{x = 534.0,y = -178.0,z = 55.0}, -- Elgin Ave / Spanish Ave
	{x = 690.0,y = -978.0,z = 24.0}, -- Vespucci Blvd [ Lesters Warehouse ]
	{x = 1145.0,y = -288.0,z = 69.0}, -- Mirror Park Blvd [ Main Gas Station In Mirror Park ]
	{x = 1147.0,y = -776.0,z = 58.0}, -- West Mirror Park Blvd [ Repair Shop ]
	{x = 412.0,y = -1635.0,z = 30.0}, -- Innocence Blvd [ Police Impound lot ]
	{x = -1082.0,y = -1670.0,z = 5.0}, -- Bay City Ave [ Old Apartments At The Beach ]
	{x = 506.0,y = -636.0,z = 25.0}, -- Little Big Horn Ave [ Old Industrial Area ]
	{x = -2076.0,y = -304.0,z = 34.0}, -- Del Perro Fwy / West Eclipse Blvd
	{x = 451.0,y = -1018.0,z = 29.0}, -- Mission Row PD
	{x = 1867.0,y = 3699.0,z = 34.0}, -- Sandy Shores SD
	{x = -1156.0,y = -2005.0,z = 13.0}, -- Greenwich Pkwy [ MCIA Los Customs ]
}
-- ^^ Mechanic Locations ^^ --
RegisterNetEvent("mgn:fix")
AddEventHandler("mgn:fix", function()
		for s in pairs(coord) do
			local playercoord = GetEntityCoords(GetPlayerPed(-1), false)
			local distance = GetDistanceBetweenCoords(playercoord.x, playercoord.y, playercoord.z, coord[s].x, coord[s].y, coord[s].z)
			if distance <= 12.0 then
			if IsPedInAnyVehicle(GetPlayerPed(-1), false) then
				Citizen.Wait(10)
				SetVehicleEngineOn(GetVehiclePedIsIn(GetPlayerPed(-1), false), false, false, true)
				SetVehicleUndriveable(GetVehiclePedIsIn(GetPlayerPed(-1), false), true)
				notify("~p~[Mechanic] ~w~The Mechanic is working on your car!")
				Citizen.Wait(fixtime)
				SetVehicleFixed(GetVehiclePedIsUsing(GetPlayerPed(-1), false))
				SetVehicleDirtLevel(GetVehiclePedIsUsing(GetPlayerPed(-1), false), 0)
				SetVehicleEngineOn(GetVehiclePedIsIn(GetPlayerPed(-1), false), true, false, true)
				SetVehicleUndriveable(GetVehiclePedIsIn(GetPlayerPed(-1), false), false)
				notify("~p~[Mechanic] ~w~Car fixed, Now be careful!")
			end
		end
	end
end)



Citizen.CreateThread(function()

    for _, info in pairs(coord) do
      info.blip = AddBlipForCoord(info.x, info.y, info.z)
      SetBlipSprite(info.blip, 446)
      SetBlipDisplay(info.blip, 4)
      SetBlipScale(info.blip, 1.0)
      SetBlipColour(info.blip, 4)
      SetBlipAsShortRange(info.blip, true)
	  BeginTextCommandSetBlipName("STRING")
      AddTextComponentString("Mechanic")
      EndTextCommandSetBlipName(info.blip)
    end
end)

function notify(string)
	SetNotificationTextEntry("STRING")
	AddTextComponentString(string)
	DrawNotification(false, false)
end

-- Download Link
# https://www.sendspace.com/file/m6lt4t
