frame_burn = 3;



CHECK = savestate.create();
local buttonmap = {[1]='up',[2]='down',[4]='left',[8]='right',[16]='A',[32]='B',[64]='start',[128]='select'} 




FCEU.frameadvance();
key1 = {};
key_empty = {};
done = false;
FCEU.speedmode('turbo');
savestate.save(CHECK);
attempts = 0;

function RandFrame(frames)
	for i = 1,frames,1 do
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
  	end;
end;

  	
while not done do 
	savestate.load(CHECK);
	RandFrame(math.random(1,frame_burn));
	joypad.set(1,key_empty) 
  	FCEU.frameadvance(); 
  	RandFrame(1);
  	FCEU.frameadvance();   	
  	while FCEU.lagged() do
  		FCEU.frameadvance();
  	end;
  	RandFrame(math.random(1,frame_burn));
	joypad.set(1,key_empty) 
  	FCEU.frameadvance(); 
  	RandFrame(1);
  	FCEU.frameadvance();   	
  	while FCEU.lagged() do
  		FCEU.frameadvance();
  	end;  	    	
  	FCEU.frameadvance();   	
  	while FCEU.lagged() do
  		FCEU.frameadvance();
  	end;  	
  	RandFrame(math.random(1,frame_burn));
	joypad.set(1,key_empty) 
  	FCEU.frameadvance(); 
  	RandFrame(1);
  	FCEU.frameadvance();   	
  	while FCEU.lagged() do
  		FCEU.frameadvance();
  	end;  	      	
  	RandFrame(math.random(1,frame_burn));
	joypad.set(1,key_empty) 
  	FCEU.frameadvance(); 
  	RandFrame(1);
  	FCEU.frameadvance();   	
  	while FCEU.lagged() do
  		FCEU.frameadvance();
  	end;  	
  	
  	if memory.readbyte(0x60B6) < 1 then
			done = true;
	end;
	attempts = attempts  + 1;
	print(string.format('%d %d', attempts,memory.readbyte(0x60B6)));
end;  	
	
	
FCEU.pause();	