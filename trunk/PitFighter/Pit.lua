--Pit Fighter lua script
--Written by adelikat
--Creates a hotkey for A + R, and A + L autofire combinations

local HPaddr = 0x00FF2D1A
local HP = 0

while true do
gui.text(290,1,"Script armed")

HP = memory.readword(HPaddr)
gui.text(40,34,HP)

x = input.get()

if (x.K) then
	if (gens.framecount() % 6 < 3) then
		gui.text(290,10,"Left+A")
		joypad.set(1,{left=true, A=true})
	else
		gui.text(290,10,"")
		joypad.set(1,{})
	end

else 
	if (x.L) then
	
		if (gens.framecount() % 6 < 3) then
			gui.text(290,10,"Right+A")
			joypad.set(1,{right=true, A=true})
		else
			gui.text(290,10,"")
			joypad.set(1,{})
		end
	end
end

gens.frameadvance()
end