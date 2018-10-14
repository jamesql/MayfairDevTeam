-- Client.lua
towtruck = nil
towingtruck = nil
TowingCar = false
targetVehicle = nil



RegisterCommand("tow", function(source, args)
	TriggerEvent('chatMessage', '^1[[Mayfair]', {255, 255, 255}, "^5Press G to open the Tow Menu!")
end)



RegisterNetEvent("tow:SelectTow")
RegisterNetEvent("tow:TowCar")
RegisterNetEvent("tow:DropCar")

AddEventHandler("tow:SelectTow", function()
	local ped = GetPlayerPed(-1)
	if IsPedInAnyVehicle(ped, false) then
		towtruck = GetVehiclePedIsIn(ped)
		TriggerEvent('chatMessage', '^1[[Mayfair]', {255, 255, 255}, "^5Selected Vehicle!")
	else
		TriggerEvent('chatMessage', '^1[[Mayfair]', {255, 255, 255}, "^5You Need To Be In A Vehicle To Do This!")
	end
end)

AddEventHandler("tow:TowCar", function()
	local ped = GetPlayerPed(-1)
  if IsPedInAnyVehicle(ped, false) then
	targetVehicle = GetVehiclePedIsIn(ped)
	if (towtruck == nil) then
		TriggerEvent('chatMessage', '^1[[Mayfair]', {255, 255, 255}, "^5You Have Not Selected A Truck!")
	else
		if (GetVehiclePedIsIn(ped) == towtruck) then
			TriggerEvent('chatMessage', '^1[[Mayfair]', {255, 255, 255}, "^5You Can't Tow Your Tow Truck!")
		else
				TowingCar = true
				AttachEntityToEntity(targetVehicle, towtruck, 20, -0.5, -5.0, 1.0, 0.0, 0.0, 0.0, false, false, false, false, 20, true)
		end
	end
  else
	TriggerEvent('chatMessage', '^1[[Mayfair]', {255, 255, 255}, "^5You need to be in a vehicle to do this!")
 end
end)

AddEventHandler("tow:DropCar", function()
	if (TowingCar == false) then
		TriggerEvent('chatMessage', '^1[[Mayfair]', {255, 255, 255}, "^5You Are Not Towing Anything!")
	else
		AttachEntityToEntity(targetVehicle, towtruck, 20, -0.5, -12.0, 1.0, 0.0, 0.0, 0.0, false, false, false, false, 20, true)
		DetachEntity(targetVehicle, true, true)
		TowingCar = false
	end
end)


-- Menu
Citizen.CreateThread(function()

	WarMenu.CreateMenu("mainn", "Loading..")
    WarMenu.CreateMenu('towMenu', 'Mayfair Tow', 'You Like Jazz?')
    WarMenu.CreateSubMenu('closeMenu', 'towMenu', 'Are you sure?')
	WarMenu.SetTitleColor("towMenu", 255, 255, 255, 500)
	WarMenu.SetTitleBackgroundColor("towMenu", 75, 0, 130, 500)
	WarMenu.SetTitleColor("closeMenu", 255, 255, 255, 500)
	WarMenu.SetTitleBackgroundColor("closeMenu", 75, 0, 130, 500)

    while true do
		if WarMenu.IsMenuOpened("mainn") then
			WarMenu.OpenMenu("towMenu")
		end

        if WarMenu.IsMenuOpened('towMenu') then
			if WarMenu.Button("Select Tow Truck") then
				TriggerEvent("tow:SelectTow")
			end
			if WarMenu.Button("Tow Car") then
				TriggerEvent("tow:TowCar")
			end
			if WarMenu.Button("Drop Car") then
				TriggerEvent("tow:DropCar")
			end
			if WarMenu.Button("Quit Menu") then
				WarMenu.OpenMenu("closeMenu")
			end
		end

		if WarMenu.IsMenuOpened("closeMenu") then
			if WarMenu.Button("Yes") then
				WarMenu.CloseMenu("closeMenu")
			end
			if WarMenu.Button("No") then
			    WarMenu.OpenMenu("towMenu")
			end
		end

		WarMenu.Display()
        if IsControlJustReleased(0, 183) then --G
            WarMenu.OpenMenu('towMenu')
        end

        Citizen.Wait(0)
    end
end)


# Download Link
https://www.sendspace.com/file/tiyz5w
