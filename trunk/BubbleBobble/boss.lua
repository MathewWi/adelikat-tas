CHECK = savestate.create();
savestate.save(CHECK);
FCEU.speedmode('turbo');
P2start = memory.readbyte(0x0042)
while true do

local joy = {}
joy.B = 1

gui.text(10,10,"Botting")

x = math.random(0,1)
gui.text(10,40,x)


if (x == 1) then
joypad.set(2,joy)
end

BossHP = memory.readbyte(0x006F)
Frame = emu.framecount()
P2lives = memory.readbyte(0x0042)
if (BossHP == 0 and Frame < 88904) then
emu.pause()
end

if (Frame > 88904 or P2lives < P2start) then
savestate.load(CHECK);
end

emu.frameadvance()
end