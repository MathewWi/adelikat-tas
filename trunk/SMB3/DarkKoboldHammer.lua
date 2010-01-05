--This doesn't work, but the idea is there - force a position to hold, to delay everything by X frames


X_Level = 0x0090
StartPos = memory.readbyte(0x0090);
CHECK = savestate.create();


framecheck = 50;
savestate.save(CHECK);
for x = 1,framecheck,1 do
savestate.load(CHECK);
	for i = 1,20,1 do
	 memory.writebyte(X_Level,StartPos)
	 FCEU.frameadvance();
	end;
	for i = 1,600,1 do
	 FCEU.frameadvance();
	 gui.text(10,10,string.format('Frames plus %d',x))
	 end;
end;