DeckGets = 600;
DeckFile =  io.open("C:\\Sol_Decks.txt", "w");
key1 = {};
key2 = {};
key3 = {};
key1['A'] = true;
key2['left'] = true;
key3['start'] = true;
CHECK = savestate.create();
FCEU.speedmode('turbo');
savestate.save(CHECK);
---------------------
--Receives a card ID and returns a string output in the form of 2s (2 of Spades)
function GetCardStr(card)

num = (card % 13) + 1

if (num == 1) then
numstr = "A"
elseif (num < 10) then
numstr = "" .. num
elseif (num == 10) then
numstr = "0";
elseif (num == 11) then
numstr = "J"
elseif (num == 12) then
numstr = "Q"
elseif (num == 13) then
numstr = "K"
end

suit = ""

if (card <= 12) then
suit = "s"
elseif(card <= 25) then
suit = "h"
elseif(card <= 38) then
suit = "c"
elseif(card <= 51) then 
suit = "d"
else
return "  "
end

return numstr..suit

end
PILES = 0x3A2;


for Deck = 0,DeckGets,1 do
	DeckFile:write(string.format('DECK %d\n',Deck));
	savestate.load(CHECK);
	for n = 1,Deck,1 do
		FCEU.frameadvance();
	end;
		joypad.set(1,key3);
for i = 1,100,1 do
	FCEU.frameadvance();
end;
lastcards = {};

for i = 1,7,1 do
	lastcards[i] = 255;
end;

for i = 1,7,1 do
	while memory.readbyte(PILES+6) == lastcards[7] do
		FCEU.frameadvance();
	end;
	outstr = "";
	for j = 1,7,1 do 
		if lastcards[j] == memory.readbyte(PILES+j-1) then
			outstr = outstr .. "   ";
		else
			outstr = outstr .. GetCardStr(memory.readbyte(PILES+j-1)) .. " ";
		end;	
		lastcards[j] = memory.readbyte(PILES+j-1);
	end;	
	print(outstr);
	outstr = outstr .. string.format('\n');
	DeckFile:write(outstr);  
end;
DeckFile:write(string.format('\n'));
for n = 1,100,1 do
	FCEU.frameadvance();
end;

for i = 1,2,1 do
	outstr = "";
	for j = 1,12,1 do
		joypad.set(1,key1);
		FCEU.frameadvance();
		FCEU.frameadvance();
		FCEU.frameadvance();
		FCEU.frameadvance();
		FCEU.frameadvance();
		FCEU.frameadvance();
		FCEU.frameadvance();
		FCEU.frameadvance();
		FCEU.frameadvance();
		FCEU.frameadvance();
		joypad.set(1,key2);
		FCEU.frameadvance();
		FCEU.frameadvance();
		FCEU.frameadvance();
		FCEU.frameadvance();
		FCEU.frameadvance();
		FCEU.frameadvance();
		FCEU.frameadvance();
		FCEU.frameadvance();
		FCEU.frameadvance();
		outstr = outstr .. GetCardStr(memory.readbyte(0x039D)) .. " ";		
	end;
	print(outstr);
	outstr = outstr .. string.format('\n');
	DeckFile:write(outstr); 
	
end;
	DeckFile:write(string.format('\n'));
	DeckFile:write(string.format('\n'));
	DeckFile:write(string.format('\n'));
end;

		