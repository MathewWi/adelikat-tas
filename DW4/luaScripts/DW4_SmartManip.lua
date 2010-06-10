


frame_burn = 3;



local AddSK, AddCK, DispSCK, SetBK, FinK, BackK,TextK = 'A','C','D','S','F','B','T';


CHECK = savestate.create(); -- Start Frame
FF = savestate.create(); -- Frame find save
local buttonmap = {[1]='up',[2]='down',[4]='left',[8]='right',[16]='A',[32]='B',[64]='start',[128]='select'} 
local keys, last_keys = {}, {};
local nums = {};
local nums = {"numpad0", "numpad1","numpad2","numpad3","numpad4","numpad5", "numpad6","numpad7","numpad8","numpad9"};
local pup, pdown = "pageup","pagedown";
local plus, minus = "numpad+","numpad-";

local seqmap = {[1] = 'S', [2] = 'T', [3] = 'M-A',[4] = 'M-U', [5] = 'M-D'};
NofChecks = 0;
Checks1,Checks2,Checks3 = {}, {}, {};
local NameTable = {[1]= 'P1 HP',[2] = 'P2 HP', [3] = 'P3 HP', [4] = 'P4 HP', [5] = 'Party HP', [6] = 'Enemy 1 HP', [7] = 'Enemy 2 HP'};
                   --P1      P2      P3      P4      P5  E1      E2  
local MemoryTable = {0x60B6, 0x0000, 0x0000, 0x0000, 00, 0x727E, 0x728C};  
local EqualityTable = {[1] = '=', [2] = '<', [3] = '>'};
local ValTable = {[1] = 'Current HP',[2] = 'Death', [3] = 'Set = %d', [4] ='Diff = %d',};
Cmaxes = {7, 3, 4};

setvals = 0;
ValSet = {};


CHP = {};
for i = 1,7,1 do
	CHP[i] = memory.readbyte(MemoryTable[i]);	
end;

key1 = {};
key_empty = {};
done = false;

savestate.save(CHECK);
attempts = 0;


