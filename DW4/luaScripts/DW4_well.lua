--DW4_Well
-- Start on frame 13023
-- Make sure the movie starts read-only, and goes through the entire well. 
-- Suggested to a savestate at the end of the well, just in case.

Encounter = 0x6E49;




--Copy here
FrameCopyStart = 13114;
FrameCopyEnd = 16890;
EncounterStart = 17112;


local buttonmap = {[1]='up',[2]='down',[4]='left',[8]='right',[16]='A',[32]='B',[64]='start',[128]='select'} 

START = savestate.create();
ATTEMPT = savestate.create();
done = false;


movie.setreadonly(true);
FCEU.speedmode('turbo');
savestate.save(START);
while movie.framecount() ~=  FrameCopyStart do
	FCEU.frameadvance();
end;


keylist = {};
keyr = {};
count = 0;
--
while movie.framecount() ~= FrameCopyEnd do
    keys = {};   
    FCEU.frameadvance();
    keys = joypad.get(1);
    count = count + 1;
    keylist[count] = keys;
end;
movie.setreadonly(false);
while not done do
	savestate.load(START);	
	while movie.framecount() ~= FrameCopyStart do
		control = math.random(0,7)*16 + 8 + math.random(0,7);
		for bit,button in pairs(buttonmap) do
    			if AND(control,bit) ~= 0 then
      				keyr[button]=true;
      			else	
      				keyr[button]=false;
	    		end    
  		end 
  		joypad.set(1,keyr);  		
  		FCEU.frameadvance();  
   end;
   if memory.readbyte(Encounter) ~= 1 then
        i = 0;
   		while movie.framecount() ~= FrameCopyEnd do
   	    	i = i + 1;
   			joypad.set(1,keylist[i]);  		
  			FCEU.frameadvance()
  		end;
  		savestate.save(ATTEMPT);
  		g = 0
  		while g ~= 100 and (not done) do 
  		savestate.load(ATTEMPT);
  		g = g + 1;
  		while movie.framecount() ~= EncounterStart do
  			control = math.random(0,7)*16 + 8 + math.random(0,7);
			for bit,button in pairs(buttonmap) do
    			if AND(control,bit) ~= 0 then
      				keyr[button]=true;
      			else	
      				keyr[button]=false;
	    		end    
  			end 
  			joypad.set(1,keyr)  		
  			FCEU.frameadvance();  
  		 end;
  		 if memory.readbyte(Encounter) == 1 then
			done = true;
		end;  	
	  end;		  
   end;
   
end;

