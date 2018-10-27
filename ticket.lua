--- Client

RegisterCommand("ticket", function(source, args, raw)
local ticketedply = table.concat(args, 1)
	if ticketedply == nil then
		TriggerEvent('chatMessage', source, "^1MGN Ticket: ^3You need to select a player to ticket!")
		TriggerEvent('chatMessage', source, "^1MGN Ticket: ^3Example: /ticket <id>!")
	else
		ticket(ticketedply)
	end
end)

function ticket(ticketedply)
	local username = GetPlayerName(source)
	TriggerServerEvent("mgn:ticket_sv", TextArea("Name of suspect:", "First & Last", 25), TextArea("Reason for ticket:", "Reason", 120), TextArea("Amount:", "$", 6), TextArea("Location", "Street", 25), TextArea("Officer Badge#", "I-16", 15), ticketedply)
end

function TextArea(TextEntry, Example, MaxStringLength)

	AddTextEntry('FMMC_KEY_TIP1', TextEntry)
	DisplayOnscreenKeyboard(1, "FMMC_KEY_TIP1", "", Example, "", "", "", MaxStringLength)
	blockinput = true

	while UpdateOnscreenKeyboard() ~= 1 and UpdateOnscreenKeyboard() ~= 2 do
		Citizen.Wait(0)
	end

	if UpdateOnscreenKeyboard() ~= 2 then
		local result = GetOnscreenKeyboardResult()
		Citizen.Wait(100)
		blockinput = false
		return result
	else
		Citizen.Wait(100)
		blockinput = false
		return nil
	end
end

-- Server File

RegisterServerEvent('mgn:ticket_sv')
AddEventHandler('mgn:ticket_sv', function(name, reason, amount, location, badge, ticketedply)
	local username = GetPlayerName(source)
	TriggerClientEvent('chatMessage', ticketedply, "^3[^7" ..username..  "^3] ^3Ticket: \n^3 Name:^7 "..name.." \n^3Reason:^7 "..reason.." \n^3Amount:^7 "..amount.." ^3\nLocation:^7 "..location.." ^3\nBadge Number:^7 "..badge, {255, 255, 255})
	TriggerClientEvent('chatMessage', source, "^3[^7" ..username..  "^3] ^3Ticket: \n^3 Name:^7 "..name.." \n^3Reason:^7 "..reason.." \n^3Amount:^7 "..amount.." ^3\nLocation:^7 "..location.." ^3\nBadge Number:^7 "..badge, {255, 255, 255})
end)

-- Download link
# https://www.sendspace.com/file/46sdnq
