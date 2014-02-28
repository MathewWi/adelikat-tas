local enemyTypes = { }

e1Window = forms.newform(280, 300, "E1")

forms.label(e1Window, "HP:",     10,  20, 30, 19);
forms.label(e1Window, "MP:",     110, 20, 30, 19);
forms.label(e1Window, "Ag:",     10,  40, 30, 19);
forms.label(e1Window, "Def:",    110, 40, 30, 19);

e1HPLabel      = forms.label(e1Window, "0", 41,  20, 50, 19)
e1MPLabel      = forms.label(e1Window, "0", 141, 20, 50, 19)
e1AgilityLabel = forms.label(e1Window, "0", 41,  40, 50, 19)
e1DefenseLabel = forms.label(e1Window, "0", 141, 40, 50, 19)

function Setup()
	enemyTypes[0x00] = "Slime";
	enemyTypes[0x01] = "Black Raven";
	enemyTypes[0x02] = "Horned Rabbit";
	enemyTypes[0x03] = "Giant Anteater";
	enemyTypes[0x04] = "Masked Moth";
	enemyTypes[0x05] = "Froggore";
	enemyTypes[0x06] = "Babble";
	enemyTypes[0x07] = "Magician";
	enemyTypes[0x08] = "Scorpion Wasp";
	enemyTypes[0x09] = "Healer";
	enemyTypes[0x0A] = "Demon Anteater";
	enemyTypes[0x0B] = "Spiked Hare";
	enemyTypes[0x0C] = "Poison Toad";
	enemyTypes[0x0D] = "Caterpillar";
	enemyTypes[0x0E] = "Humanabat";
	enemyTypes[0x0F] = "Putrepup";
	enemyTypes[0x10] = "Killer Bee";
	enemyTypes[0x11] = "Army Crab";
	enemyTypes[0x12] = "Gas Clouds";
	enemyTypes[0x13] = "Demon Toadstool";
	enemyTypes[0x14] = "Poison Silkworm";
	enemyTypes[0x15] = "Avenger Raven";
	enemyTypes[0x16] = "Madhound";
	enemyTypes[0x17] = "Deadly Toadstool";
	enemyTypes[0x18] = "Shadow";
	enemyTypes[0x19] = "Vampire";
	enemyTypes[0x1A] = "Man-Eater Moth";
	enemyTypes[0x1B] = "Rogue Knight";
	enemyTypes[0x1C] = "Vampire Cat";
	enemyTypes[0x1D] = "King Froggore";
	enemyTypes[0x1E] = "Wild Ape";
	enemyTypes[0x1F] = "Trick Bag";
	enemyTypes[0x20] = "Mummy Man";
	enemyTypes[0x21] = "Infernus Crab";
	enemyTypes[0x22] = "Lumpus";
	enemyTypes[0x23] = "Flamapede";
	enemyTypes[0x24] = "Mummy";
	enemyTypes[0x25] = "Mage Toadstool";
	enemyTypes[0x26] = "Hunter Fly";
	enemyTypes[0x27] = "Avenger Jackal";
	enemyTypes[0x28] = "Nev";
	enemyTypes[0x29] = "Heat Clouds";
	enemyTypes[0x2A] = "Tonguebear";
	enemyTypes[0x2B] = "Curer";
	enemyTypes[0x2C] = "Rammore";
	enemyTypes[0x2D] = "Catula";
	enemyTypes[0x2E] = "Evil Mage";
	enemyTypes[0x2F] = "Simiac";
	enemyTypes[0x30] = "Garuda";
	enemyTypes[0x31] = "Metal Slime";
	enemyTypes[0x32] = "Goategon";
	enemyTypes[0x33] = "Executioner";
	enemyTypes[0x34] = "Demonite";
	enemyTypes[0x35] = "Deranger";
	enemyTypes[0x36] = "Man-Eater Chest";
	enemyTypes[0x37] = "Eliminator";
	enemyTypes[0x38] = "Great Beak";
	enemyTypes[0x39] = "Slime Snaii";
	enemyTypes[0x3A] = "Sky Dragon";
	enemyTypes[0x3B] = "Barnabas";
	enemyTypes[0x3C] = "Witch";
	enemyTypes[0x3D] = "Avenger Beak";
	enemyTypes[0x3E] = "Infernus Knight";
	enemyTypes[0x3F] = "Marine Slime";
	enemyTypes[0x40] = "Man O' Wars";
	enemyTypes[0x41] = "Merzon";
	enemyTypes[0x42] = "King Squid";
	enemyTypes[0x43] = "Crabus";
	enemyTypes[0x44] = "Merzoncian";
	enemyTypes[0x45] = "Hades' Condor";
	enemyTypes[0x46] = "Fierce Bear";
	enemyTypes[0x47] = "Hork";
	enemyTypes[0x48] = "Bighorn";
	enemyTypes[0x49] = "Stingwing";
	enemyTypes[0x4A] = "Venom Zombies";
	enemyTypes[0x4B] = "Blue Beak";
	enemyTypes[0x4C] = "Lethal ARmor";
	enemyTypes[0x4D] = "Avenger";
	enemyTypes[0x4E] = "Lava Basher";
	enemyTypes[0x4F] = "Witch Doctors";
	enemyTypes[0x50] = "Old Hag";
	enemyTypes[0x51] = "Terror Shadow";
	enemyTypes[0x52] = "Glacier Basher";
	enemyTypes[0x53] = "Wyvern";
	enemyTypes[0x54] = "Kong";
	enemyTypes[0x55] = "Tortragon";
	enemyTypes[0x56] = "Elysium Bird";
	enemyTypes[0x57] = "Bomb Crag";
	enemyTypes[0x58] = "Grizzly";
	enemyTypes[0x59] = "Voodoo Shaman";
	enemyTypes[0x5A] = "King Tortragon";
	enemyTypes[0x5B] = "Snow Dragon";
	enemyTypes[0x5C] = "Troll";
	enemyTypes[0x5D] = "Frost Cloud";
	enemyTypes[0x5E] = "Dancing Jewel";
	enemyTypes[0x5F] = "Minidemon";
	enemyTypes[0x60] = "Tentacles";
	enemyTypes[0x61] = "Skeleton";
	enemyTypes[0x62] = "Mimic";
	enemyTypes[0x63] = "Marauder";
	enemyTypes[0x64] = "Hologhost";
	enemyTypes[0x65] = "Orochi";
	enemyTypes[0x66] = "Stone Hulk";
	enemyTypes[0x67] = "Salamander";
	enemyTypes[0x68] = "Red Slime";
	enemyTypes[0x69] = "Goopi";
	enemyTypes[0x6A] = "Vile Shadow";
	enemyTypes[0x6B] = "Voodoo Warlock";
	enemyTypes[0x6C] = "Metal Babble";
	enemyTypes[0x6D] = "Ghoul";
	enemyTypes[0x6E] = "Lionhead";
	enemyTypes[0x6F] = "Boss Troll";
	enemyTypes[0x70] = "Gold Basher";
	enemyTypes[0x71] = "Scalgon";
	enemyTypes[0x72] = "King Merzon";
	enemyTypes[0x73] = "Kragacles";
	enemyTypes[0x74] = "Darthbear";
	enemyTypes[0x75] = "Granite Titan";
	enemyTypes[0x76] = "Leona";
	enemyTypes[0x77] = "Archmage";
	enemyTypes[0x78] = "Magiwyvern";
	enemyTypes[0x79] = "Winged Demon";
	enemyTypes[0x7A] = "Hydra";
	enemyTypes[0x7B] = "Troll King";
	enemyTypes[0x7C] = "Green Dragon";
	enemyTypes[0x7D] = "Barog";
	enemyTypes[0x7E] = "Putregon";
	enemyTypes[0x7F] = "Lionroar";
	enemyTypes[0x80] = "Swordoid";
	enemyTypes[0x81] = "King Hydra";
	enemyTypes[0x82] = "Baramos Bomus";
	enemyTypes[0x83] = "Baramos Gonus";
	enemyTypes[0x84] = "Baramos";
	enemyTypes[0x85] = "Zoma";
	enemyTypes[0x86] = "Zoma Weakened";
	enemyTypes[0x87] = "Ortega";
	enemyTypes[0x88] = "Kandar";
	enemyTypes[0x89] = "Kandar II";
	enemyTypes[0x8A] = "Kandar Henchman";
end

Setup();

function UpdateVars()
	e1HP = mainmemory.read_u16_le(0x0500);
	e1MaxHP = 999;
	e1MP = mainmemory.readbyte(0x0510); 
	e1MaxMP = 999;
	e1Agility = mainmemory.readbyte(0x0518);
	e1Defense = mainmemory.readbyte(0x0520);
	e1Type = enemyTypes[mainmemory.readbyte(0x056D)];
end

function UpdateForm()
	forms.settext(e1Window, "E1: " .. e1Type)
	forms.settext(e1HPLabel, e1HP .. "/" .. e1MaxHP);
	forms.settext(e1MPLabel, e1MP .. "/" .. e1MaxMP);
	forms.settext(e1AgilityLabel, e1Agility);
	forms.settext(e1DefenseLabel, e1Defense);
end

while true do
	UpdateVars();
	UpdateForm();
	emu.frameadvance();
end