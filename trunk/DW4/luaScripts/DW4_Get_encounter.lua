--DW4_Get_Encounter
--Start on frame --7076.
Encounter = 0x6E49;

CHECK = savestate.create();
local buttonmap = {[1]='up',[2]='down',[4]='left',[8]='right',[16]='A',[32]='B',[64]='start',[128]='select'} 

key1 = {};
done = false;
FCEU.speedmode('turbo');
savestate.save(CHECK);
while not done do
--7076 to 7201 
	savestate.load(CHECK);
	for fc = 1,126,1 do
		control = math.random(0,7)*16 + 8 + math.random(0,7);
		for bit,button in pairs(buttonmap) do
    		if AND(control,bit) ~= 0 then
      			key1[button]=true;
      		else
      			key1[button]=false;
	    	end    
  		end 
  		joypad.set(1,key1)
  		gui.text(10,50,string.format('Im testing %d',control));
  		FCEU.frameadvance();  
	end;
-- 7202	to 7281
 	for fc = 1,76,1 do 	
 		gui.text(10,50,"Im in lag!");
		FCEU.frameadvance();
	end;			
	for fc = 1,24,1 do
		control = math.random(0,7)*16 + 8 + math.random(0,7);	
		for bit,button in pairs(buttonmap) do
			if AND(control,bit) ~= 0 then
   			   			key1[button]=true;
      		else
      			key1[button]=false;
	    	end    
  		end 
  		joypad.set(1,key1)
		FCEU.frameadvance();  
	end;
	if memory.readbyte(Encounter) == 1 then
		done = true;
	end;
end;
					