game=4

poslist = {[0] = 0x06D, 0x091, 0x0CB, 0x083}

steps=0

while true do

input = memory.readbyte(0x008)
if game<=3 then levelover1=0x007 else levelover1=(0x017) end
levelover = memory.readbyte(levelover1)

xpos = memory.readbyte(poslist[game-1])
ypos = memory.readbyte(poslist[game-1]+2)

if game<=3 then bonus=5 else bonus=-3 end

direction = memory.readbyte(poslist[game-1]+bonus)

if game<=3 then dirval1=2 dirval2=3 else dirval1=3 dirval2=2 end

if direction==dirval1 or direction==1 then changeval=1 end
if direction==0 or direction==dirval2 then changeval=7 end

movement = math.mod(xpos+ypos,8)

if levelover>0 or (game<=3 and AND(input,16)==16) then steps=0 end
if movement==changeval then steps=steps+0.5 end

if math.mod(steps,1)==0 then c1=".0" else c1="" end

gui.text(10,10,"Steps: " .. steps .. c1)

   FCEU.frameadvance()
end