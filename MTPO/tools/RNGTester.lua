startval = 0;
RNG = 0x0018;


--*****************************************************************************
local function ForceRNToBehave(addr)
--*****************************************************************************
    if memory.readbyte(addr) ~= startval then
        memory.writebyte(addr,startval)
    end
end

--*****************************************************************************
function press(button)
--*****************************************************************************
-- Checks if a button is pressed.
-- The tables it accesses should be obvious in the next line.

    if keys[button] and not last_keys[button] then
        return true

    end
    return false
end
memory.registerwrite(RNG,ForceRNToBehave)

keys = {};
last_keys = {};
while true do
	keys = input.get();
	if press('A') then
		startval = startval+1;
		if startval == 256 then
			startval = 0;
		end;
	end;	
	emu.frameadvance();
	gui.text(1,1,'RNG: ' .. string.format("%x", startval));
	last_keys = keys;
	
	OppTimer = memory.readbyte(0x0039)
    gui.text(188,32,OppTimer)
end;