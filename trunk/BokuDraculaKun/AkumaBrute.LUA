-- This is the first LUA script to run. 
-- It has to be start the frame before the first set of bridges are randomized. 
-- This will tell you all the valid frame counts & RNG values for that level. (same for every level? Who knows?!?)
-- Then, modify the boss fight, until you get one of the proper frame counts.
--  (RNG doesn't matter at this point).
-- Go ~ 30 frames before first bridge RNG, and run AkumaBarf.lua.
-- It shouldn't take AkumaBarf.lua more than a minute or 2 to find a working 1 bridge value. 
-- Remember to give AkumaBarf.lua the right end value! (first bridge RNG frame)


-- Count - Bridges seperated into 3 groups of RNG access
--$80FD:A4 AC     LDY $00AC = #$02           A:FF X:05 Y:00 P:NvUbdIzc
-- If 0xAC is zero, test bridges 1-3
--$80FF:F0 3E     BEQ $813F                  A:FF X:05 Y:02 P:nvUbdIzc
-- If 0xAC is one, test bridges 4-6
--$8101:C0 01     CPY #$01                   A:FF X:05 Y:02 P:nvUbdIzc
--$8103:F0 28     BEQ $812D                  A:FF X:05 Y:02 P:nvUbdIzC
--Else, test bridges 7-9
--Load 2, so we can count 3 bridges
--$8105:A0 02     LDY #$02                   A:FF X:05 Y:02 P:nvUbdIzC
--Load the RNG value
--$8107:A5 37     LDA $0037 = #$71           A:FF X:05 Y:02 P:nvUbdIzC
--Shift the RNG one bit right
--$8109:4A        LSR                        A:71 X:05 Y:02 P:nvUbdIzC
--If it is zero, skip the next lines
--$810A:90 05     BCC $8111                  A:38 X:05 Y:02 P:nvUbdIzC
--Load the offset to the bridge from the ROM 
--(Notice that the offsets are the same for each 3 grouping)
--$810C:BE 7B 81  LDX $817B,Y @ $817D = #$0B A:38 X:05 Y:02 P:nvUbdIzC
--Subtract 1, turning the 00 into FF. Strangely, the trace logger botches this. 
--$810F:D6 9D     DEC $9D,X @ $00A8 = #$00   A:38 X:0B Y:02 P:nvUbdIzC
--Go to next bridge
--$8111:88        DEY                        A:38 X:0B Y:02 P:NvUbdIzC
--If there are still bridges to 'randomize', go back to $8109
--$8112:10 F5     BPL $8109                  A:38 X:0B Y:01 P:nvUbdIzC



--Here is the real bitch of it all
--Get the RNG
--$FCF1:A5 37     LDA $0037 = #$6A         
-- Add the current frame count
--$FCF3:65 1B     ADC $001B = #$61     
-- Load it back into the RNG (note the trace logger also fucks this up)
--$FCF5:85 37     STA $0037 = #$6A     
--Repeat until frame interrupt. (Dragon Warrior 4 anyone?)
--Because the 3 frames of bridge randomizing are lag frames, we can't influence them via the controller.
--The repeated addition of the frame count is what locks you into a set 
--number of possibilities given for that given count
--Thus, it is best to simply brute force check all the combos of frame counts and RNG values, and check which work.





FrameCounter = 0x1B;
RNG = 0x37;
rngval = 0;
done = false;
CHECK = savestate.create();
memory.writebyte(0x29,5);
savestate.save(CHECK);
Frame = 0;
Combo = io.open("C:\\AkumaLevel3.txt", "w");
bridgecheck = {0x88, 0x8C, 0x90, 0x91, 0x95, 0x99, 0xA0, 0xA4, 0xA8};
while not done do
  	savestate.load(CHECK);
	memory.writebyte(FrameCounter,Frame);
	memory.writebyte(RNG,rngval);
	FCEU.frameadvance();
	FCEU.frameadvance();
	FCEU.frameadvance();
	FCEU.frameadvance();
	bridges = 0;
	for i = 1,9,1 do
  		if memory.readbyte(bridgecheck[i]) == 255 then  	
  			bridges = bridges + 1;
		end;
 	end;
 	if bridges < 2 then
 		outs = string.format('0x1B:	%d	0x37:	%d	B:	%d\n', Frame, rngval, bridges);
     	Combo:write(outs);  
 	end;
	rngval = rngval + 1;
	if rngval == 256 then 
 		Frame = Frame +1;
 		rngval = 0;
	end;
	if Frame == 256 then 
		done = true; 
		--Yes, I know I should have done this as 2 for loops. 
		--This code was an evolution from a brute-force bot. 
		--So, screw it. 
	end;
end;
	
