local Position = 0xFF81

local function ReadFixed12_4(addr)
	temp = memory.readbyte(addr) * 256
	temp2 = memory.readbyte(addr+1)
	temp3 = temp + temp2
	return temp3 / 16
	--return memory.readwordunsigned(addr)/16
end


local function ShowStuff()
	--speedDisp = string.format("%.3f", ReadFixed20_12(Speed))
	
	--Make the display format nice but not display garbage values between levels
	pos = ReadFixed12_4(Position)
	if (pos >= 0) then
		positionDisp = string.format("%.3f", ReadFixed12_4(Position))
	else
		positionDisp = "0.000"
	end
	
	--gui.text(1,-16,speedDisp)
	--gui.text(56,-16, "Speed")
	gui.text(1,1,positionDisp)
	gui.text(28,1, "Pos")
end

gui.register(ShowStuff)