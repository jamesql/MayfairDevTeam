# GetHex by Larry

-- _clientscript.lua
selfId = "Either a error has occured or the script is lagging... Retry!"
otherid = "Either a error has occured or the script is lagging... Retry!"

RegisterNetEvent("larry:storeotherid")
RegisterNetEvent("larry:storeselfid")

RegisterCommand("gethex", function(source, args)
	local idq = args[1]
	if (idq == nil) then
		if (selfId == nil) then
			return
		else
			TriggerServerEvent("larry:getselfiden")
			Wait(500)
			TriggerEvent('chatMessage', '^1[[Mayfair]', {255, 255, 255}, "^5Your Hex Is : "..selfId)
		end
	else
		TriggerServerEvent("larry:getotheriden", idq)
		Wait(500)
		TriggerEvent('chatMessage', '^1[[Mayfair]', {255, 255, 255}, "^5Users Hex Is : "..otherid)
	end
end)


AddEventHandler("larry:storeotherid", function(inputString)
	otherid = inputString
end)

AddEventHandler("larry:storeselfid", function(inputString)
	selfId = inputString
end)


-- mainserverscript.lua

RegisterServerEvent("larry:getselfiden")
RegisterServerEvent("larry:getotheriden")


AddEventHandler("larry:getselfiden", function()
	local identifier = GetPlayerIdentifiers(source)[1]
	print(identifier)
	TriggerClientEvent("larry:storeselfid", identifier)
end)

AddEventHandler("larry:getotheriden", function(idq)
	local identifier = PlayerIdentifier('steam', idq)
	print(identifier)
	TriggerClientEvent("larry:storeotherid", identifier)
end)

function PlayerIdentifier(type, id)
    local identifiers = {}
    local numIdentifiers = GetNumPlayerIdentifiers(id)

    for a = 0, numIdentifiers do
        table.insert(identifiers, GetPlayerIdentifier(id, a))
    end

    for b = 1, #identifiers do
        if string.find(identifiers[b], type, 1) then
            return identifiers[b]
        end
    end
    return false
end

-- onLoad.lua
print('[larold_gethex] Script Loaded! --> Version 1.0 <--')


-- Download Link
# https://www.sendspace.com/file/cq71j6
