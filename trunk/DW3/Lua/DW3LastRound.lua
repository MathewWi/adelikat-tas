



local selectk, donek, hidek, morek, nextk = "S","D","H","M", "N";
   	
BattleCheck =30;
BATTLE = 0x0032;
RNGA1 = 0x001C;
RNGA2 = 0x00A4;
MENU = 0x0D4F;
EnemyHP = 0x0500; 
PlayerHP = 0x71C;
MHP = 0x0724;
STR = 0x0704;
AG = 0x0708;
INT = 0x070C;
LUCK = 0x0710;
VIT = 0x0714;
LVL = 0x0700;
MMP = 0x0734;

EALIVE = 0x0531;
local keys, last_keys = {}, {};
local nums = {};
local nums = {"numpad0", "numpad1","numpad2","numpad3","numpad4","numpad5", "numpad6","numpad7","numpad8","numpad9"};
local pup, pdown = "pageup","pagedown";
local plus, minus = "numpad+","numpad-";
PHP = {};
EHP = {};
ELive = {};
for i = 0,4,1 do
	EHP[i+1] =  memory.readbyte(EnemyHP +i*2);
	ELive[i+1] = memory.readbyte(EALIVE+i*2);
end;
for i = 0,3,1 do
	PHP[i+1] =  memory.readbyte(PlayerHP+i*2);
end;
key1 = {};
key1['A'] = true;
Results = {};
FClist = {};
Matcher = {};
R1List = {};
R2List = {};
startframecount = movie.framecount();
START = savestate.create();
FCEU.speedmode('turbo');
savestate.save(START);
   
for checks = 0,3,1 do
		Matcher[checks] = {};
	  	Matcher[checks].MaxHP =  memory.readbyte(MHP+checks*2);
	  	Matcher[checks].Lvl = memory.readbyte(LVL + checks*1);
	  	Matcher[checks].Str = memory.readbyte(STR + checks*1);	  	
	  	Matcher[checks].Luck =memory.readbyte(LUCK + checks*1);
	  	Matcher[checks].Ag = memory.readbyte(AG + checks*1);
	  	Matcher[checks].Int = memory.readbyte(INT + checks*1);
	  	Matcher[checks].Vit = memory.readbyte(VIT + checks*1);
	  	Matcher[checks].MaxMP = memory.readbyte(MMP + checks*2);
	  	 	
end;
Pgs = {};

function GetOrders(Start,Finish)
	for curord = Start,Finish,1 do
		savestate.load(START);
		for i = 1,curord,1 do
			FCEU.frameadvance();
		end;
		joypad.set(1,key1);
		FCEU.frameadvance();
		R1List[curord+1] = memory.readbyte(RNGA1);
		R2List[curord+1] = memory.readbyte(RNGA2);
		FCEU.frameadvance();
		FCEU.frameadvance();
		FCEU.frameadvance();
		gui.text(10,10, string.format('%d of %d done.', curord+1-Start, Finish-Start+1)); 
		Finished = false;
		while (memory.readbyte(MENU) == 128) and  Finished ~= true do
			if FCEU.lagged() then
				FCEU.frameadvance();
			else
				joypad.set(1,key1);
				FCEU.frameadvance();
				FCEU.frameadvance();
			end;
			Passin = true;
			for n = 0,4,1 do
				if memory.readbyte(EALIVE+n*2) ~= 0 then
					Passin = false;
				end
			end;
			if Passin then 
				Finished = true;
			end;									
		end;		
		if Finished then 
			while memory.readbyte(BATTLE) ~= 0 do
				joypad.set(1,key1);
				FCEU.frameadvance();
			end;
			Pg = {};
			for checks = 0,3,1 do
				 s1 = memory.readbyte(MHP+checks*2) - Matcher[checks].MaxHP;
	  			 s2 =  memory.readbyte(STR + checks*1) - Matcher[checks].Str;	  	
	  			 s3 = memory.readbyte(LUCK + checks*1) - Matcher[checks].Luck;		  		
			  	 s4 = memory.readbyte(AG + checks*1) - Matcher[checks].Ag;
	  			 s5 = memory.readbyte(INT + checks*1)-Matcher[checks].Int;
	  			 s6 = memory.readbyte(VIT + checks*1) - Matcher[checks].Vit;
	  			 s7 = memory.readbyte(MMP + checks*2) - Matcher[checks].MaxMP;
	  			Pg[checks+1] = string.format('%d: P%d S%d L%d A%d I%d V%d H%d M%d',curord, checks+1, s2, s3, s4, s5, s6, s1, s7);				  				  			
	  		end;
		else
			Pg = {};
			for n = 1,4,1 do 
				Pg[n] = string.format('%d: ',curord);			
			end;			
		end;		
		Pgs[curord+1] = Pg;
		outs = string.format('%d: ',curord);			
		for checks = 0,4,1 do		
			Diff = memory.readbyte(EnemyHP+checks*2) - EHP[checks+1];
			if Diff ~= 0 then
				outs = outs .. string.format('E%d:%d ',checks+1, Diff)			
			end;	
			if (ELive[checks+1] ~= memory.readbyte(EALIVE+checks*2)) and (memory.readbyte(EnemyHP+checks*2) > 0) then
				outs = outs .. string.format('E%d-DEAD ',checks+1);
			end;		
	  	end;	
	  	for checks = 0,3,1 do
	  		Diff = memory.readbyte(PlayerHP+checks*2) - PHP[checks+1];
	  		if Diff ~= 0 then
				outs = outs .. string.format('P%d:%d ',checks+1, Diff)				
			end;
	  	end;
	  	Results[curord+1] = outs;
		FClist[curord+1] = movie.framecount() - startframecount;		
	end;
