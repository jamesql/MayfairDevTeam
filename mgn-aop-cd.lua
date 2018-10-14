-- Client
AddEventHandler('onClientMapStart', function()
    TriggerServerEvent('yodaaop:sync_sv')
end)

local aop = "Sandy Shores/Harmony/Grapeseed"

local cooldowntime = 0

local cooldown = "0"

local display = {

    ts = "ts.mayfairgaming.net",
    disc = "discord"

}

Citizen.CreateThread(function()
    while true do
        if IsPedInAnyVehicle(GetPlayerPed(-1)) then
        local ped = GetPlayerPed(-1)
        local veh = GetVehiclePedIsIn(ped)
        local plate = GetVehicleNumberPlateText(veh)
        local rpm = math.ceil(GetVehicleCurrentRpm(veh) * 11) - 1
        local speed = math.ceil(GetEntitySpeed(veh) * 2.236936)
        local gear = GetVehicleCurrentGear(veh)
        if speed == 0 then 
            gear = "N"
        elseif gear == 0 then
            gear = "R"
        end
            DrawTxt(0.660, 1.450, 1.0,1.0,0.55,"~p~Plate: ~w~"..plate.."~p~ | MPH: ~w~"..speed.." ~p~| RPM: ~w~"..rpm.."X ~p~| Gear: ~w~"..gear, 255,255,255,255)
        end
    Citizen.Wait(1)
    end
end)

Citizen.CreateThread( function()
    while true do
        Citizen.Wait(0)
		local playername = GetPlayerName(source)
		local playerid = GetPlayerServerId(source)
		Citizen.InvokeNative(GetHashKey("ADD_TEXT_ENTRY"), 'FE_THDR_GTAO', '~p~ MAYFAIR GAMING - ID: ~w~'..playerid..'~p~ | Name:  ~w~'..playername.."~p~ | AOP:  ~w~"..aop)
	end
end)

RegisterNetEvent('yodaaop:sync_cl')
AddEventHandler('yodaaop:sync_cl', function(exampleaop)
    aop = exampleaop
end)

function DrawTxt(x,y ,width,height,scale, text, r,g,b,a)
    SetTextFont(4)
    SetTextProportional(0)
    SetTextScale(scale, scale)
    SetTextColour(r, g, b, a)
    SetTextDropShadow(0, 0, 0, 0,255)
    SetTextEdge(1, 0, 0, 0, 255)
    SetTextDropShadow()
    SetTextOutline()
    SetTextEntry("STRING")
    AddTextComponentString(text)
    DrawText(x - width/2, y - height/2 + 0.005)
end

--- VV PLD CONFIG  VV ---
local x = 0
local y = 0


Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)
		 if IsPedInAnyVehicle(GetPlayerPed(-1), false) then
		 	x = 0.986
            y = 0.971
		 elseif not IsPedInAnyVehicle(GetPlayerPed(-1), false) then
			x = 0.986
			y = 0.971
		 end
	end
end)
	
-- Use the following variable(s) to adjust the color(s) of each element.
	-- Use the following variables to adjust the color of the border around direction.
	border_r = 255
	border_g = 255
	border_b = 255
	border_a = 100
	
	-- Use the following variables to adjust the color of the direction user is facing.
	dir_r = 255
	dir_g = 255
	dir_b = 255
	dir_a = 255
	
	-- Use the following variables to adjust the color of the street user is currently on.
	curr_street_r = 132
	curr_street_g = 102
	curr_street_b = 226
	curr_street_a = 255
	
	-- Use the following variables to adjust the color of the street around the player. (this will also change the town the user is in)
	str_around_r = 255
	str_around_g = 255 
	str_around_b = 255
	str_around_a = 255
	
	-- Use the following variables to adjust the color of the city the player is in (without there being a street around them)
	town_r = 255
	town_g = 255
	town_b = 255
	town_a = 255
    
    
--- VV THE ACTUAL PLD VV ---

function drawTxt(x,y ,width,height,scale, text, r,g,b,a)
    SetTextFont(4)
    SetTextProportional(0)
    SetTextScale(scale, scale)
    SetTextColour(r, g, b, a)
    SetTextDropShadow(0, 0, 0, 0,255)
    SetTextEdge(1, 0, 0, 0, 255)
    SetTextDropShadow()
    SetTextOutline()
    SetTextEntry("STRING")
    AddTextComponentString(text)
    DrawText(x - width/2, y - height/2 + 0.005)
