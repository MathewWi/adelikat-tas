--User settings
Stat = 0x60BA; -- Characters Level, used for offset. 
Tests = 5; -- How many Tests to run
FB = 2; -- maximum number of frames allowed to burn.
MPgain = false; --Whether or not the character gains MP.





local nums = {"numpad0", "numpad1","numpad2","numpad3","numpad4","numpad5", "numpad6","numpad7","numpad8","numpad9"};
local pup, pdown = "pageup","pagedown";
local plus, minus = "numpad+","numpad-";
Ups = {[1] = 1,[2] =  2,[3] =  3,[4] = 5,[5] = 7};
NameTable  ={'Att','Agi','Vit','Luck','HP'};
SM = 5;
FF = savestate.create(); 

START = savestate.create(); -- Start Frame
CURR = savestate.create();
FCEU.speedmode('turbo'); 
Eq = {}; --Equality
StatMin, StatMax = {}, {};
ST, Des, LS = {},{}, {}; -- Starting, desired, and last
for i = 1,SM,1 do --get starting stat table
	ST[i] = memory.readbyte(Stat + Ups[i]);
end;


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

function SkipToText()
			lastskip = 0;
			insidedone = false; -- advance one to make sure we are in lag.   		
  			while not insidedone do
  				while FCEU.lagged() do -- Go to next manipulation point.   					
  					savestate.save(FF);  				
  					FCEU.frameadvance();  			  			
  				end;
  				if (memory.readbyte(0x720E) == 7) then insidedone = true; end;
  				FCEU.frameadvance();
  				if FCEU.lagged() then
  					savestate.load(FF);  		
  					RandFrame(1,0);  				
  					FCEU.frameadvance(); 
  					if not FCEU.lagged() then FCEU.frameadvance(); end; --this should deal with frame - lag - frame.   				 			  			  				
  				else
  					savestate.load(FF);  		
	  				insidedone = true;
  				end;
  			end;
end;

done = false;
savestate.save(START);	
for i = 1,SM,1 do
StatMin[i] = 99;
StatMax[i] = -1;
LS[i] = 0;
Eq[i] = true;
end;
FCEU.speedmode('turbo'); 
for z = 1,Tests,1 do
		savestate.load(START);	
		gui.text(1,1,string.format('Test #%d',z));
		while(memory.readbyte(Stat+7) == ST[5]) do
			N = math.random(1,10);
  			RandFrame(N,1);
  			FCEU.frameadvance();  			  			
  			RandFrame(1,1);
  			FCEU.frameadvance();  	
  			SkipToText();  		  			
  		end;  		
  		for i = 1,SM,1 do
  			t = (memory.readbyte(Stat+Ups[i]) - ST[i]);
  			if StatMin[i] > t  then
  				StatMin[i] = t;
  			elseif StatMax[i] < t then
  				StatMax[i] = t;
  			end;
  		end;  				
end;
  		
--*****************************************************************************
function press(button)
--*****************************************************************************
-- Checks if a button is pressed.
-- The tables it accesses should be obvious in the next line.
-- best function EVER, written by FatRatKnight
    if keys[button] and not last_keys[button] then
        return true

    end
    return false
end

for i = 1,SM,1 do
		outs = NameTable[i] .. ' +' .. StatMin[i] .. '-' .. StatMax[i];  				
		print(outs);
		Des[i] = StatMax[i];
end;


done = false; 
cursorflash = 15;
cursoron = true; 
currpos = 1;
	
FCEU.speedmode('normal'); 
while not done do
		keys = input.get();
  		FCEU.frameadvance(); 
  		gui.drawbox(16,100,244,220,'black','white');	
  		gui.text(20,103,'(D)one', 'white','black');
		gui.drawbox(58,currpos*12+103, 120, currpos*12+114,'black','red');
		for i = 1,SM,1 do
			gui.text(60,105 + i*12, NameTable[i], 'white','black');
			if Eq[i] then gui.text(90,105 + i*12, '=', 'white','black'); 
			else gui.text(90,105 + i*12, '>', 'white','black');  end;		
			gui.text(100,105 + i*12, Des[i], 'white','black');
		end;  		
		if press(pup) or press(pdown) then
			Eq[currpos] = not Eq[currpos];
		end;
		if press(nums[7]) or press(plus) then
			Des[currpos] = Des[currpos]	+ 1;
		elseif press(nums[5]) or press(minus) then
			Des[currpos] = math.max(0,Des[currpos]	- 1);
		elseif press(nums[3]) then 
			currpos = math.min(SM, currpos+1);
		elseif press(nums[9]) then
			currpos = math.max(1,currpos-1);
		elseif press('D') then 
			done = true;
		end;		
		last_keys = keys;
end;



FCEU.speedmode('turbo'); 
done = false;
attc = 0;
N = 1;
savestate.load(START);
savestate.save(CURR);
att = 0;

while not done do 
	savestate.load(CURR);
	att = att + 1;
	gui.drawbox(150,1,235,85,'black','white');
	gui.text(153,4,string.format('attempts - %d',att), 'white','black');
	gui.text(153,14,string.format('N - %d',N), 'white','black');
	for i = 1,SM,1 do
		gui.text(153,14 + i*10, NameTable[i], 'white','black');
		gui.text(181,14 + i*10, '-', 'white','black');
		gui.text(190,14 + i*10, LS[i], 'white','black');
	end;	
	RandFrame(N,1);
	FCEU.frameadvance();
	RandFrame(1,1);  			
  	FCEU.frameadvance();  
  	SkipToText();		
  	pass1 = true;
  	pass2 = true;
  	for i = 1,SM,1 do 
  		LS[i] = (memory.readbyte(Stat+Ups[i]) - ST[i]);
  		if (LS[i] ~= Des[i] and Eq[i]) or (LS[i] <= Des[i] and not Eq[i]) then
  			pass2 = false;
  		end;
  		if LS[i] > 0 then  			
  			if (LS[i] ~= Des[i] and Eq[i]) or (LS[i] <= Des[i] and not Eq[i]) then
  				pass1 = false;
  			end;
  		end;
  		
  		
  	end;
  	if pass2 then 
  		savestate.save(CURR);
  		done = true;
  	elseif pass1 then 
  		savestate.save(CURR);
  		N = 1;
  		attc = 0;
  	else
  		attc = attc + 1;
  		if attc == 200 then
  			attc = 0;
  			N = N + 1;
  		end;  			  		  	
  		if N == FB+2 then
  			savestate.load(START);
  			savestate.save(CURR);  			
  			N = 1;
  		end;
  	end;	
end;

FCEU.pause();