local Speed = 0x021B6A5C
local Position = 0x0208B70C


local function ReadFixed20_12(addr)
	--return memory.readdwordunsigned(addr)/12
	return memory.readdwordunsigned(addr)/4096
end


local function ShowStuff()
	speedDisp = string.format("%.3f", ReadFixed20_12(Speed))
	
	--Make the display format nice but not display garbage values between levels
	pos = ReadFixed20_12(Position)
	if (pos >= 0) then
		positionDisp = string.format("%.3f", ReadFixed20_12(Position))
	else
		positionDisp = "0.000"
	end
	
	gui.text(1,-16,speedDisp)
	gui.text(56,-16, "Speed")
	gui.text(1,-8,positionDisp)
	gui.text(56,-8, "Pos")
end

gui.register(ShowStuff)