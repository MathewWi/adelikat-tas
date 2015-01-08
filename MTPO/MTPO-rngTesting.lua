hitCounter = 0;
hitColor = "White";
frameCount = 0;
oddsColor = "White";
hOddsColor = "White";
highHitCounter = 0;

while true do
	frameCount = frameCount + 1;
	rng = mainmemory.readbyte(0x0018);
	nibble = bit.band(rng, 0x0F);

	hNibble = bit.rshift(rng, 4);

	if (nibble == 1 or nibble == 3 or nibble == 6 or nibble == 9 or nibble == 0x0B or nibble == 0x0E) then
		hitCounter = hitCounter + 1;
		hitColor = "Red";
	else
		hitColor = "White";
	end

	odds = hitCounter / frameCount;
	if (odds > 0.40625) then
		oddsColor = "Green"
	elseif (odds > 0.34375) then
		oddsColor = "Yellow";
	else
		oddsColor = "Red";
	end

	if (hNibble == 0x8) then
		highHitCounter = highHitCounter + 1
		hitColor = "Red";
	else
		hitColor = "White";
	end

	

	hOdds = highHitCounter/ frameCount
	if (hOdds > 0.09375) then
		hOddsColor = "Green"
	elseif (hOdds > 0.03125) then
		hOddsColor = "Yellow";
	else
		hOddsColor = "Red";
	end

	gui.text(1, 1, "Nibble: " .. string.format("%x", nibble), nil, nil, 3)
	gui.text(1, 14, "Hits: " .. hitCounter, nil, hitColor, 3);
	gui.text(1, 28, "(target: 0.375) %: " .. string.format("%.3f", odds), nil, oddsColor, 3)

	gui.text(1, 1, "HNibble: " .. string.format("%x", hNibble), nil, "White", 2)
	gui.text(1, 14, "Hits: " .. highHitCounter, nil, hitColor, 2)
	gui.text(1, 28, "%: " .. string.format("%.4f", hOdds) .. " (target: 0.0625)", nil, hOddsColor, 2)

	emu.frameadvance();
end