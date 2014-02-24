local lookup = { }
local classLookup = { }

function Setup()
	lookup[0x0]  = "Cypress Stick";
	lookup[0x01] = "Club";
	lookup[0x02] = "Copper Sword";
	lookup[0x03] = "Magic Knife";
	lookup[0x04] = "Iron Spear";
	lookup[0x05] = "Battle Axe";
	lookup[0x06] = "Broad Sword";
	lookup[0x07] = "Wizard's Wand";
	lookup[0x08] = "Poison Needle";
	lookup[0x09] = "Iron Claw";
	lookup[0x0A] = "Thorn Whip";
	lookup[0x0B] = "Giant Shears";
	lookup[0x0C] = "Chain Sickle";
	lookup[0x0D] = "Thor's Sword";
	lookup[0x0E] = "Snowblast Sword";
	lookup[0x0F] = "Demon Axe";
	lookup[0x10] = "Staff of Rain";
	lookup[0x11] = "Sword of Gaia";
	lookup[0x12] = "Staff of Reflection";
	lookup[0x13] = "Sword of Destruction";
	lookup[0x14] = "Multi-Edge Sword";
	lookup[0x15] = "Staff of Force";
	lookup[0x16] = "Sword of Illusion";
	lookup[0x17] = "Zombie Slasher";
	lookup[0x18] = "Falcon Sword";
	lookup[0x19] = "Sledge Hammer";
	lookup[0x1A] = "Thunder Sword";
	lookup[0x1B] = "Staff of Thunder";
	lookup[0x1C] = "Sword of Kings";
	lookup[0x1D] = "Orochi Sword";
	lookup[0x1E] = "Dragon Killer";
	lookup[0x1F] = "Staff of Judgement";
	lookup[0x20] = "Clothes";
	lookup[0x21] = "Training Suit";
	lookup[0x22] = "Leather Armor";
	lookup[0x23] = "Flashy Clothes";
	lookup[0x24] = "Half Plate Armor";
	lookup[0x25] = "Full Plate Armor";
	lookup[0x26] = "Magic Armor";
	lookup[0x27] = "Cloak of Evasion";
	lookup[0x28] = "Armor of Radiance";
	lookup[0x29] = "Iron Apron";
	lookup[0x2A] = "Animal Suit";
	lookup[0x2B] = "Fighting Suit";
	lookup[0x2C] = "Sacred Robe";
	lookup[0x2D] = "Armor of Hades";
	lookup[0x2E] = "Water Flying Cloth";
	lookup[0x2F] = "Chain Mail";
	lookup[0x30] = "Wayfarer's Clothes";
	lookup[0x31] = "Revealing Swimsuit";
	lookup[0x32] = "Magic Bikini";
	lookup[0x33] = "Shell Armor";
	lookup[0x34] = "Armor of Terrafirma";
	lookup[0x35] = "Dragon Mail";
	lookup[0x36] = "Swordedge Armor";
	lookup[0x37] = "Angel's Robe";
	lookup[0x38] = " Leather Shield";
	lookup[0x39] = "Iron Shield";
	lookup[0x3A] = "Shield of Strength";
	lookup[0x3B] = "Shield of Heroes";
	lookup[0x3C] = "Shield of Sorrow";
	lookup[0x3D] = "Bronze Shield";
	lookup[0x3E] = "Silver Shield";
	lookup[0x3F] = "Golden Crown";
	lookup[0x40] = "Iron Helmet";
	lookup[0x41] = "Mysterious Hat";
	lookup[0x42] = "Unlucky Helmet";
	lookup[0x43] = "Turban";
	lookup[0x44] = "Noh Mask";
	lookup[0x45] = "Leather Helmet";
	lookup[0x46] = "Iron Mask";
	lookup[0x45] = "Sacred Amulet";
	lookup[0x48] = "Ring of Life";
	lookup[0x49] = "Shoes of Happiness";
	lookup[0x4A] = "Golden Claw";
	lookup[0x4B] = "Meteorite Armband";
	lookup[0x4C] = "Book of Satori";
	lookup[0x4D] = "(blank)";
	lookup[0x4E] = "Wizard's Ring";
	lookup[0x4F] = "Black Pepper";
	lookup[0x50] = "Sage's Stone";
	lookup[0x51] = "Mirror of Ra";
	lookup[0x52] = "Vase of Drought";
	lookup[0x53] = "Lamp of Darkness";
	lookup[0x54] = "Staff of Change";
	lookup[0x55] = "Stone of Light";
	lookup[0x56] = "Invisibility Herb";
	lookup[0x57] = "Magic Ball";
	lookup[0x58] = "Thief's Key";
	lookup[0x59] = "Magic Key";
	lookup[0x5A] = "Final Key";
	lookup[0x5B] = "Dream Ruby";
	lookup[0x5C] = "Wake Up Powder";
	lookup[0x5D] = "Royal Scroll";
	lookup[0x5E] = "Oricon";
	lookup[0x5F] = "Strength Seed";
	lookup[0x60] = "Agility Seed";
	lookup[0x61] = "Vitality Seed";
	lookup[0x62] = "Luck Seed";
	lookup[0x63] = "Intelligence Seed";
	lookup[0x64] = "Acorns of Life";
	lookup[0x65] = "Medical Herb";
	lookup[0x66] = "Antidote Herb";
	lookup[0x67] = "Fairy Water";
	lookup[0x68] = "Wing of Wyvern";
	lookup[0x69] = "Leaf of World Tree";
	lookup[0x6A] = "(blank)";
	lookup[0x6B] = "Locket of Love";
	lookup[0x6C] = "Full Moon Herb";
	lookup[0x6D] = "Water Blaster";
	lookup[0x6E] = "Sailor's Thigh Bone";
	lookup[0x6F] = "Echoing Flute";
	lookup[0x70] = "Fairy Flute";
	lookup[0x71] = "Silver Harp";
	lookup[0x72] = "Sphere of Light";
	lookup[0x73] = "Poison Moth Powder";
	lookup[0x74] = "Spider's Web";
	lookup[0x75] = "Stones of Sunlight";
	lookup[0x76] = "Rainbow Drop";
	lookup[0x77] = "Silver Orb";
	lookup[0x78] = "Red Orb";
	lookup[0x79] = "Yellow Orb";
	lookup[0x7A] = "Purple Orb";
	lookup[0x7B] = "Blue Orb";
	lookup[0x7C] = "Green Orb";
	lookup[0x7D] = "Stick Slime";
	lookup[0x7E] = "Black Raven";
	lookup[0x7F] = "Sword Horned";
	lookup[0x80] = "eCypress Stick";
	lookup[0x81] = "eClub";
	lookup[0x82] = "eCopper Sword";
	lookup[0x83] = "eMagic Knife";
	lookup[0x84] = "eIron Spear";
	lookup[0x85] = "eBattle Axe";
	lookup[0x86] = "eBroad Sword";
	lookup[0x87] = "eWizard's Wand";
	lookup[0x88] = "ePoison Needle";
	lookup[0x89] = "eIron Claw";
	lookup[0x8A] = "eThorn Whip";
	lookup[0x8B] = "eGiant Shears";
	lookup[0x8C] = "eChain Sickle";
	lookup[0x8D] = "eThor's Sword";
	lookup[0x8E] = "eSnowblast Sword";
	lookup[0x8F] = "eDemon Axe";
	lookup[0x90] = "eStaff of Rain";
	lookup[0x91] = "eSword of Gaia";
	lookup[0x92] = "eStaff of Reflection";
	lookup[0x93] = "eSword of Destruction";
	lookup[0x94] = "eMulti-Edge Sword";
	lookup[0x95] = "eStaff of Force";
	lookup[0x96] = "eSword of Illusion";
	lookup[0x97] = "eZombie Slasher";
	lookup[0x98] = "eFalcon Sword";
	lookup[0x99] = "eSledge Hammer";
	lookup[0x9A] = "eThunder Sword";
	lookup[0x9B] = "eStaff of Thunder";
	lookup[0x9C] = "eSword of Kings";
	lookup[0x9D] = "eOrochi Sword";
	lookup[0x9E] = "eDragon Killer";
	lookup[0x9F] = "eStaff of Judgement";
	lookup[0xA0] = "eClothes";
	lookup[0xA1] = "eTraining Suit";
	lookup[0xA2] = "eLeather Armor";
	lookup[0xA3] = "eFlashy Clothes";
	lookup[0xA4] = "eHalf Plate Armor";
	lookup[0xA5] = "eFull Plate Armor";
	lookup[0xA6] = "eMagic Armor";
	lookup[0xA7] = "eCloak of Evasion";
	lookup[0xA8] = "eArmor of Radiance";
	lookup[0xA9] = "eIron Apron";
	lookup[0xAA] = "eAnimal Suit";
	lookup[0xAB] = "eFighting Suit";
	lookup[0xAC] = "eSacred Robe";
	lookup[0xAD] = "eArmor of Hades";
	lookup[0xAE] = "eWater Flying Cloth";
	lookup[0xAF] = "eChain Mail";
	lookup[0xB0] = "eWayfarer's Clothes";
	lookup[0xB1] = "eRevealing Swimsuit";
	lookup[0xB2] = "eMagic Bikini";
	lookup[0xB3] = "eShell Armor";
	lookup[0xB4] = "eArmor of Terrafirma";
	lookup[0xB5] = "eDragon Mail";
	lookup[0xB6] = "eSwordedge Armor";
	lookup[0xB7] = "eAngel's Robe";
	lookup[0xB8] = "e Leather Shield";
	lookup[0xB9] = "eIron Shield";
	lookup[0xBA] = "eShield of Strength";
	lookup[0xBB] = "eShield of Heroes";
	lookup[0xBC] = "eShield of Sorrow";
	lookup[0xBD] = "eBronze Shield";
	lookup[0xBE] = "eSilver Shield";
	lookup[0xBF] = "eGolden Crown";
	lookup[0xC0] = "eIron Helmet";
	lookup[0xC1] = "eMysterious Hat";
	lookup[0xC2] = "eUnlucky Helmet";
	lookup[0xC3] = "eTurban";
	lookup[0xC4] = "eNoh Mask";
	lookup[0xC5] = "eLeather Helmet";
	lookup[0xC6] = "eIron Mask";
	lookup[0xC7] = "eSacred Amulet";
	lookup[0xC8] = "eRing of Life";
	lookup[0xC9] = "eShoes of Happiness";
	lookup[0xCA] = "eGolden Claw";
	lookup[0xCB] = "eMeteorite Armband";
	lookup[0xCC] = "eBook of Satori";
	lookup[0xCD] = "e(blank)";
	lookup[0xCE] = "eWizard's Ring";
	lookup[0xCF] = "eBlack Pepper";
	lookup[0xD0] = "eSage's Stone";
	lookup[0xD1] = "eMirror of Ra";
	lookup[0xD2] = "eVase of Drought";
	lookup[0xD3] = "eLamp of Darkness";
	lookup[0xD4] = "eStaff of Change";
	lookup[0xD5] = "eStone of Light";
	lookup[0xD6] = "eInvisibility Herb";
	lookup[0xD7] = "eMagic Ball";
	lookup[0xD8] = "eThief's Key";
	lookup[0xD9] = "eMagic Key";
	lookup[0xDA] = "eFinal Key";
	lookup[0xDB] = "eDream Ruby";
	lookup[0xDC] = "eWake Up Powder";
	lookup[0xDD] = "eRoyal Scroll";
	lookup[0xDE] = "eOricon";
	lookup[0xDF] = "eStrength Seed";
	lookup[0xE0] = "eAgility Seed";
	lookup[0xE1] = "eVitality Seed";
	lookup[0xE2] = "eLuck Seed";
	lookup[0xE3] = "eIntelligence Seed";
	lookup[0xE4] = "eAcorns of Life";
	lookup[0xE5] = "eMedical Herb";
	lookup[0xE6] = "eAntidote Herb";
	lookup[0xE7] = "eFairy Water";
	lookup[0xE8] = "eWing of Wyvern";
	lookup[0xE9] = "eLeaf of World Tree";
	lookup[0xEA] = "e(blank)";
	lookup[0xEB] = "eLocket of Love";
	lookup[0xEC] = "eFull Moon Herb";
	lookup[0xED] = "eWater Blaster";
	lookup[0xEE] = "eSailor's Thigh Bone";
	lookup[0xEF] = "eEchoing Flute";
	lookup[0xF0] = "eFairy Flute";
	lookup[0xF1] = "eSilver Harp";
	lookup[0xF2] = "eSphere of Light";
	lookup[0xF3] = "ePoison Moth Powder";
	lookup[0xF4] = "eSpider's Web";
	lookup[0xF5] = "eStones of Sunlight";
	lookup[0xF6] = "eRainbow Drop";
	lookup[0xF7] = "eSilver Orb";
	lookup[0xF8] = "eRed Orb";
	lookup[0xF9] = "eYellow Orb";
	lookup[0xFA] = "ePurple Orb";
	lookup[0xFB] = "eBlue Orb";
	lookup[0xFC] = "eGreen Orb";
	lookup[0xFD] = "eStick Slime";
	lookup[0xFE] = "eBlack Raven";
	lookup[0xFF] = "(empty)";

	classLookup[0x00] = "Hero, Male";
	classLookup[0x01] = "Wizard, Male";
	classLookup[0x02] = "Pilgrim, Male";
	classLookup[0x03] = "Sage, Male";
	classLookup[0x04] = "Soldier, Male";
	classLookup[0x05] = "Merchant, Male";
	classLookup[0x06] = "Fighter, Male";
	classLookup[0x07] = "Goof-off, Male";
	classLookup[0x08] = "Hero, Female";
	classLookup[0x09] = "Wizard, Female";
	classLookup[0x0A] = "Pilgrim, Female";
	classLookup[0x0B] = "Sage, Female";
	classLookup[0x0C] = "Soldier, Female";
	classLookup[0x0D] = "Merchant, Female";
	classLookup[0x0E] = "Fighter, Female";
	classLookup[0x0F] = "Goof-off, Female";
