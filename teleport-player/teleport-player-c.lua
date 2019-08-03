--Command to display players position
RegisterCommand('teleport-player', function(source, args)
    --SetPedCoordsKeepVehicle(PlayerPedId(), 2551.1613769531, 4907.4995117188, 37.0)

    local playerPed = GetPlayerPed(-1)
	local blip = GetFirstBlipInfoId(8)

	if DoesBlipExist(blip) then
		local coord = GetBlipInfoIdCoord(blip)
		local groundFound, coordZ = false, 0
		local groundCheckHeights = { 0.0, 50.0, 100.0, 150.0, 200.0, 250.0, 300.0, 350.0, 400.0,450.0, 500.0, 550.0, 600.0, 650.0, 700.0, 750.0, 800.0, 850.0, 900.0, 950.0, 1000.0 }

		for i, height in ipairs(groundCheckHeights) do

			local foundGround, z = GetGroundZFor_3dCoord(coord.x, coord.y, height)
			if foundGround then
				coordZ = z + 3
				groundFound = true
				break
			end
		end
	
		if not groundFound then
            coordZ = 100.0
            local drawableId = 0
            TriggerEvent('chat:addMessage', {
                args = { 'Me', 'The ground (Z axis) could not be found!'}
            })
            
            SetPedCoordsKeepVehicle(PlayerPedId(), coord.x, coord.y, coordZ)
            GiveWeaponToPed(GetPlayerPed(-1), GetHashKey("gadget_parachute"), 1, false, false)
        else
            TriggerEvent('chat:addMessage', {
                args = { 'Me', 'Ground was Found!' .. coordZ }
            })
            SetPedCoordsKeepVehicle(PlayerPedId(), coord.x, coord.y, coordZ)
        end
    else
        TriggerEvent('chat:addMessage', {
            args = { 'Me', 'No Blip' }
        })
	end

end, false)