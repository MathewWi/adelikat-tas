--Chuck Rock lua script
--Written by adelikat
--Charts screen position and counts whenever the screen position fails to increase by 2
--This is more reliable than the very unreliable lag counter for this game.  Often the lag counter will not trip (input is still polled) but the screen fails to scroll, and vice versa

local XCamAddr = 0x00FF0600
local XCam = 0
local XCamLast = 0
local count = 0

while true do
gui.text(290,1,"Script armed")

XCamLast = XCam
XCam = memory.readword(XCamAddr)

if (XCam > 0) then
	if (XCam - XCamLast < 2) then
		count = count + (2 - (XCam - XCamLast))
	end
end

gui.text(1,1,count)
gui.text(20,1,"Pixels lost")

x = input.get()

if (x.L) then
	if (gens.framecount() % 2 == 0) then
		gui.text(290,10,"Left")
		joypad.set(1,{left=true})
	else
		gui.text(290,10,"Right")
		joypad.set(1,{right=true})
	end
end

if (x.P) then
	count = 0;
end

emu.frameadvance()
end