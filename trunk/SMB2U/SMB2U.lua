-- Super Mario Bros. 2 (U) (PRG0) [!].nes


while (true) do

local screenoffsetx = memory.readbyte(0x04C0);
local screenoffsety = memory.readbyte(0x00CB);

--Enemy Stats
local E1_init = memory.readbyte(0x0055)
local E1_x = memory.readbyte(0x002D)
local E1_y = memory.readbyte(0x0037)
local E1_xsub = memory.readbyte(0x040C)
local E1_ysub = memory.readbyte(0x0416)

local E2_init = memory.readbyte(0x0054)
local E2_x = memory.readbyte(0x002C)
local E2_y = memory.readbyte(0x0036)
local E2_xsub = memory.readbyte(0x040B)
local E2_ysub = memory.readbyte(0x0415)

local E3_init = memory.readbyte(0x0053)
local E3_x = memory.readbyte(0x002B)
local E3_y = memory.readbyte(0x0035)
local E3_xsub = memory.readbyte(0x040A)
local E3_ysub = memory.readbyte(0x0414)

local E4_init = memory.readbyte(0x0052)
local E4_x = memory.readbyte(0x002A)
local E4_y = memory.readbyte(0x0034)
local E4_xsub = memory.readbyte(0x0409)
local E4_ysub = memory.readbyte(0x0413)

local E5_init = memory.readbyte(0x0051)
local E5_x = memory.readbyte(0x0029)
local E5_y = memory.readbyte(0x0033)
local E5_xsub = memory.readbyte(0x0408)
local E5_ysub = memory.readbyte(0x0412)


--Character
local C_x = memory.readbyte(0x0028)
local C_xsub = memory.readbyte(0x0407)
local C_y = memory.readbyte(0x0032)

--There is no on screen value so it must be calculated
local C_ox = C_x - screenoffsetx;
if (C_ox < 0) then C_ox = C_ox + 0xFF; end;

local C_oy = C_y - screenoffsety;
if (C_oy < 0) then C_oy = C_oy + 0xFF; end;	

local E1_ox = E1_x - screenoffsetx;
if (E1_ox < 0) then E1_ox = E1_ox + 0xFF; end;

local E1_oy = E1_y - screenoffsety;
if (E1_oy < 0) then E1_oy = E1_oy + 0xFF; end;	

local E2_ox = E2_x - screenoffsetx;
if (E2_ox < 0) then E2_ox = E2_ox + 0xFF; end;

local E2_oy = E2_y - screenoffsety;
if (E2_oy < 0) then E2_oy = E2_oy + 0xFF; end;	

local E3_ox = E3_x - screenoffsetx;
if (E3_ox < 0) then E3_ox = E3_ox + 0xFF; end;

local E3_oy = E3_y - screenoffsety;
if (E3_oy < 0) then E3_oy = E3_oy + 0xFF; end;	

local E4_ox = E4_x - screenoffsetx;
if (E4_ox < 0) then E4_ox = E4_ox + 0xFF; end;

local E4_oy = E4_y - screenoffsety;
if (E4_oy < 0) then E4_oy = E4_oy + 0xFF; end;	

local E5_ox = E5_x - screenoffsetx;
if (E5_ox < 0) then E5_ox = E5_ox + 0xFF; end;

local E5_oy = E5_y - screenoffsety;
if (E5_oy < 0) then E5_oy = E5_oy + 0xFF; end;	


----




--Display enemy numbers
local initstring = "E:" .. E1_init .. E2_init .. E3_init .. E4_init .. E5_init
gui.text(1,1,initstring)

gui.text(E1_ox,E1_oy,"1")
gui.text(E2_ox,E2_oy,"2")
gui.text(E3_ox,E3_oy,"3")
gui.text(E4_ox,E4_oy,"4")
gui.text(E5_ox,E5_oy,"5")

gui.text(C_ox,C_y-screenoffsety,C_x)


--Subpixel Hell
--local E1substr = "E1 ".. E1_xsub
--gui.text(1,180,E1substr)

	FCEU.frameadvance();
end;