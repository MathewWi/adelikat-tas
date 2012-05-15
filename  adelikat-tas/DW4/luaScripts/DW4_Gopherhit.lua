--DW4 - manipulate TREE Critical.
--Start on frame --7293
Turn = 0x96;



attempts = 0;
CHECK = savestate.create();
local buttonmap = {[1]='up',[2]='down',[4]='left',[8]='right',[16]='A',[32]='B',[64]='start',[128]='select'} 



tempstate = savestate.create();

framefind = savestate.create();

key1 = {};
done = false;
FCEU.speedmode('turbo');
savestate.save(CHECK);
nolag = {};
notfound = true;
lastframe = false; 
while not done do
--7076 to 7201 
	savestate.load(CHECK);
	--Enter fight
	control = math.random(0,255);
	for bit,button in pairs(buttonmap) do
    		if AND(control,bit) ~= 0 then
      			key1[button]=true;
      		else
      			key1[button]=false;
	    	end    
  		end  		
  	
  		joypad.set(1,key1) 
  		FCEU.frameadvance();
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
  	    FCEU.frameadvance();		
  	    -- if we haven't found the lagless frames for manipulation, go ahead and do that.																																		
  	    if notfound then   	        
  	    	savestate.save(framefind);
  	    	lagc = 0;
  	    	while notfound do 
  	    		FCEU.frameadvance();
  	    		if not emu.lagged() and lastframe then
  	    		   Endframe = movie.framecount() - 1;
  	    		   notfound = false;  	    		
  	    		elseif not emu.lagged() then 
  	    			lagc = lagc + 1;
  	    			nolag[lagc] = movie.framecount();
  	    			lastframe = true;
  	    		else
  	    		   lastframe = false;
  	    		end;
  	    	end;
  	    	savestate.load(framefind);  	    	
  	    end;  	    		  	    
		--  now, we should know exactly where the lag frames are...
  	    lagc = 1;
  	    while movie.framecount() ~= (Endframe - 1) do 
  	    	if movie.framecount() + 1 == nolag[lagc] then
  	    		control = math.random(0,255);
				for bit,button in pairs(buttonmap) do
    				if AND(control,bit) ~= 0 then
      					key1[button]=true;
      				else
      					key1[button]=false;
	    			end    
  				end  			
  				joypad.set(1,key1) 
  	    		FCEU.frameadvance();	
  	    		lagc = lagc + 1;
  	    		if emu.lagged() then 
  	    		   print('Oops, missed lagless frame.');
  	    		   -- This hopefully never happens. Fuck this game.
  	    		end;  	    		
  			else
  				FCEU.frameadvance();	
  			end;  	
  		end;		  			  		
  			FCEU.frameadvance();
  			--Time to start battle selection crap.  			
		-- We can hit start with A or without A. 
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
  		fz =  0;		
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
		FCEU.frameadvance();  		
		c1 = 0;	
		while c1 < 4 do
			while emu.lagged() do
				savestate.save(tempstate);
				FCEU.frameadvance();  
			end;
			
		    FCEU.frameadvance();
		    if emu.lagged() then 
		    	savestate.load(tempstate);
	    	    control = math.random(0,255);
		    	for bit,button in pairs(buttonmap) do
	    			if AND(control,bit) ~= 0 then
      					key1[button]=true;
    	  			else
      					key1[button]=false;
		    		end    
  				end		    				
		  		joypad.set(1,key1)   		
  				FCEU.frameadvance();  
  				FCEU.frameadvance();    				
			else
				c1 = c1 + 1;
				savestate.load(tempstate);
	    	    control = math.random(0,255);
		    	for bit,button in pairs(buttonmap) do
	    			if AND(control,bit) ~= 0 then
      					key1[button]=true;
    	  			else
      					key1[button]=false;
		    		end    
  				end		    				
		  		joypad.set(1,key1)   		
  				FCEU.frameadvance();  
  				if c1 == 2 then
  					control = math.random(0,255);
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
  				FCEU.frameadvance();
  				FCEU.frameadvance();   
  			end;	
		end;
		if memory.readbyte(0x60B6) < 1 then
		  done = true;
		end;		
		print(string.format('%d %d', attempts,memory.readbyte(0x60B6)));		
		attempts = attempts  + 1;
		
		
end;
movie.setreadonly(true);					