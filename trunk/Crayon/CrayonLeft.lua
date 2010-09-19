local PixAddr = 0xFFB1
local subPixAddr = 0xFFB0

local currDistance = 0;
local lastDistance = 0;
local currSpeed = 0;
local lostCounter = 0;

while true do
--todo: pix addr is 2 bytes! account for that
--input.get for a reset lostCounter
lastDistance = currDistance
currDistance = ( (memory.readbyte(PixAddr) * 16) + (memory.readbyte(subPixAddr) / 16) )
currSpeed = currDistance - lastDistance

if (currSpeed < 14) then
lostCounter = lostCounter + (14 - currSpeed)
end

print(currSpeed .. " " .. lostCounter)
gui.text(10,10,currSpeed .. "  " .. lostCounter)


--Squirrel Spam
buttons = input.get()

if (buttons.L == true) then
	if (emu.framecount() % 4 == 0) then
		joypad.set(1,{A=true, left=true})
	end
end



emu.frameadvance()
end