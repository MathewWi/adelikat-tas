-- Super Mario Bros. 2 (U) (PRG0) [!].nes


while (true) do

E1_x = memory.readbyte(0x002D)
E1_y = memory.readbyte(0x0037)
E2_x = memory.readbyte(0x002C)
E2_y = memory.readbyte(0x0036)

--Display enemy numbers
gui.text(E1_x,E1_y,"1")
gui.text(E2_x,E2_y,"2")


	FCEU.frameadvance();
end;