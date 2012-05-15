--Global settings-----------------------------------------------------
local frames = 101; 	--Number of frames until the target RNG value
local RNGaddr = 0x0018; -- RNG address
local target = 87; 	--Desired value for the RNG to be after frames
-------------------------------------------------------------------------


local state = savestate.create();
savestate.save(state);
key1 = {};	
local buttonmap = {[1]='up',[2]='down',[4]='left',[8]='right',[16]='A',[32]='B',[64]='start',[128]='select'};

function RandFrame(frames,s) -- s is 0 for no required input, 1 for required input. 
	for i = 1,frames,1 do
		control = math.random(s,255);
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




while true do
emu.unpause(); --TODO: This doesn't work!
local RNG = 0;			--store memory.readbyte(RNGaddr) here

for x = 0, frames, 1 do
	gui.text(1,1,x)
	RandFrame(1,0)
end

RNG = memory.readbyte(RNGaddr);
if (RNG == target) then
	emu.pause();
else
	savestate.load(state);
end


end