end
function drawTxt2(x,y ,width,height,scale, text, r,g,b,a)
    SetTextFont(6)
    SetTextProportional(0)
    SetTextScale(scale, scale)
    SetTextColour(r, g, b, a)
    SetTextDropShadow(0, 0, 0, 0,255)
    SetTextEdge(1, 0, 0, 0, 255)
    SetTextDropShadow()
    SetTextOutline()
    SetTextEntry("STRING")
    AddTextComponentString(text)
    DrawText(x - width/2, y - height/2 + 0.005)
end
local zones = { ['AIRP'] = "Mayfair County Airport", ['ALAMO'] = "Alamo Sea", ['ALTA'] = "Alta", ['ARMYB'] = "Fort Zancudo", ['BANHAMC'] = "Banham Canyon Dr", ['BANNING'] = "Banning", ['BEACH'] = "Vespucci Beach", ['BHAMCA'] = "Banham Canyon", ['BRADP'] = "Braddock Pass", ['BRADT'] = "Braddock Tunnel", ['BURTON'] = "Burton", ['CALAFB'] = "Calafia Bridge", ['CANNY'] = "Raton Canyon", ['CCREAK'] = "Cassidy Creek", ['CHAMH'] = "Chamberlain Hills", ['CHIL'] = "Vinewood Hills", ['CHU'] = "Chumash", ['CMSW'] = "Chiliad Mountain State Wilderness", ['CYPRE'] = "Cypress Flats", ['DAVIS'] = "Davis", ['DELBE'] = "Del Perro Beach", ['DELPE'] = "Del Perro", ['DELSOL'] = "La Puerta", ['DESRT'] = "Grand Senora Desert", ['DOWNT'] = "Downtown", ['DTVINE'] = "Downtown Vinewood", ['EAST_V'] = "East Vinewood", ['EBURO'] = "El Burro Heights", ['ELGORL'] = "El Gordo Lighthouse", ['ELYSIAN'] = "Elysian Island", ['GALFISH'] = "Galilee", ['GOLF'] = "GWC and Golfing Society", ['GRAPES'] = "Grapeseed", ['GREATC'] = "Great Chaparral", ['HARMO'] = "Harmony", ['HAWICK'] = "Hawick", ['HORS'] = "Vinewood Racetrack", ['HUMLAB'] = "Humane Labs and Research", ['JAIL'] = "L.A County Penitentiary", ['KOREAT'] = "Little Seoul", ['LACT'] = "Land Act Reservoir", ['LAGO'] = "Lago Zancudo", ['LDAM'] = "Land Act Dam", ['LEGSQU'] = "Legion Square", ['LMESA'] = "La Mesa", ['LOSPUER'] = "La Puerta", ['MIRR'] = "Mirror Park", ['MORN'] = "Morningwood", ['MOVIE'] = "Richards Majestic", ['MTCHIL'] = "Mount Chiliad", ['MTGORDO'] = "Mount Gordo", ['MTJOSE'] = "Mount Josiah", ['MURRI'] = "Murrieta Heights", ['NCHU'] = "North Chumash", ['NOOSE'] = "N.O.O.S.E", ['OCEANA'] = "Pacific Ocean", ['PALCOV'] = "Paleto Cove", ['PALETO'] = "Paleto Bay", ['PALFOR'] = "Paleto Forest", ['PALHIGH'] = "Palomino Highlands", ['PALMPOW'] = "Palmer-Taylor Power Station", ['PBLUFF'] = "Pacific Bluffs", ['PBOX'] = "Pillbox Hill", ['PROCOB'] = "Procopio Beach", ['RANCHO'] = "Rancho", ['RGLEN'] = "Richman Glen", ['RICHM'] = "Richman", ['ROCKF'] = "Rockford Hills", ['RTRAK'] = "Redwood Lights Track", ['SANAND'] = "San Andreas", ['SANCHIA'] = "San Chianski Mountain Range", ['SANDY'] = "Sandy Shores", ['SKID'] = "Mission Row", ['SLAB'] = "Stab City", ['STAD'] = "Maze Bank Arena", ['STRAW'] = "Strawberry", ['TATAMO'] = "Tataviam Mountains", ['TERMINA'] = "Terminal", ['TEXTI'] = "Textile City", ['TONGVAH'] = "Tongva Hills", ['TONGVAV'] = "Tongva Valley", ['VCANA'] = "Vespucci Canals", ['VESP'] = "Vespucci", ['VINE'] = "Vinewood", ['WINDF'] = "Dunning County Wind Farm", ['WVINE'] = "West Vinewood", ['ZANCUDO'] = "Zancudo River", ['ZP_ORT'] = "Port of South Los Santos", ['ZQ_UAR'] = "Davis Quartz" }
local directions = { [0] = 'N', [45] = 'NW', [90] = 'W', [135] = 'SW', [180] = 'S', [225] = 'SE', [270] = 'E', [315] = 'NE', [360] = 'N', } 
Citizen.CreateThread(function()
	while true do
		Citizen.Wait(1)
		local pos = GetEntityCoords(GetPlayerPed(-1))
		local var1, var2 = GetStreetNameAtCoord(pos.x, pos.y, pos.z, Citizen.ResultAsInteger(), Citizen.ResultAsInteger())
		local current_zone = zones[GetNameOfZone(pos.x, pos.y, pos.z)]

		for k,v in pairs(directions)do
			direction = GetEntityHeading(GetPlayerPed(-1))
			if(math.abs(direction - k) < 22.5)then
				direction = v
				break;
			end
		end
		
		if(GetStreetNameFromHashKey(var1) and GetNameOfZone(pos.x, pos.y, pos.z))then
			if(zones[GetNameOfZone(pos.x, pos.y, pos.z)] and tostring(GetStreetNameFromHashKey(var1)))then
				if direction == 'N' then
						drawTxt(x-0.335, y+0.66, 1.0,1.5,1.4, " | ", border_r, border_g, border_b, border_a)
						drawTxt(x-0.306, y+0.66, 1.0,1.5,1.4, " | ", border_r, border_g, border_b, border_a)
						drawTxt(x-0.315, y+0.42, 1.0,1.0,1.0, direction, dir_r, dir_g, dir_b, dir_a)
					if tostring(GetStreetNameFromHashKey(var2)) == "" then
						drawTxt2(x-0.285, y+0.45, 1.0,1.0,0.45, current_zone, town_r, town_g, town_b, town_a)
					else 
						drawTxt2(x-0.285, y+0.45, 1.0,1.0,0.45, tostring(GetStreetNameFromHashKey(var2)) .. ", " .. zones[GetNameOfZone(pos.x, pos.y, pos.z)], str_around_r, str_around_g, str_around_b, str_around_a)
					end
						drawTxt2(x-0.285, y+0.42, 1.0,1.0,0.55, tostring(GetStreetNameFromHashKey(var1)), curr_street_r, curr_street_g, curr_street_b, curr_street_a)
				elseif direction == 'NE' then 
						drawTxt(x-0.335, y+0.66, 1.0,1.5,1.4, " | ", border_r, border_g, border_b, border_a)
						drawTxt(x-0.298, y+0.66, 1.0,1.5,1.4, " | ", border_r, border_g, border_b, border_a)
						drawTxt(x-0.315, y+0.42, 1.0,1.0,1.0, direction, dir_r, dir_g, dir_b, dir_a)
					if tostring(GetStreetNameFromHashKey(var2)) == "" then
						drawTxt2(x-0.277, y+0.45, 1.0,1.0,0.45, current_zone, town_r, town_g, town_b, town_a)
					else 
						drawTxt2(x-0.277, y+0.45, 1.0,1.0,0.45, tostring(GetStreetNameFromHashKey(var2)) .. ", " .. zones[GetNameOfZone(pos.x, pos.y, pos.z)], str_around_r, str_around_g, str_around_b, str_around_a)
					end
					drawTxt2(x-0.277, y+0.42, 1.0,1.0,0.55, tostring(GetStreetNameFromHashKey(var1)),curr_street_r, curr_street_g, curr_street_b, curr_street_a)
				elseif direction == 'E' then 
						drawTxt(x-0.335, y+0.66, 1.0,1.5,1.4, " | ", border_r, border_g, border_b, border_a)
						drawTxt(x-0.309, y+0.66, 1.0,1.5,1.4, " | ", border_r, border_g, border_b, border_a)
						drawTxt(x-0.315, y+0.42, 1.0,1.0,1.0, direction, dir_r, dir_g, dir_b, dir_a)
					if tostring(GetStreetNameFromHashKey(var2)) == "" then
						drawTxt2(x-0.288, y+0.45, 1.0,1.0,0.45, current_zone, town_r, town_g, town_b, town_a)
					else 
						drawTxt2(x-0.288, y+0.45, 1.0,1.0,0.45, tostring(GetStreetNameFromHashKey(var2)) .. ", " .. zones[GetNameOfZone(pos.x, pos.y, pos.z)], str_around_r, str_around_g, str_around_b, str_around_a)
					end
					drawTxt2(x-0.288, y+0.42, 1.0,1.0,0.55, tostring(GetStreetNameFromHashKey(var1)), curr_street_r, curr_street_g, curr_street_b, curr_street_a)
				elseif direction == 'SE' then 
						drawTxt(x-0.335, y+0.66, 1.0,1.5,1.4, " | ", border_r, border_g, border_b, border_a)
						drawTxt(x-0.298, y+0.66, 1.0,1.5,1.4, " | ", border_r, border_g, border_b, border_a)
						drawTxt(x-0.315, y+0.42, 1.0,1.0,1.0, direction, dir_r, dir_g, dir_b, dir_a)
					if tostring(GetStreetNameFromHashKey(var2)) == "" then
						drawTxt2(x-0.275, y+0.45, 1.0,1.0,0.45, current_zone, town_r, town_g, town_b, town_a)
					else 
						drawTxt2(x-0.275, x+0.45, 1.0,1.0,0.45, tostring(GetStreetNameFromHashKey(var2)) .. ", " .. zones[GetNameOfZone(pos.x, pos.y, pos.z)], str_around_r, str_around_g, str_around_b, str_around_a)
					end
						drawTxt2(x-0.275, y+0.42, 1.0,1.0,0.55, tostring(GetStreetNameFromHashKey(var1)), curr_street_r, curr_street_g, curr_street_b, curr_street_a)
				elseif direction == 'S' then
						drawTxt(x-0.335, y+0.66, 1.0,1.5,1.4, " | ", border_r, border_g, border_b, border_a)
						drawTxt(x-0.307, y+0.66, 1.0,1.5,1.4, " | ", border_r, border_g, border_b, border_a)
						drawTxt(x-0.315, y+0.42, 1.0,1.0,1.0, direction, dir_r, dir_g, dir_b, dir_a)
					if tostring(GetStreetNameFromHashKey(var2)) == "" then
						drawTxt2(x-0.285, y+0.45, 1.0,1.0,0.45, current_zone, town_r, town_g, town_b, town_a)
					else 
						drawTxt2(x-0.285, y+0.45, 1.0,1.0,0.45, tostring(GetStreetNameFromHashKey(var2)) .. ", " .. zones[GetNameOfZone(pos.x, pos.y, pos.z)], str_around_r, str_around_g, str_around_b, str_around_a)
					end
						drawTxt2(x-0.285, y+0.42, 1.0,1.0,0.55, tostring(GetStreetNameFromHashKey(var1)), curr_street_r, curr_street_g, curr_street_b, curr_street_a)
				elseif direction == 'SW' then
						drawTxt(x-0.335, y+0.66, 1.0,1.5,1.4, " | ", border_r, border_g, border_b, border_a)
						drawTxt(x-0.292, y+0.66, 1.0,1.5,1.4, " | ", border_r, border_g, border_b, border_a)
						drawTxt(x-0.315, y+0.42, 1.0,1.0,1.0, direction, dir_r, dir_g, dir_b, dir_a)
					if tostring(GetStreetNameFromHashKey(var2)) == "" then
						drawTxt2(x-0.270, y+0.45, 1.0,1.0,0.45, current_zone, town_r, town_g, town_b, town_a)
					else 
						drawTxt2(x-0.270, y+0.45, 1.0,1.0,0.45, tostring(GetStreetNameFromHashKey(var2)) .. ", " .. zones[GetNameOfZone(pos.x, pos.y, pos.z)], str_around_r, str_around_g, str_around_b, str_around_a)
					end
						drawTxt2(x-0.270, y+0.42, 1.0,1.0,0.55, tostring(GetStreetNameFromHashKey(var1)), curr_street_r, curr_street_g, curr_street_b, curr_street_a)
				elseif direction == 'W' then 
						drawTxt(x-0.335, y+0.66, 1.0,1.5,1.4, " | ", border_r, border_g, border_b, border_a)
						drawTxt(x-0.303, y+0.66, 1.0,1.5,1.4, " | ", border_r, border_g, border_b, border_a)
						drawTxt(x-0.315, y+0.42, 1.0,1.0,1.0, direction, dir_r, dir_g, dir_b, dir_a)
					if tostring(GetStreetNameFromHashKey(var2)) == "" then 
						drawTxt2(x-0.280, y+0.45, 1.0,1.0,0.45, current_zone, town_r, town_g, town_b, town_a)
					else
						drawTxt2(x-0.280, y+0.45, 1.0,1.0,0.45, tostring(GetStreetNameFromHashKey(var2)) .. ", " .. zones[GetNameOfZone(pos.x, pos.y, pos.z)], str_around_r, str_around_g, str_around_b, str_around_a)
					end
						drawTxt2(x-0.280, y+0.42, 1.0,1.0,0.55, tostring(GetStreetNameFromHashKey(var1)), curr_street_r, curr_street_g, curr_street_b, curr_street_a)
				elseif direction == 'NW' then
						drawTxt(x-0.335, y+0.66, 1.0,1.5,1.4, " | ", border_r, border_g, border_b, border_a)
						drawTxt(x-0.290, y+0.66, 1.0,1.5,1.4, " | ", border_r, border_g, border_b, border_a)
						drawTxt(x-0.315, y+0.42, 1.0,1.0,1.0, direction, dir_r, dir_g, dir_b, dir_a)
					if tostring(GetStreetNameFromHashKey(var2)) == "" then
						drawTxt2(x-0.266, y+0.45, 1.0,1.0,0.45, current_zone, town_r, town_g, town_b, town_a)
					else 
						drawTxt2(x-0.266, y+0.45, 1.0,1.0,0.45, tostring(GetStreetNameFromHashKey(var2)) .. ", " .. zones[GetNameOfZone(pos.x, pos.y, pos.z)], str_around_r, str_around_g, str_around_b, str_around_a)
					end 
						drawTxt2(x-0.266, y+0.42, 1.0,1.0,0.55, tostring(GetStreetNameFromHashKey(var1)), curr_street_r, curr_street_g, curr_street_b, curr_street_a)
				end
			end
		end
	end
end)


