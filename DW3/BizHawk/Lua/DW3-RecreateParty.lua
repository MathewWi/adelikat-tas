--Note: a 4 party character must already be created and assembled

--Gold
mainmemory.write_u24_le(0x07BC, 99999)

--Upgrade Hero
mainmemory.write_u24_le(0x0744, 9999999); --XP
mainmemory.writebyte(0x0700, 99); --Level
mainmemory.write_u16_le(0x071C, 999); --HP
mainmemory.write_u16_le(0x0724, 999); --Max HP
mainmemory.write_u16_le(0x072C, 999); --MP
mainmemory.write_u16_le(0x0734, 999); --Max MP
mainmemory.writebyte(0x0704, 255); --Strength
mainmemory.writebyte(0x0708, 255); --Agility

mainmemory.writebyte(0x070C, 255); --Intelligence
mainmemory.writebyte(0x0710, 255); --Luck
mainmemory.writebyte(0x0714, 255); --Vitality

mainmemory.write_u32_le(0x079C, 0xFFFFFFFF); --Get all spells
mainmemory.write_u24_le(0x0750, 0xFFFFFF); --Fill Return List

--Hero Inventory
mainmemory.writebyte(0x077C, 0x9C); --Sword of Kings
mainmemory.writebyte(0x077D, 0xA8); --Armor of Radiance
mainmemory.writebyte(0x077E, 0xBB); --Shield of Heroes
mainmemory.writebyte(0x077F, 0xC6); --Iron Mask
mainmemory.writebyte(0x0780, 0xC7); --Sacred Amulet
mainmemory.writebyte(0x0781, 0x72); --Sphere of Light
mainmemory.writebyte(0x0782, 0x76); --Rainbow Drop


--Turn Player 2 into Fighter Male with All Magic
mainmemory.writebyte(0x0719, 06); --Fighter Male
mainmemory.write_u24_le(0x0747, 9999999); --XP
mainmemory.writebyte(0x0701, 99); --Level
mainmemory.write_u16_le(0x071E, 999); --HP
mainmemory.write_u16_le(0x0726, 999); --Max HP
mainmemory.write_u16_le(0x072E, 999); --MP
mainmemory.write_u16_le(0x0736, 999); --Max MP
mainmemory.writebyte(0x0705, 255); --Strength
mainmemory.writebyte(0x0709, 255); --Agility

mainmemory.writebyte(0x070D, 255); --Intelligence
mainmemory.writebyte(0x0711, 255); --Luck
mainmemory.writebyte(0x0715, 255); --Vitality

mainmemory.write_u32_le(0x07A4, 0xFFFFFFFF); --Get all Wizard spells
mainmemory.write_u32_le(0x07A8, 0xFFFFFFFF); --Get all Pilgram spells
mainmemory.write_u24_le(0x0753, 0xFFFFFF); --Fill Return List

--Player 2 Inventory
mainmemory.writebyte(0x0784, 0x89); --Iron Claw
mainmemory.writebyte(0x0785, 0xA7); --Cloak of Evasion
mainmemory.writebyte(0x0786, 0xC8); --Ring of Life
mainmemory.writebyte(0x0787, 0x50); --Sage's Stone
mainmemory.writebyte(0x0788, 0x4F); --Black Pepper
mainmemory.writebyte(0x0789, 0x77); --1 Silver Orb
mainmemory.writebyte(0x078A, 0x78); --2 Red Orb
mainmemory.writebyte(0x078B, 0x79); --3 Yellow Orb

--Turn Player 3 into Fighter Male with All Magic
mainmemory.writebyte(0x071A, 06); --Fighter Male
mainmemory.write_u24_le(0x074A, 9999999); --XP
mainmemory.writebyte(0x0702, 99); --Level
mainmemory.write_u16_le(0x0720, 999); --HP
mainmemory.write_u16_le(0x0728, 999); --Max HP
mainmemory.write_u16_le(0x0730, 999); --MP
mainmemory.write_u16_le(0x0738, 999); --Max MP
mainmemory.writebyte(0x0706, 255); --Strength
mainmemory.writebyte(0x070A, 255); --Agility

mainmemory.writebyte(0x070E, 255); --Intelligence
mainmemory.writebyte(0x0712, 255); --Luck
mainmemory.writebyte(0x0716, 255); --Vitality

mainmemory.write_u32_le(0x07B0, 0xFFFFFFFF); --Get all Wizard spells
mainmemory.write_u32_le(0x07AC, 0xFFFFFFFF); --Get all Pilgram spells
mainmemory.write_u24_le(0x0756, 0xFFFFFF); --Fill Return List

--Player 3 Inventory
mainmemory.writebyte(0x078C, 0x89); --Iron Claw
mainmemory.writebyte(0x078D, 0xA7); --Cloak of Evasion
mainmemory.writebyte(0x078E, 0xC8); --Ring of Life
mainmemory.writebyte(0x078F, 0x50); --Sage's Stone
mainmemory.writebyte(0x0790, 0x7A); --4 Purple Orb
mainmemory.writebyte(0x0791, 0x7B); --5 Blue Orb
mainmemory.writebyte(0x0792, 0x7C); --6 Green Orb



--Turn PLayer 4 into Fighter Male with All Magic
mainmemory.writebyte(0x071B, 06); --Fighter Male
mainmemory.write_u24_le(0x074D, 9999999); --XP
mainmemory.writebyte(0x0703, 99); --Level
mainmemory.write_u16_le(0x0722, 999); --HP
mainmemory.write_u16_le(0x072A, 999); --Max HP
mainmemory.write_u16_le(0x0732, 999); --MP
mainmemory.write_u16_le(0x073A, 999); --Max MP
mainmemory.writebyte(0x0707, 255); --Strength
mainmemory.writebyte(0x070B, 255); --Agility

mainmemory.writebyte(0x070F, 255); --Intelligence
mainmemory.writebyte(0x0713, 255); --Luck
mainmemory.writebyte(0x0717, 255); --Vitality

mainmemory.write_u32_le(0x07B8, 0xFFFFFFFF); --Get all spells
mainmemory.write_u32_le(0x07B4, 0xFFFFFFFF); --Get all spells
mainmemory.write_u24_le(0x0759, 0xFFFFFF); --Fill Return List

--Player 4 Inventory
mainmemory.writebyte(0x0794, 0x89); --Iron Claw
mainmemory.writebyte(0x0795, 0xA7); --Cloak of Evasion
mainmemory.writebyte(0x0796, 0xC8); --Ring of Life
mainmemory.writebyte(0x0797, 0x50); --Sage's Stone

--TODO
--Ship Flag
--Phoenix Flag