end

Setup();

p1Window = forms.newform(300, 600, "Character 1")

forms.label(p1Window, "HP:",     10, 20,  30, 19);
forms.label(p1Window, "MP:",     10, 40,  30, 19);
forms.label(p1Window, "XP:",     10, 60,  30, 19);
forms.label(p1Window, "Gold:",   10, 80,  33, 19);
forms.label(p1Window, "Lv:",     10, 100, 30, 19);

p1HPLabel    = forms.label(p1Window, "0", 41, 20,  150, 19)
p1MPLabel    = forms.label(p1Window, "0", 41, 40,  150, 19)
p1XPLabel    = forms.label(p1Window, "0", 41, 60,  150, 19)
p1GoldLabel  = forms.label(p1Window, "0", 41, 80,  150, 19)
p1LevelLabel = forms.label(p1Window, "0", 41, 100, 150, 19)

forms.label(p1Window, "Inventory", 10, 200, 100, 19)
forms.label(p1Window, "Slot 1:", 20, 220, 50, 19)
forms.label(p1Window, "Slot 2:", 20, 240, 50, 19)
forms.label(p1Window, "Slot 3:", 20, 260, 50, 19)
forms.label(p1Window, "Slot 4:", 20, 280, 50, 19)
forms.label(p1Window, "Slot 5:", 20, 300, 50, 19)
forms.label(p1Window, "Slot 6:", 20, 320, 50, 19)
forms.label(p1Window, "Slot 7:", 20, 340, 50, 19)
forms.label(p1Window, "Slot 8:", 20, 360, 50, 19)

