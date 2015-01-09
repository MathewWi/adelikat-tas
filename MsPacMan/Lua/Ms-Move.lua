function DoButton(button)
	client.unpause();
	for i=1,7 do
		joypad.set({ button, true });
		emu.frameadvance();
	end
	client.pause();
end

function UpButton()
	DoButton("P1 Up");
end

function DownButton()
	DoButton("P1 Down");
end

function LeftButton()
	DoButton("P1 Left");
end

function RightButton()
	DoButton("P1 Right");
end


while true do
	pressed = joypad.get();
	if (pressed["P1 Up"]) then
		UpButton();
	elseif (pressed["P1 Down"]) then
		DownButton();
	elseif (pressed["P1 Left"]) then
		LeftButton();
	elseif (pressed["P1 Right"]) then
		RightButton();
	end

	emu.frameadvance();
end