local cooldown = 0
local ispriority = false
local ishold = false

RegisterCommand("resetpcd", function()
    TriggerServerEvent("cancelcooldown")
end, false)

RegisterNetEvent('UpdateCooldown')
AddEventHandler('UpdateCooldown', function(newCooldown)
    cooldown = newCooldown
end)

RegisterNetEvent('UpdatePriority')
AddEventHandler('UpdatePriority', function(newispriority)
    ispriority = newispriority
end)

RegisterNetEvent('UpdateHold')
AddEventHandler('UpdateHold', function(newishold)
    ishold = newishold
end)

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
            DrawTxt(0.660, 1.285, 1.0,1.0,0.55, "~p~Teamspeak: ~w~" .. display.ts, 255, 255, 255, 255)
            DrawTxt(0.660, 1.320, 1.0,1.0,0.55, "~p~Area Of Roleplay: ~w~" .. aop, 255, 255, 255, 255)
        if ishold == true then
            DrawTxt(0.660, 1.355, 1.0,1.0,0.55, "~p~Priority Cooldown: ~r~Priorities Are On Hold", 255, 255, 255, 255)
        elseif ispriority == false and cooldown == 0 then
            DrawTxt(0.660, 1.355, 1.0,1.0,0.55, "~p~Priority Cooldown: ~w~None", 255, 255, 255, 255)
        elseif ispriority == false and cooldown > 0  then
            DrawTxt(0.660, 1.355, 1.0,1.0,0.55, "~p~Priority Cooldown: ~w~"..cooldown.. " ~p~Mins", 255, 255, 255, 255)
        elseif ispriority == true then
            DrawTxt(0.660, 1.355, 1.0,1.0,0.55, "~p~Priority Cooldown: ~r~Priority in Progress", 255, 255, 255, 255)
        end
    end