p1Slot1Label = forms.label(p1Window, "xxx", 70, 220, 150, 19)
p1Slot2Label = forms.label(p1Window, "xxx", 70, 240, 150, 19)
p1Slot3Label = forms.label(p1Window, "xxx", 70, 260, 150, 19)
p1Slot4Label = forms.label(p1Window, "xxx", 70, 280, 150, 19)
p1Slot5Label = forms.label(p1Window, "xxx", 70, 300, 150, 19)
p1Slot6Label = forms.label(p1Window, "xxx", 70, 320, 150, 19)
p1Slot7Label = forms.label(p1Window, "xxx", 70, 340, 150, 19)
p1Slot8Label = forms.label(p1Window, "xxx", 70, 360, 150, 19)

function UpdateVars()
	p1Slot1 = lookup[mainmemory.readbyte(0x077C)]; 
	p1Slot2 = lookup[mainmemory.readbyte(0x077D)]; 
	p1Slot3 = lookup[mainmemory.readbyte(0x077E)]; 
	p1Slot4 = lookup[mainmemory.readbyte(0x077F)]; 

	p1Slot5 = lookup[mainmemory.readbyte(0x0780)]; 
	p1Slot6 = lookup[mainmemory.readbyte(0x0781)]; 
	p1Slot7 = lookup[mainmemory.readbyte(0x0782)]; 
	p1Slot8 = lookup[mainmemory.readbyte(0x0783)];

	p1HP = mainmemory.read_u16_le(0x071C);
	p1MaxHP = mainmemory.read_u16_le(0x0724);
	p1MP = mainmemory.read_u16_le(0x072C); 
	p1MaxMP = mainmemory.read_u16_le(0x0734);
	p1XP = mainmemory.read_u24_le(0x0744);
	p1Class = classLookup[mainmemory.readbyte(0x0718)];
	p1Level = mainmemory.readbyte(0x0700);

	gold = mainmemory.read_u24_le(0x07BC);
end

function UpdateForm()
	forms.settext(p1Window, "P1 - " .. p1Class)
	forms.settext(p1HPLabel, p1HP .. "/" .. p1MaxHP);
	forms.settext(p1MPLabel, p1MP .. "/" .. p1MaxMP);
	forms.settext(p1XPLabel, p1XP);
	forms.settext(p1GoldLabel, gold);
	forms.settext(p1LevelLabel, p1Level);

	forms.settext(p1Slot1Label, p1Slot1);
	forms.settext(p1Slot2Label, p1Slot2);
	forms.settext(p1Slot3Label, p1Slot3);
	forms.settext(p1Slot4Label, p1Slot4);
	forms.settext(p1Slot5Label, p1Slot5);
	forms.settext(p1Slot6Label, p1Slot6);
	forms.settext(p1Slot7Label, p1Slot7);
	forms.settext(p1Slot8Label, p1Slot8);
end

while true do
	UpdateVars();
	UpdateForm();
	emu.frameadvance();
end