sequence = {};
sequences = 0; 
mode = 'B';


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
done = false; 
cursorflash = 15;
cursoron = true; 
while not done do
		keys = input.get();
  		FCEU.frameadvance(); 
  		gui.drawbox(16,134,244,220,'black','white');	
  		if mode == 'B' then  		
  			gui.text(25,137, 'DarkKobolds DW4 TASer','white','black');
  			gui.text(30,147,'(A)dd Sequence, Add (C)heck','white','black');
  			gui.text(30,157,'(D)isplay Sequence and Checks','white','black');			
			gui.text(30,167,string.format('(S)et frame burn, Current = %d', frame_burn),'white','black');
			gui.text(30,177,'(F)inished','white','black');			
			--Check for keys.
			if (press(AddSK)) then mode = 'S';  		     			
  			elseif press(DispSCK) then mode = 'D';
  			elseif press(AddCK) then 
  				mode = 'C';
  				currc = {1, 1, 1};
  				ccx = 0;
  				currpos = 1;
  			elseif press(SetBK) then mode = 'R';
  			elseif press(FinK) then done =true;
  			end;  			  			
  		elseif mode == 'D' then
  			outs = '';
  			for i = 1,sequences,1 do
  				if i == sequences then
  					outs = outs .. seqmap[sequence[i]];
  				else
  					outs = outs .. seqmap[sequence[i]] .. ',';
  				end;
  			end;  			
  			gui.text(18,137,outs,'white','black');  			
  			gui.text(30,167,'(B)ack','white','black'); 
  			if (press(BackK)) then
  				mode = 'B';
  			end;  		    						  	
  		elseif mode == 'C' then
  				if currpos == 1 then gui.drawbox(35, 148, 100, 158,'black','red');
  				elseif currpos == 2 then gui.drawbox(102, 148, 111, 158,'black','red');
  				else gui.drawbox(114, 148, 210, 158,'black','red');
  				end;
  				gui.text(37,150, NameTable[currc[1]],'white','black');  				
  				gui.text(105,150, EqualityTable[currc[2]],'white','black');
  				gui.text(116,150, string.format(ValTable[currc[3]],ccx),'white','black');  				
  				gui.text(30,167,'(D)one, (B)ack','white','black');   
  				if (press(plus) and currpos == 3) then  					  				
  					ccx = ccx + 1;
  				end;  					
  				if (press(minus) and currpos == 3) then
  				 	ccx = ccx - 1;
  				end;
  					if (press(pup) and currpos == 3) then  					  				
  					ccx = ccx + 10;
  				end;  					
  				if (press(pdown) and currpos == 3) then
  				 	ccx = ccx - 10;
  				end;
  				if press(nums[9]) then 
  					currc[currpos] = math.min(currc[currpos] + 1,Cmaxes[currpos]);  								  		
  				end;
  				if press(nums[3]) then 
  					currc[currpos] = math.max(currc[currpos] - 1,1);  								  		
  				end;  				
  				if press(nums[7]) then 
  					currpos = math.min(currpos+1,3);
  				end;
  				if press(nums[5]) then 
  					currpos = math.max(currpos-1,1);
  				end;  				  				
  				if press(DispSCK) then
  					NofChecks = NofChecks + 1;
  					Checks1[NofChecks] = currc[1];
  					Checks2[NofChecks] = currc[2];
  					Checks3[NofChecks] = currc[3];
  					if currc[3] > 2 then
  					  setvals = setvals + 1;
  					  ValSet[setvals] = ccx;
  					end; 
  					mode = 'B';
  				end;
  				if press(BackK) then 
			   		mode = 'B';
			   	end;		
		elseif mode == 'R' then		
				gui.text(30,137,'Set Frame Burn','white','black');		  			  			
				gui.text(30,147,string.format('Current = %d', frame_burn),'white','black');
				gui.text(30,157,'(B)ack','white','black'); 
				for numloop = 1,9,1 do 
	   				if press(nums[numloop+1]) then 	   	           						   			
   						frame_burn = numloop;
		   			end;
			   end;
			   if press(BackK) then 
			   		mode = 'B';
			   	end;			   
  		elseif mode == 'S' then
  			outs = '';
  			for i = 1,sequences,1 do
  				if i == sequences then
  					outs = outs .. seqmap[sequence[i]];
  				else
  					outs = outs .. seqmap[sequence[i]] .. ',';
  				end;
  			end;  	
  			gui.text(18,137,outs,'white','black');
  			gui.text(30,147,'Add to the Sequence','white','black');
  			gui.text(30,157,'(S)ingle Frame, (T)ext Advance','white','black');
			gui.text(30,167,'Menu - (A), (U)p, (D)own','white','black');  			  						
  			gui.text(30,177,'(C)lear, (B)ack','white','black'); 
  			if press(SetBK) then 
  				sequences = sequences + 1;
  				sequence[sequences] = 1;  				
  			elseif press(TextK) then
  				sequences = sequences + 1;
  				sequence[sequences] = 2;
  			elseif press(AddSK) then
  				sequences = sequences + 1;
  				sequence[sequences] = 3;  				
  			elseif press('U') then
  				sequences = sequences + 1;
  				sequence[sequences] = 4;  				
	  		elseif press('D') then
  				sequences = sequences + 1;
  				sequence[sequences] = 5;  					  	
  			end;  			
  			if press(BackK) then
  				mode = 'B';
  			end;
  			if press('C') then 
  				sequences = 0;
  				sequence = {};
  			end;  		
  		end;  	  		  	
  		  		  		
  		if cursoron then
  			gui.text(30,187,'_','white','black');
  		else
  			gui.text(30,187,'_','black','white');
  		end;
  		cursorflash = cursorflash - 1;
  		if cursorflash == 0 then
  			cursorflash = 15;
  			cursoron = not cursoron;
  		end;  	
  		last_keys = keys;  		