end)

-- Server --

local aop = "Sandy shores/Harmony/Grapeseed"
local s = ""
cooldowntime = 0

RegisterCommand("aop", function(source, args, rawCommand)
if IsPlayerAceAllowed(source, "mgn-aop") then
    if args[1] ~= nil then
        aop = table.concat(args, " ")
        TriggerEvent("yodaaop:sync_sv")
        TriggerClientEvent("chatMessage", -1,"^*"..s.. "^1ANNOUNCEMENT: ^3RP has been moved to: ^7"..aop..".^3 Finish up your Current Roleplay and move there. Do not noclip or teleport or you might be kicked with/without warning!", {255, 255, 255})
    elseif args[1] == nil then
        TriggerClientEvent('chatMessage', source, "^*^1Mayfair AOP: ^3Invalid Input")
    end
else
    TriggerClientEvent("chatMessage", -1, "^*^1Mayfair AOP: ^3Insufficient Permission", {255, 255, 255})
end
end, true)

RegisterServerEvent("yodaaop:sync_sv")
AddEventHandler("yodaaop:sync_sv", function()
    TriggerClientEvent("yodaaop:sync_cl", -1, aop)

end)

--- Cooldown ---

cooldown = 0
ispriority = false
ishold = false

RegisterCommand("priority", function(source, args, rawCommand)
    if IsPlayerAceAllowed(source, "mgn-aop") then
    TriggerEvent("cooldownt")
    else
        TriggerClientEvent("chatMessage", -1, "^*^1Mayfair AOP: ^3Insufficient Permission", {255, 255, 255})
    end
end, true)

