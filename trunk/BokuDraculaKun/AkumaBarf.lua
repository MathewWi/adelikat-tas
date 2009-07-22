--Akuma MASH BUTTONS HAPPY TIME
--ARGH SMASH CONTROLLER

Endframe = ;




FrameCycle = EndFrame - movie.framecount();
CHECK = savestate.create();
local buttonmap = {[1]='up',[2]='down',[4]='left',[8]='right',[16]='A',[32]='B',[64]='start',[128]='select'} 
key1 = {};
z = 0;
gamecheck = {0x88, 0x8C, 0x90, 0x91, 0x95, 0x99, 0xA0, 0xA4, 0xA8};
done = false;
FCEU.speedmode('turbo');
savestate.save(CHECK);
try = 0;
while not done do
  savestate.load(CHECK);
  for buttonmash = 1,(96-67),1 do  
  	control = math.random(0,512);
  	if control > 255 then
  		control = 0;
  	end;
  	for bit,button in pairs(buttonmap) do
    		if AND(control,bit) ~= 0  and bit ~= 64 then
      			key1[button]=true;
      		else
      			key1[button]=false;
	    	end    
  		end 
  		joypad.set(1,key1)    	
  		gui.text(10,50,string.format('Im testing %d, Last %d',try,z));
  		FCEU.frameadvance();  
  end;
  for i =1,5,1 do
  	FCEU.frameadvance();  
  end;
  z = 0;
  for i = 1,9,1 do
  	if memory.readbyte(gamecheck[i]) == 255 then  	
  		z = z + 1;
	end;
 end;
 if z < 2 then
  done = true;
 end;
 try = try + 1;
end;
