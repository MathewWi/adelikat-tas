
yaddr = 0x902;
xaddr = 0x903
leveladdr = 0x08A6;
moveCounter = 0;

prevMoveCounters = { }

function DrawMoveCounter()
	gui.text(0, 0, "Moves: " .. moveCounter, null, null, 1);
end

function OnSaveState(name)
	prevMoveCounters[name] = moveCounter;
end

function OnLoadState(name)
	if (prevMoveCounters[name] ~= nil) then
		moveCounter = prevMoveCounters[name];
	else
		moveCounter = -1;
		console.log("Could not find counter for this state")
	end

	gui.cleartext();
	DrawMoveCounter();
end

event.onsavestate(OnSaveState, "OSD-OnSavestate");
event.onloadstate(OnLoadState, "OSD-OnLoadstate");

while true do
	prev_xval = xval;
	prev_yval = yval;

	xval = mainmemory.readbyte(xaddr);
	yval = mainmemory.readbyte(yaddr);


	if (xval ~= prev_xval or yval ~= prev_yval) then
		moveCounter = moveCounter + 1
	end

	prev_level = level;
	level = mainmemory.readbyte(leveladdr);

	if (prev_level ~= level) then
		moveCounter = 0;
	end

	if (emu.framecount() < 350) then-- Hack, this is during the bios or intro screen, we dont' want to count it
		moveCounter = 0;
	end
	pressed = input.get();
	if (pressed["End"]) then
		moveCounter = 0;
	end

	DrawMoveCounter();

	emu.frameadvance();
end

