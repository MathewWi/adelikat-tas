while true do

if (emu.framecount() % 2 == 0) then
	joypad.set(1,{A=true})
else
	joypad.set(1,{B=true})
end

emu.frameadvance()
end