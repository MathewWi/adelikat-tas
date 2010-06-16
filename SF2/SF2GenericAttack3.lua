



local selectk, donek, hidek, morek, nextk = "S","D","H","M", "N";
   	
BattleCheck =80;

LocX = 0xFFE82E;
LocY = 0xFFE82F;
EX = 0xFFEF2E;
EY = 0xFFEF2F;
RNG = 0xFFDEA4;
NumPlayer = 0xFFB640;
OrderL = 0xFFF71A;
In_Battle = 0xFFB682;
Character_Store = 0xFFE800;
Enemy_Store = 0xFFEF00;
EXP = 0xFFB62D;
Lua_Hold = 0xFFA7B7;
done = false;
done = false;
StartPlace = 0;

local keys, last_keys = {}, {};
local nums = {};
local nums = {"numpad0", "numpad1","numpad2","numpad3","numpad4","numpad5", "numpad6","numpad7","numpad8","numpad9"};
local pup, pdown = "pageup","pagedown";
local plus, minus = "numpad+","numpad-";


Results = {};
Matcher ={};
party_index = {};
enemy_index = {};
Z= {}
EXPlist = {};
Z.HP = 0;
Z.Atk = 0;
Z.Stat = 0;
party_size = memory.readword(NumPlayer);
   for i = 1,party_size,1 do
		party_index[i] = memory.readbyte(In_Battle+i-1);
   end;       
   
for checks = 1,party_size,1 do
		Matcher[checks] = {};
	  	Matcher[checks].HP= memory.readword(Character_Store+0xE+party_index[checks]*56);
	  	Matcher[checks].Lvl = memory.readbyte(Character_Store+0x0B+party_index[checks]*56);
	  	Matcher[checks].AtkC = memory.readbyte(Character_Store+0x13+party_index[checks]*56);	  	
	  	Matcher[checks].HpB = memory.readword(Character_Store+0x0C+party_index[checks]*56);
	  	Matcher[checks].MpB = memory.readbyte(Character_Store+0x10+party_index[checks]*56);
	  	Matcher[checks].AtkB = memory.readbyte(Character_Store+0x12+party_index[checks]*56);
	  	Matcher[checks].DefB = memory.readbyte(Character_Store+0x14+party_index[checks]*56);
	  	Matcher[checks].AgiB = memory.readbyte(Character_Store+0x16+party_index[checks]*56);
	  	Matcher[checks].Stat = memory.readword(Character_Store+0x2C+party_index[checks]*56);	  	
	  	Matcher[checks].EXP = memory.readbyte(Character_Store+0x30+party_index[checks]*56);	  	
end;
Estart = party_size + 1;
enemy_size = 0;
for i =1,25,1 do
   		if (memory.readword(Enemy_Store+0xE+(i-1)*56) > 0) then
   			enemy_size = enemy_size+1;
   			enemy_index[enemy_size] = i-1;   			
   		end;
 end;

for checks = 1,enemy_size,1 do
		Matcher[checks+party_size] = {};
		Matcher[checks+party_size].HP = memory.readword(Enemy_Store+0xE+enemy_index[checks]*56);
	  	Matcher[checks+party_size].Atk = memory.readbyte(Enemy_Store+0x13+enemy_index[checks]*56);
	  	Matcher[checks+party_size].Stat = memory.readword(Enemy_Store+0x2C+enemy_index[checks]*56);
	  	    
end;



 StartRNG = memory.readword(RNG);
 sframec = 0;
 START = savestate.create();
 savestate.save(START);
while StartRNG == memory.readword(RNG) do
	gens.emulateframeinvisible();
	sframec = sframec + 1;		
end;
savestate.load(START);
for i = 1,sframec-2,1 do
	gens.emulateframeinvisible();
end;
savestate.save(START);

joypad.set(1,{C=1});   	
gens.emulateframefast();
gens.emulateframefast();
gens.emulateframefast();

gens.emulateframefast();
gens.emulateframefast();
gens.emulateframefast();
gens.emulateframefast();
gens.emulateframefast();
gens.emulateframefast();
gens.emulateframefast();
gens.emulateframefast();gens.emulateframefast();
gens.emulateframefast();
gens.emulateframefast();
gens.emulateframefast();
gens.emulateframefast();
gens.emulateframefast();
gens.emulateframefast();
gens.emulateframefast();
gens.emulateframefast();gens.emulateframefast();
gens.emulateframefast();
gens.emulateframefast();
gens.emulateframefast();
gens.emulateframefast();
gens.emulateframefast();gens.emulateframefast();
gens.emulateframefast();
gens.emulateframefast();
gens.emulateframefast();
gens.emulateframefast();
gens.emulateframefast();
gens.emulateframefast();
gens.emulateframefast();
gens.emulateframefast();
gens.emulateframefast();
gens.emulateframefast();
gens.emulateframefast();
gens.emulateframefast();
gens.emulateframefast();
gens.emulateframefast();
gens.emulateframefast();


