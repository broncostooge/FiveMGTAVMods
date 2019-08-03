--Command to display players position
RegisterCommand('position', function(source, args)
    x, y, z = table.unpack(GetEntityCoords(GetPlayerPed(-1), true))
    TriggerEvent('chat:addMessage', {
        args = { 'Me', 'X: ' .. x }
    })
    TriggerEvent('chat:addMessage', {
        args = { 'Me', 'Y: ' .. y }
    })
    TriggerEvent('chat:addMessage', {
        args = { 'Me', 'Z: ' .. z }
    })
end, false)

--Displays the location on the upper right of the screen
Citizen.CreateThread(function()
    while true do
	local x, y, z = table.unpack(GetEntityCoords(GetPlayerPed(-1), true))
    Citizen.Wait(0)
DrawTxt(1.00, 0.50, 1.0,1.0,0.50,"~w~PlayerPosition: ~r~".. x .. ', ' .. y .. ', ' .. z .."~w~", 255,255,255,255)
	end
end)

--Function that Renders the Text on the screen
function DrawTxt(x,y ,width,height,scale, text, r,g,b,a)
    SetTextFont(4)
    SetTextProportional(0)
    SetTextScale(scale, scale)
    SetTextColour(r, g, b, a)
    SetTextDropShadow(0, 0, 0, 0,255)
    SetTextEdge(2, 0, 0, 0, 255)
    SetTextOutline()
    SetTextEntry("STRING")
    AddTextComponentString(text)
    DrawText(x - width/2, y - height/2 + 0.005)
end