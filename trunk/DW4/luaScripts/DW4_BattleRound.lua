--DW4_Get_Encounter
--Start on frame --7076.
Turn = 0x96;




CHECK = savestate.create();
local buttonmap = {[1]='up',[2]='down',[4]='left',[8]='right',[16]='A',[32]='B',[64]='start',[128]='select'} 




FCEU.frameadvance();


framefind = savestate.create();
key1 = {};
done = false;
FCEU.speedmode('turbo');
savestate.save(CHECK);
while not done do
--7076 to 7201 
	savestate.load(CHECK);
	control = math.random(0,255);
	for bit,button in pairs(buttonmap) do
    		if AND(control,bit) ~= 0 then
      			key1[button]=true;
      		else
      			key1[button]=false;
	    	end    
  		end
  		joypad.set(1,key1) 
  		for i = 1,15,1 do   	  	
  			FCEU.frameadvance();  
		end;
	   control = math.random(1,255);
	    for bit,button in pairs(buttonmap) do
    		if AND(control,bit) ~= 0 then
      			key1[button]=true;
      		else
      			key1[button]=false;
	    	end    
  		end
  		joypad.set(1,key1) 
  		for i = 1,26,1 do   	  	
  			FCEU.frameadvance();  
		end;
		
		control = math.random(0,1)*64 + 16;
		for bit,button in pairs(buttonmap) do
    		if AND(control,bit) ~= 0 then
      			key1[button]=true;
      		else
      			key1[button]=false;
	    	end    
  		end
  		--Attack
  		joypad.set(1,key1) 
  		for i = 1,5,1 do   	  	
  			FCEU.frameadvance();  
		end;
		control = 1;
		for bit,button in pairs(buttonmap) do
    		if AND(control,bit) ~= 0 then
      			key1[button]=true;
      		else
      			key1[button]=false;
	    	end    
  		end
  		--Up
  		joypad.set(1,key1)   		
  		FCEU.frameadvance();  	  		
		control = math.random(0,3)*64 + 16;
		for bit,button in pairs(buttonmap) do
    		if AND(control,bit) ~= 0 then
      			key1[button]=true;
      		else
      			key1[button]=false;
	    	end    
  		end
  		--Select
  		joypad.set(1,key1) 
  		fz =  math.random(1,3);		
  		for i = 1,3+fz,1 do   	  	
  			FCEU.frameadvance();  
		end;
		control = math.random(0,1)*64 + 16;
		for bit,button in pairs(buttonmap) do
    		if AND(control,bit) ~= 0 then
      			key1[button]=true;
      		else
      			key1[button]=false;
	    	end    
  		end
  		--Ragn
  		joypad.set(1,key1) 
  		for i = 1,9,1 do   	  	
  			FCEU.frameadvance();  
		end;
		control = math.random(0,255);
		for bit,button in pairs(buttonmap) do
    		if AND(control,bit) ~= 0 then
      			key1[button]=true;
      		else
      			key1[button]=false;
	    	end    
  		end
       --Lagless  			
  		for i = 1,3,1 do   	  	
  			joypad.set(1,key1) 
  			FCEU.frameadvance();  
		end;
		FCEU.frameadvance();  
		while FCEU.lagged() == true do
			FCEU.frameadvance();  
		end;
		
			FCEU.frameadvance();  		
	    control = math.random(1,255);
	    for bit,button in pairs(buttonmap) do
    		if AND(control,bit) ~= 0 then
      			key1[button]=true;
      		else
      			key1[button]=false;
	    	end    
  		end
  		joypad.set(1,key1) 
  		for i = 1,10,1 do   	  	
  			FCEU.frameadvance();  
		end;
		if memory.readbyte(0x7361) > 20 then
			done = true;
		end;
end;
					