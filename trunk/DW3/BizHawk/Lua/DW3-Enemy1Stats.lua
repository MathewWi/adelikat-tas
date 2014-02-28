p1Window = forms.newform(300, 600, "Enemy 1")

forms.label(p1Window, "HP:",     10, 20,  30, 19);
forms.label(p1Window, "MP:",     10, 40,  30, 19);
forms.label(p1Window, "Lv:",     10, 60, 30, 19);

e1HPLabel    = forms.label(p1Window, "0", 41, 20,  150, 19)
e1MPLabel    = forms.label(p1Window, "0", 41, 40,  150, 19)
e1LevelLabel = forms.label(p1Window, "0", 41, 60, 150, 19)

function UpdateVars()
	e1HP = mainmemory.read_u16_le(0x071C);
	e1MaxHP = mainmemory.read_u16_le(0x0724);
	e1MP = mainmemory.read_u16_le(0x072C); 
	e1MaxMP = mainmemory.read_u16_le(0x0734);
	e1Level = mainmemory.readbyte(0x0700);
end

function UpdateForm()
	forms.settext(e1HPLabel, e1HP .. "/" .. e1MaxHP);
	forms.settext(e1MPLabel, e1MP .. "/" .. e1MaxMP);
	forms.settext(e1LevelLabel, e1Level);
end

while true do
	UpdateVars();
	UpdateForm();
	emu.frameadvance();
end