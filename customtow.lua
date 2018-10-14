-- Client.lua
local towtruck = nil
local towingtruck = nil
local TowingCar = false



RegisterCommand("tow", function(source, args)
	TriggerEvent('chatMessage', '^1[[Mayfair]', {255, 255, 255}, "^5Press G to open the Tow Menu!")
end)



RegisterNetEvent("tow:SelectTow")
RegisterNetEvent("tow:TowCar")
RegisterNetEvent("tow:DropCar")

AddEventHandler("tow:SelectTow", function()

end)

AddEventHandler("tow:TowCar", function()

end)

AddEventHandler("tow:DropCar", function()

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

-- Server

-- resource

# Download Link