RegisterCommand("inprogress", function(source, args, rawCommand)
    if IsPlayerAceAllowed(source, "mgn-aop") then
    TriggerEvent('isPriority')
    else
        TriggerClientEvent("chatMessage", -1, "^*^1Mayfair AOP: ^3Insufficient Permission", {255, 255, 255})
    end
end, true)

RegisterCommand("onhold", function(source, args, rawCommand)
    if IsPlayerAceAllowed(source, "mgn-aop") then
    TriggerEvent('isOnHold')
    else
        TriggerClientEvent("chatMessage", -1, "^*^1Mayfair AOP: ^3Insufficient Permission", {255, 255, 255})
    end
end, true)

RegisterNetEvent('isPriority')
AddEventHandler('isPriority', function()
	ispriority = true
	Citizen.Wait(1)
	TriggerClientEvent('UpdatePriority', -1, ispriority)
	TriggerClientEvent('chatMessage', -1, "WARNING", {255, 0, 0}, "^1A priority call is in progress. Please do not interfere, otherwise you will be ^1kicked. ^7All calls are on ^3hold ^7until this one concludes.")
end)

RegisterNetEvent('isOnHold')
AddEventHandler('isOnHold', function()
	ishold = true
	Citizen.Wait(1)
	TriggerClientEvent('UpdateHold', -1, ishold)
end)

