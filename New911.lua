-- client.lua
RegisterCommand("911", function(source, args, rawCommand)
    local ped = PlayerPedId()
    local x,y,z = table.unpack(GetEntityCoords(ped, false))
    local streetHash = GetStreetNameAtCoord(x, y, z)
    local street = GetStreetNameFromHashKey(streetHash)
    local name = GetPlayerName(_source)
    local message = table.concat(args, " ")
    TriggerEvent('chatMessage', "^1911 | (" .. name .. ")^3 @ ^1" .. street .. " ", { 255, 187, 51 }, message)
end, false)


-- __resource.lua
resource_manifest_version "77731fab-63ca-442c-a67b-abc70f28dfa5"

client_scripts {
		"client/_clientscript.lua",
}


# Download Link
https://www.sendspace.com/file/tli2lx