end;	


done = false;



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

function RandMenu(keyval) -- s is 0 for no required input, 1 for required input. 	
		control = keyval + 64*math.random(0,1);
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

function CheckFunc(A,B,C,D)
	V1 = memory.readbyte(MemoryTable[A]);
	if C == 1 then
		V2 = V1 - CHP[A];
	elseif C == 2 then
		V2 = V1;
	elseif C == 3 then
	    V2 = V1 - D;
	elseif C == 4 then
		V2 = CHP[A] - V1 + D;
	end;	   			
	
	if B == 1 then --Equal
	   if  V2 == 0 then passv = true; else passv = false; end;
	elseif B == 2 then --Less
		if V2 < 0 then passv = true; else passv = false; end;
	elseif B == 3 then --Greater
		if V2 > 0 then passv = true; else passv = false; end;
	end;
return passv;
end;
	


if NofChecks == 0 then
	done = true;
	print('Script Failed, no checks set');
end;

function SkipToText()
			insidedone = false; -- advance one to make sure we are in lag.   		
  			while not insidedone do
  				while FCEU.lagged() do -- Go to next manipulation point.   					
  					savestate.save(FF);  				
  					FCEU.frameadvance();  			  			
  				end;
  				FCEU.frameadvance();
  				if FCEU.lagged() then
  					savestate.load(FF);  		
  					RandFrame(1,0);  				
  					FCEU.frameadvance();  			  			  				
  				else
  					savestate.load(FF);  		
	  				insidedone = true;
  				end;
  			end;
end;

--***************************************
--Botting starts here
--***************************************
FCEU.speedmode('turbo');  	
while not done do 
	savestate.load(CHECK);
	gui.text(1,1,'Running...');
	for i = 1,sequences,1 do	
  		if sequence[i] == 1 then -- single frame  	
  			 RandFrame(1,0);  			 
  			 FCEU.frameadvance();   -- advance one to make sure we are in lag.   		
  			while FCEU.lagged() do -- Go to next manipulation point.   				
  				savestate.save(FF);
  				FCEU.frameadvance();  			  			
  			end;
  			savestate.load(FF);  		
  		elseif sequence[i] == 2 then --multiframe 
  			RandFrame(math.random(1,frame_burn),1); 
			joypad.set(1,key_empty) 
		  	FCEU.frameadvance(); 
  			RandFrame(1,1);  			
  			FCEU.frameadvance();  
  			SkipToText();		
  		elseif sequence[i] > 2 then
  			if sequence[i] == 3 then RandMenu(16);
  			elseif sequence[i] == 4 then RandMenu(1); 			  
  			elseif sequence[i] == 5 then RandMenu(2); 			  
  			end;
  		    savestate.save(FF);
  			FCEU.frameadvance();  -- look 2 ahead, see if lagged
  			FCEU.frameadvance();			  			
  			if FCEU.lagged() then  				
  				SkipToText();	
  			elseif sequence[i+1] == sequence[i] then -- if the next input is the same as the current one, we need an empty frame between. 
  				savestate.load(FF);  		
  				FCEU.frameadvance(); -- Do a single frame advance
  			else
  				savestate.load(FF); -- otherwise,we are ready for input immediately.
  			end;	  			  		
  		end;  		
	end;
	pass = true;		
	SV = 0;
	for i = 1,NofChecks,1 do
		if Checks1[i] == 5 then
		else
			if Checks3[i] > 2 then
				SV = SV + 1;
				pv = CheckFunc(Checks1[i],Checks2[i],Checks3[i],ValSet[SV]);																	
			else
				pv = CheckFunc(Checks1[i],Checks2[i],Checks3[i],0);																	
			end;
			if not pv then
				pass = false;
			end;
		end;
	end;	
	if pass then done = true; end; -- We passed!
	attempts = attempts  + 1;
	print(string.format('%d', attempts));
end;  	
FCEU.pause();	