gens.emulateframefast();	
gens.emulateframefast();
gens.emulateframefast();

joypad.set(1,{C=1});   	
gens.emulateframefast();
startframecount = movie.framecount();
FClist = {};
RNGList = {};
Success = {}
RNGCheck = savestate.create();
  StartRNG = memory.readword(RNG);
   while memory.readword(RNG) == StartRNG do	   
      savestate.save(RNGCheck);
      gens.emulateframeinvisible();     
   end;

function GetOrders(Start,Finish)

for curord = Start,Finish,1 do
   savestate.load(RNGCheck);
   CurRNG =  memory.readword(RNG);   
   for n = 1,curord,1 do
      CurRNG = math.fmod(CurRNG*13+7,65536);
   end;
   memory.writeword(RNG,CurRNG);
   RNGList[curord+1] = CurRNG;
   outstr = '';
   for i = 1,100,1 do
	   gens.emulateframeinvisible();
	end;
	while (memory.readbyte(0xFFDE7B) ~= 8) do					
      				joypad.set(1,{C=1});    
       				gens.emulateframeinvisible();
	end;
	memory.writebyte(Lua_Hold,1);	
	gui.text(10,10, string.format('%d of %d done.', curord+1-Start, Finish-Start+1)); 
	gens.emulateframe();
	Success[curord+1] = false;
	Results[curord+1] = string.format('%d:',curord);	
	EXPlist[curord+1] = 0;
	for checks = 1,party_size,1 do		
	  	Z.HP = memory.readword(Character_Store+0xE+party_index[checks]*56);	  	
	  	Z.Atk = memory.readbyte(Character_Store+0x13+party_index[checks]*56);
	  	Z.Stat = memory.readword(Character_Store+0x2C+party_index[checks]*56);	  	
	  	Z.Lvl = memory.readbyte(Character_Store+0x0B+party_index[checks]*56);
	  	Z.EXP = memory.readbyte(Character_Store+0x30+party_index[checks]*56);
	  	if Matcher[checks].EXP < Z.EXP then
	  		EXPlist[curord+1] = Z.EXP - Matcher[checks].EXP;
	  	elseif Matcher[checks].EXP > Z.EXP then	  	  
	  		EXPlist[curord+1] = Z.EXP+100 - Matcher[checks].EXP;	  	
	  	end;
	  	if Matcher[checks].HP ~= Z.HP then		  			  		   
	  		if Z.HP == 0 then
	  			outstr  = outstr .. 'Death ';
	  		end;
	  		Results[curord+1] = Results[curord+1] .. string.format(' %d (%d HP)', party_index[checks], (Z.HP - Matcher[checks].HP));	  		
	  	end;	  	
	  	if Matcher[checks].Lvl ~= Z.Lvl then
	  		HpB = memory.readword(Character_Store+0x0C+party_index[checks]*56);	  	  				
	  		AtkB = memory.readbyte(Character_Store+0x12+party_index[checks]*56);	  		
	  		DefB = memory.readbyte(Character_Store+0x14+party_index[checks]*56);
	  		AgiB = memory.readbyte(Character_Store+0x16+party_index[checks]*56);
	  		MpB = memory.readbyte(Character_Store+0x10+party_index[checks]*56);
	  		if party_index[checks] == 7 and (AtkB - Matcher[checks].AtkB) == 3 then
	 			--outstr  = outstr .. 'Peter +3 ';
	  		elseif party_index[checks] == 0 and (AtkB - Matcher[checks].AtkB) == 2 then
	  		 	outstr  = outstr .. 'Bowie +2 ';
	  		elseif party_index[checks] == 5 and (AtkB - Matcher[checks].AtkB) == 2 then
	  			outstr  = outstr .. 'Slade +2 ';
	  		end;	  		  		
	  		Results[curord+1] = Results[curord+1] .. string.format(' %d LVL %dHp %dMp %dAk %dDf %dAg', party_index[checks], (HpB - Matcher[checks].HpB), (MpB - Matcher[checks].MpB), (AtkB - Matcher[checks].AtkB), (DefB - Matcher[checks].DefB),(AgiB - Matcher[checks].AgiB));	  		
	  	elseif Matcher[checks].AtkC ~= Z.Atk then	  	
	  		Results[curord+1] = Results[curord+1] .. string.format(' %d ATK+ %d', party_index[checks],Z.Atk -  Matcher[checks].AtkC );
	  	end;
	  	if Matcher[checks].Stat ~= Z.Stat then	  	  	
	  		Results[curord+1] = Results[curord+1] .. string.format(' %d (%d Stat)', party_index[checks], (Z.Stat));	  		
	  	end;
	end;
	for checks = 1,enemy_size,1 do		
	  	Z.HP = memory.readword(Enemy_Store+0xE+enemy_index[checks]*56);
	  	Z.Atk = memory.readword(Enemy_Store+0x13+enemy_index[checks]*56);
	  	Z.Stat = memory.readword(Enemy_Store+0x2C+enemy_index[checks]*56);
	  	if Matcher[checks+party_size].HP ~= Z.HP then	  
	  		if Z.HP == 0 then
	  			outstr  = outstr .. 'Kill ';
				Success[curord+1] = true;
		  	end;
	  		Results[curord+1] = Results[curord+1] .. string.format(' %d (%d HP)', enemy_index[checks]+1+party_size, (Z.HP - Matcher[checks+party_size].HP));	
	  		if (Z.HP - Matcher[checks+party_size].HP) < -200 then
	  			outstr  = outstr .. string.format(' %d (%d HP)', CurRNG, (Z.HP - Matcher[checks+party_size].HP));
			end;
	  	end;	
	  	if Matcher[checks+party_size].Stat ~= Z.Stat then	  
	  		Results[curord+1] = Results[curord+1] .. string.format(' %d (%d Stat)', party_index[checks], (Z.Stat));	  		
	  	end;  	
	end;	
	if string.len(outstr) ~= 0 then
		print(outstr)
	end;	
	FClist[curord+1] = movie.framecount() - startframecount;		
	end;
