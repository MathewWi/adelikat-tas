while true do

local function displayer()

mf = movie.framecount()
startframe = 21828
startx = 129
topspeed = 1

--lagflag = memory.readbyte(0x01C)

--if mf<200 then lag=0 end
--if lagflag==1 then lag=lag+1 end

wpncharge = memory.readbyte(0x0A8)

if wpncharge<40 then wpncharge1=""
elseif wpncharge<80 then wpncharge1=" Weak"
else wpncharge1=" Strong" end

scrxpix = memory.readbyte(0x0FD)
scrxbig = memory.readbyte(0x081)
xpix = memory.readbyte(0x53C)

scrypix = memory.readbyte(0x0FD)
scrybig = memory.readbyte(0x083)

ypix = memory.readbyte(0x51E)
ysub = memory.readbyte(0x0A1)

yspeed = memory.readbyte(0x06F)

scrysub = memory.readbyte(0x084)
scrypix = memory.readbyte(0x0FC)
scrybig = memory.readbyte(0x083)

nowx = 256*scrxbig + scrxpix + xpix
nowy = 8192*scrybig + 32*scrypix + 32*ypix + ysub/8  + scrysub/8

yspeed1 = 16*memory.readbyte(0x0B5) + memory.readbyte(0x0B8)/16

if yspeed1>3000 then yspeed=yspeed1-4096 else yspeed=yspeed1 end

score1 = memory.readbyte(0x31C)
score2 = memory.readbyte(0x31D)
score3 = memory.readbyte(0x31E)

score = 10000*score1 + 1000*score2 + 100*score3

texty = 10
lostx = startx + (mf-startframe)*topspeed - nowx

gui.text(10,texty,"Now X: " .. nowx)
gui.text(10,texty+8,"Lost X: " .. lostx)
gui.text(10,texty+24,"Now Y: " .. nowy)
gui.text(10,texty+32,"Y speed: " .. yspeed)
--gui.text(10,texty+32,"Lag: " .. lag)
gui.text(10,texty+40,"Wpn charge: " .. wpncharge .. wpncharge1)

gui.text(100,texty,"Coins: " .. memory.readbyte(0x05D))
gui.text(100,texty+8,"HP: " .. memory.readbyte(0x0AA))
gui.text(100,texty+16,"Boss HP 1: " .. memory.readbyte(0x5D8))
gui.text(100,texty+24,"Boss HP 2: " .. memory.readbyte(0x5DD))
gui.text(100,texty+32,"Boss inv: " .. memory.readbyte(0x6D4))
end

gui.register(displayer)
   FCEU.frameadvance()
end