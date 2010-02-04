--Tempo lua script
--Written by adelikat
--Spits out L followed by R anytime a particular key is held down

while true do
gui.text(290,1,"LR script armed")

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

gens.frameadvance()
end