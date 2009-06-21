
TESTER = savestate.create();

savestate.save(TESTER);
BABBLE =  io.open("C:\\DW4_babble1.txt", "w");
FCEU.speedmode('turbo');
for i = 0,255,1 do	
	for j = 0,255,1 do
		savestate.load(TESTER);
		memory.writebyte(0x0013,i)
		memory.writebyte(0x0012,j)
		for k = 1,20,1 do
			gui.text(10,50, string.format("i: %d   j: %d", i, j));
			FCEU.frameadvance();									
		end;
		if memory.readbyte(0x6E49) == 1 then
			outs = string.format("0x13: %d   0x12: %d\n", i, j);			
			BABBLE:write(outs);  
			print(outs);
		end;			
	end;
end;

