local Speed = 0x021B6A5C
local Position = 0x0208B70C


local function ReadFixed20_12(addr)
	--return memory.readdwordunsigned(addr)/12
	return memory.readdwordunsigned(addr)/4096
end


local function ShowStuff()
	gui.text(1,-16,ReadFixed20_12(Speed))
	gui.text(1,-8,ReadFixed20_12(Position))
	gui.text(1,1,"BOOO")
end

gui.register(ShowStuff)