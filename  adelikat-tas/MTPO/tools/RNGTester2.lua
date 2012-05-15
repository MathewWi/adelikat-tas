startval = 0;
RNG = 0x0018;


--*****************************************************************************
local function ForceRNToBehave(addr)
--*****************************************************************************
	lastcount = lastcount+1;	
end



--*****************************************************************************
local function ForceRNToBehave2(addr)
--*****************************************************************************
	lastcount2 = lastcount2+1;	
end

memory.registerwrite(RNG,ForceRNToBehave)

memory.registerwrite(RNG+1,ForceRNToBehave2);


while true do
	lastcount = 0;
	lastcount2 = 0;
	emu.frameadvance();
	gui.text(1,1,'RNG EXE: ' .. string.format("%d   %d", lastcount,lastcount2));	
   --gui.text(188,32,OppTimer)
end;