RegisterNetEvent("cooldownt")
AddEventHandler("cooldownt", function()
	if ispriority == true then
		ispriority = false
		TriggerClientEvent('UpdatePriority', -1, ispriority)
	end
	Citizen.Wait(1)
	if ishold == true then
		ishold = false
		TriggerClientEvent('UpdateHold', -1, ishold)
	end
	Citizen.Wait(1)
	if cooldown == 0 then
		cooldown = 0
		cooldown = cooldown + 21
		TriggerClientEvent('chatMessage', -1, "WARNING", {255, 0, 0}, "^1A priority call was just conducted. ^3All civilians must wait 20 minutes before conducting another one. ^7Failure to abide by this rule will lead to you being ^1kicked.")
		while cooldown > 0 do
			cooldown = cooldown - 1
			TriggerClientEvent('UpdateCooldown', -1, cooldown)
			Citizen.Wait(60000)
		end
	elseif cooldown ~= 0 then
		CancelEvent()
	end
end)

RegisterNetEvent("cancelcooldown")
AddEventHandler("cancelcooldown", function()
	Citizen.Wait(1)
	while cooldown > 0 do
		cooldown = cooldown - 1
		TriggerClientEvent('UpdateCooldown', -1, cooldown)
		Citizen.Wait(100)
	end
	
end)

-- Mgn Permissions --

add_ace mgn.aop.cd mgn-aop allow


add_principal identifier.steam:11000010ac19d62 mgn.aop.cd # Viggo95Yoda
add_principal identifier.steam:11000010d137981 mgn.aop.cd # Larry
add_principal identifier.steam:11000010601733a  mgn.aop.cd # Deanzel
add_principal identifier.steam:110000104584cf8  mgn.aop.cd # Angel
add_principal identifier.steam:11000011d23fee4 mgn.aop.cd # Connor
add_principal identifier.steam:1100001016b4aac mgn.aop.cd # Stiben
add_principal identifier.steam:110000107bd7a60 mgn.aop.cd # Jack95Yoda
add_principal identifier.steam:110000102cfdc10 mgn.aop.cd # Cayla Hart
add_principal identifier.steam:1100001063a4735 mgn.aop.cd # Reiss

-- Download link
# https://www.sendspace.com/file/rbvdkq