end;

GetOrders(StartPlace,BattleCheck-1);
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
 pagetype = true;
 lastmessage = "Commands: S - Show Attack, H - Hide, M- more, D - done";
 lastmessage2 = "";
 hidemode = false;
 
 while not done do	
  keys = input.get(); 
  	gens.frameadvance();    	
	if not hidemode then
	 	memory.writebyte(Lua_Hold,1);
		gui.drawbox(0,0,260,160,'black','black');	
		for i = 1,12,1 do		    	
		   	if i+CurStart == BattleCheck+1 then
		    		gui.text(7,10*(i-1)+1,'end');		 
		   	elseif i+CurStart <= BattleCheck then 
		   	    if pagetype then		   	    
		    		if AttackNum+1 == i+CurStart then
		    			gui.text(7,10*(i-1)+1,Results[i+CurStart],'red');		
		    		else
	    				gui.text(7,10*(i-1)+1,Results[i+CurStart]);		
	    			end;	    			
	    		else
	    			if AttackNum+1 == i+CurStart then
		    			gui.text(7,10*(i-1)+1, string.format('%d: RNG: %d, Length: %d frames, EXP: %d',i+CurStart-1, RNGList[i+CurStart], FClist[i+CurStart], EXPlist[i+CurStart]),'red');		
		    		else
	    				gui.text(7,10*(i-1)+1, string.format('%d: RNG: %d, Length: %d frames, EXP: %d',i+CurStart-1, RNGList[i+CurStart], FClist[i+CurStart], EXPlist[i+CurStart]));		
	    			end;
	    			
	    		end;	
	    		if Success[i+CurStart] then
	    			gui.drawbox(1,10*(i-1)+3,5,10*(i)-3,'red','red');
	    		end;
	        end;	    		
	 	end;
    	gui.text(1,130,lastmessage);
    	gui.text(1,140,lastmessage2);
    	if entermode then  
    		gui.text(5, 130, mode);  
    		for i = 1,pos,1 do
    			gui.text(5+i*7,140,entered[i])
			end;
			for i = pos+1,poses,1 do
				gui.text(5+i*7,140,'_');
			end;
		end;   	
   else
   		memory.writebyte(Lua_Hold,0);    	
   end;
	
	if press(nextk) then
		pagetype = not pagetype;
		end;
     
     if press(plus) then
        if AttackNum < BattleCheck-1 then 
          AttackNum = AttackNum+1;          
          RNGres = RNGList[AttackNum+1];   				   		
   		  lastmessage2 = Results[AttackNum+1];
   		  lastmessage = string.format('Selected: %d, RNG: %d, Length: %d frames, EXP: %d', AttackNum, RNGres, FClist[AttackNum+1], EXPlist[AttackNum+1]);
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
   		  lastmessage = string.format('Selected: %d, RNG: %d, Length: %d frames, EXP: %d', AttackNum, RNGres, FClist[AttackNum+1], EXPlist[AttackNum+1]);
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
   				RNGres = RNGList[AttackNum+1];   				   		
   				lastmessage2 = Results[AttackNum+1];
   				lastmessage = string.format('Selected: %d, RNG: %d, Length: %d frames, EXP: %d', AttackNum, RNGres, FClist[AttackNum+1], EXPlist[AttackNum+1]);
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





savestate.load(START);
for i = 1,AttackNum,1 do
	gens.frameadvance();
end;
joypad.set(1,{C=1});   	
gens.frameadvance();

Targeting = savestate.create();
while memory.readbyte(0xFFFECD) ~= 22 do 
	savestate.save(Targeting);	
	gens.frameadvance();
end;
savestate.load(Targeting);
joypad.set(1,{C=1});   	
gens.frameadvance();

while (memory.readbyte(0xFFDE7B) == 8) do 
	gens.frameadvance();
end;

while (memory.readbyte(0xFFDE7B) ~= 8) do 
	joypad.set(1,{C=1});   	
	gens.frameadvance();
end;
gens.pause();
   