
yaddr = 0x0102;
xaddr = 0x0103
leveladdr = 0x00A6;
moveCounter = 0;

memory.usememorydomain("RAM2");
while true do
	prev_xval = xval;
	prev_yval = yval;

	xval = memory.readbyte(xaddr);
	yval = memory.readbyte(yaddr);


	if (xval ~= prev_xval or yval ~= prev_yval) then
		moveCounter = moveCounter + 1
	end

	prev_level = level;
	level = memory.readbyte(leveladdr);

	if (prev_level ~= level) then
		moveCounter = 0;
	end

	gui.text(0, 0, "Moves: " .. moveCounter, null, null, 1);

	emu.frameadvance();
end