end;


GetOrders(0,BattleCheck-1);
print('Check Complete!');


--*****************************************************************************
function press(button)
--*****************************************************************************
-- Checks if a button is pressed.
-- The tables it accesses should be obvious in the next line.

    if keys[button] and not last_keys[button] then
        return true

    end
    return false
end


AttackNum = 0;
 done = false;
 entermode = false;
 CurStart = 0;
 poses = 0;
 pagetype =1;
 lastmessage = "Commands: S - Show Attack, M- more, D - done";
 lastmessage2 = ""; 
FCEU.speedmode('normal');
 while not done do	
  keys = input.get(); 
  	FCEU.frameadvance();    			
		gui.drawbox(0,0,260,180,'black','black');	
		for i = 1,12,1 do		    	
		   	if i+CurStart == BattleCheck+1 then
		    		gui.text(7,10*(i-1)+1,'end','white','black');		 
		   	elseif i+CurStart <= BattleCheck then 
		   	    if pagetype == 1 then		   	    
		    		if AttackNum+1 == i+CurStart then
		    			gui.text(7,10*(i-1)+1,Results[i+CurStart],'red','black');		
		    		else
	    				gui.text(7,10*(i-1)+1,Results[i+CurStart],'white','black');
	    			end;	    			
	    		elseif pagetype == 2 then	    		
	    			if AttackNum+1 == i+CurStart then		    			
	    				gui.text(7,10*(i-1)+1, string.format('%d: RNG1: %d, RNG2: %d, Length: %d frames',i+CurStart-1, R1List[i+CurStart],R2List[i+CurStart], FClist[i+CurStart]), 'red','black');		
		    		else
	    				gui.text(7,10*(i-1)+1, string.format('%d: RNG1: %d, RNG2: %d, Length: %d frames',i+CurStart-1, R1List[i+CurStart],R2List[i+CurStart], FClist[i+CurStart]), 'white','black');		
	    			end;
	    		else 
	    			Pg = Pgs[i+CurStart]
	    			gui.text(7,10*(i-1)+1,Pg[pagetype-2],'white','black');	
	    		end;	
	        end;	    		
	 	end;
    	gui.text(1,130,lastmessage,'white','black');
    	gui.text(1,140,lastmessage2,'white','black')
    	if entermode then  
    		gui.text(5, 150, mode,'white','black');  
    		for i = 1,pos,1 do
    			gui.text(5+i*7,160,entered[i],'white','black')
			end;
			for i = pos+1,poses,1 do
				gui.text(5+i*7,160,'_','white','black');
			end;
		end;   	
	
	if press(nextk) then
			pagetype = pagetype + 1;
			if pagetype == 7 then
				pagetype = 1;
			end;
		end;
     
     if press(plus) then
        if AttackNum < BattleCheck-1 then 
          AttackNum = AttackNum+1;          
          RNGres = RNGList[AttackNum+1];   				   		
   		  lastmessage2 = Results[AttackNum+1];
   		  lastmessage =   string.format('%d: RNG1: %d, RNG2: %d, Length: %d frames',AttackNum+1, R1List[AttackNum+1],R2List[AttackNum+1], FClist[AttackNum+1]);
   		  if AttackNum > CurStart+10 then 
   		    CurStart = CurStart + 11;
   		  end;
        end;        
     end;
     if press(minus) then
        if AttackNum > 0 then 
          AttackNum = AttackNum-1;
          RNGres = RNGList[AttackNum+1];   				   		
   		  lastmessage2 = Results[AttackNum+1];
   		 lastmessage =   string.format('%d: RNG1: %d, RNG2: %d, Length: %d frames',AttackNum+1, R1List[AttackNum+1],R2List[AttackNum+1], FClist[AttackNum+1]);
   		  if AttackNum < CurStart then
   		    CurStart = CurStart - 11;
   		  end;
   		    
        end;        
     end;     
      if  press(pup) then    		
   		if ((CurStart - 11) > -1) then	
   			CurStart = CurStart - 11;	   			
   		end;
   	end;
   	if press(morek) then
   	  GetOrders(BattleCheck, BattleCheck+29);
   	  BattleCheck = BattleCheck+30;
   	end;
     if press(hidek) then    	
    	hidemode = not hidemode;
    end;  
   if press(donek) then    	   
    	done = true;
    end;
   if  press(pdown) then    		   		
   		if (CurStart + 11) < BattleCheck then 
   			CurStart = CurStart + 11;	
   		end;   		
   end;
   if press(selectk) then    	
    	entermode = true;
    	mode = "S";
    	entered = {};
    	poses = 3;
    	pos = 0;    	
    end;   
   if pos == poses and entermode then 
   		entermode = false;
   		if mode == "S" then
   			AttackNum = entered[1] * 100 + entered[2] * 10 + entered[3];   			
   			if AttackNum < BattleCheck then   				
   				lastmessage2 = Results[AttackNum+1];
   				 lastmessage =   string.format('%d: RNG1: %d, RNG2: %d, Length: %d frames',AttackNum+1, R1List[AttackNum+1],R2List[AttackNum+1], FClist[AttackNum+1]);
   			else
   			    AttackNum = 0;
   			    lastmessage = "BAD BATTLE SELECTED, RESETING."
   			    lastmessage2 = "";
   			end;
   		end;	
   end;
   for numloop = 0,9,1 do 
	   	if press(nums[numloop+1]) and entermode then 	   	        
   				pos = pos+1;
   				entered[pos] = numloop;
   		end;
   end;
   last_keys = keys;
end;

FCEU.speedmode('turbo');
savestate.load(START);
for i = 1,AttackNum,1 do
			FCEU.frameadvance();
end;
joypad.set(1,key1);
FCEU.frameadvance();
FCEU.frameadvance()
FCEU.frameadvance()
FCEU.frameadvance()
Finished = false;
while (memory.readbyte(MENU) == 128) and  Finished ~= true do
			if FCEU.lagged() then
				FCEU.frameadvance();
			else
				joypad.set(1,key1);
				FCEU.frameadvance();
				FCEU.frameadvance();
			end;
			Passin = true;
			for n = 0,4,1 do
				if memory.readbyte(EALIVE+n*2) ~= 0 then
					Passin = false;
				end
			end;
			if Passin then 
				Finished = true;
			end;									
		end;		
		if Finished then 
			while memory.readbyte(BATTLE) ~= 0 do
				joypad.set(1,key1);
				FCEU.frameadvance();
			end;
		end;			
