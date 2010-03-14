--SMB3 lua script
--Written by adelikat
--Used to identify and measure corner boost savings

local oldx = 0
local oldxsub = 0
local oldspeed = 0

local newx = 0
local newxsub = 0
local newspeed = 0

local predx = 0
local predxsub = 0

local totalboost = 0

local lastframe = 0
local currentframe = 0
while true do

lastframe = currentframe
currentframe = emu.framecount()

if (currentframe < lastframe) then	--Reset the boost counter if a state is loaded
totalboost = 0
end

x = input.get()
if (x.R) then			--Change R to whatever key you like for this hotkey
totalboost = 0
end

oldx = newx
oldxsub = newxsub
oldspeed = newspeed

newspeed = memory.readbyte(0x00BD)
if (newspeed > 128) then
newspeed = newspeed - 256
end

newx = memory.readbyte(0x0090)
newxsub = memory.readbyte(0x074D)

pos = "Position: (" .. string.format('%3d',newspeed) .. ") " .. string.format('%3d',newx) .. " " .. string.format('%2d',newxsub/16) .. "/16"

--Predict newx

predx = oldx + math.floor(((oldspeed*16 + oldxsub)/256))
predxsub = (oldxsub + (oldspeed*16))%256

if (oldspeed > 1 and newx-predx > 0) then
totalboost = totalboost + (newx - predx)
end

gui.text(1,1,"Total boost: " .. totalboost)
gui.text(124,1,"Predict:       " .. string.format('%d',predx) .. " " .. string.format('%2d', predxsub/16) .. "/16" )
gui.text(126,13,pos)

emu.frameadvance()
end