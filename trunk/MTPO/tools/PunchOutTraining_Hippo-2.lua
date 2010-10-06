-- For Mike Tyson's Punch Out!! when fighting King Hippo
-- Intended to help time hits in real time.
--FatRatKnight

local AutoCheat= true

local CLOCK= 0x0306 -- Game clock
local HEART= 0x0324 -- Mac's low digit for his heart counter.
local ETMR=  0x0039 -- Enemy timer address
local EHP=   0x0398 -- Enemy HP address
local HRT=   0x0325 -- Mac's Heart's been dropped indicator
local RN=    0x0018 -- Some sort of random number stuff?
local ACT=   0x0090 -- Something to do with Hippo's thoughts.

local TMR=120      -- For the silly line.
local UPP= 30      -- Frames prior to the golden zone to display.
local BND= -8      -- KEEP NEGATIVE!! Frames after the golden zone.
local OFFSET= 13   -- Timing frames after Hippo decides his punch.

local DISPx= 180
local DISPy= 180
local DISPx2= DISPx+11 -- Right side of box. Adjust that plus to your need
local Dsp= {line= true, bar= true, stealth= 0, stick= 45}

local deviation= 0
local accuracy= 0
local perfect= 0
local earlies= 0
local lates= 0
local accearly= 0
local acclate= 0

local LastHit
local HitTiming

local DEBUG_Status= "nil"

local keys= input.get()
local lastkeys= keys
--*****************************************************************************
function UpdateKeys()  lastkeys= keys; keys= input.get()  end
function Press(btn)  return (keys[btn] and not lastkeys[btn])  end
function NULLFn() end
--*****************************************************************************

--*****************************************************************************
local function ForceRNToBehave(addr)
--*****************************************************************************
    if memory.readbyte(addr) ~= 9 then
        memory.writebyte(addr,9)
    end
end

if AutoCheat then
    memory.registerwrite(RN,ForceRNToBehave)
end

local Pad, LastPad= {}, {}
--*****************************************************************************
local function AB()
--*****************************************************************************
    LastPad= Pad
    Pad= joypad.get(1)
    return ( (Pad.A and LastPad.A) or (Pad.B and LastPad.B) )
end


local timer= 0
--*****************************************************************************
local function IdleStuffs()
--*****************************************************************************
    timer= timer-1
    if timer <=0 then
        LastHit= nil
        emu.registerafter(NULLFn)
    end
    memory.writebyte(RN,    9)
end

local MainLoop  -- There exists a MainLoop. Needed for a few function.

--*****************************************************************************
local function ForgetIt()
--*****************************************************************************
    DEBUG_Status= "... Yeesh..."
    HitTiming= nil
    emu.registerbefore(MainLoop)
end

--*****************************************************************************
local function ScanHit()
--*****************************************************************************
    DEBUG_Status= "Scanned!"
    timer= Dsp.stick
    emu.registerafter(IdleStuffs)
    LastHit= HitTiming

    deviation= deviation + HitTiming
    if HitTiming < 0 then
        accuracy= accuracy - HitTiming
        lates= lates+1
        acclate= acclate - HitTiming
    elseif HitTiming > 0 then
        accuracy= accuracy + HitTiming
        earlies= earlies+1
        accearly= accearly + HitTiming
    else
        perfect= perfect+1
    end
    HitTiming= nil
    emu.registerbefore(MainLoop)
end

--*****************************************************************************
local function PunchLoop()
--*****************************************************************************
    DEBUG_Status= "He's punching!"
    HitTiming= HitTiming-1
    if HitTiming < BND then ForgetIt()
    elseif AB() then
        ScanHit()
    end
end

--*****************************************************************************
local function NewPunch()
--*****************************************************************************
    DEBUG_Status= "Oh, snap!"
    emu.registerbefore(PunchLoop)
    HitTiming= OFFSET
end

--*****************************************************************************
local function WatchLoop()
--*****************************************************************************
    DEBUG_Status= "He's waiting..."
    local HippoStatus= memory.readbyte(ACT)

    if (HippoStatus == 23) or (HippoStatus == 24) then
        NewPunch()

    elseif HippoStatus ~= 1 then
        HitTiming= nil
        emu.registerbefore(MainLoop)

    else
        HitTiming= OFFSET+memory.readbyte(ETMR)
    end
end

--*****************************************************************************
local function NewWatch()
--*****************************************************************************
    DEBUG_Status= "Oh, shiny!"
    HitTiming= OFFSET+memory.readbyte(ETMR)
    emu.registerbefore(WatchLoop)
end

--*****************************************************************************
function MainLoop()
--*****************************************************************************
    DEBUG_Status= "Sleeping"
    local HippoStatus= memory.readbyte(ACT)
    if HippoStatus == 1 then
        NewWatch()
    end
end

emu.registerbefore(MainLoop)




--*****************************************************************************
function ResetStats()
--*****************************************************************************
    deviation= 0
    accuracy= 0
    perfect= 0
    earlies= 0
    lates= 0
    accearly= 0
    acclate= 0
end

local SparklyJoy= 0
local SparkyColors={"red","white","green","blue"}
--*****************************************************************************
local function DisplayStuffs()
--*****************************************************************************

--I'm handling options just for you!!
    UpdateKeys()
    if Press("insert")   then Dsp.line= not Dsp.line end
    if Press("delete")   then Dsp.bar=  not Dsp.bar  end
    if Press("home")     then Dsp.stealth= Dsp.stealth+1 end
    if Press("end")      then Dsp.stealth= math.max(Dsp.stealth-1,0) end
    if Press("pageup")   then Dsp.stick= Dsp.stick+1 end
    if Press("pagedown") then Dsp.stick= math.max(Dsp.stick-1,0) end
    if Press("numpad5")  then ResetStats() end
    if keys.leftclick and lastkeys.leftclick then
        DISPx=  DISPx  + keys.xmouse - lastkeys.xmouse
        DISPx2= DISPx2 + keys.xmouse - lastkeys.xmouse
        DISPy=  DISPy  + keys.ymouse - lastkeys.ymouse
    end

    if Press("numpad0")  then
        AutoCheat= not AutoCheat
        if AutoCheat then
            memory.registerwrite(RN,ForceRNToBehave)
        else
            memory.registerwrite(RN,nil)
        end
    end

-- Okay, enough options handling. On we go!
  if Dsp.bar then
    for i= BND, UPP do
        if i <= 0 or i > Dsp.stealth or LastHit then
            local Y = DISPy - i*4
            if     i < 0 then Y= Y+2
            elseif i > 0 then Y= Y-2 end

            local color= "black"
            if     i == LastHit   then color= "red"
            elseif i == HitTiming then color= "green" end

            gui.box(DISPx, Y, DISPx2, Y+2, 0, color)
        end
    end

    if LastHit == 0 then  --Sparkly joy!
        SparklyJoy= (SparklyJoy%3)+1
        gui.drawbox(DISPx-2, DISPy-2, DISPx2+2, DISPy+4, 0, SparkyColors[SparklyJoy])
        gui.drawbox(DISPx, DISPy, DISPx2, DISPy+2, 0, SparkyColors[SparklyJoy+1])
    else
        SparklyJoy= 0
        gui.drawbox(DISPx-2, DISPy-2, DISPx2+2, DISPy+4, 0, "green")
    end
  end

  if Dsp.line then
    local ThisX= 240
    local ThisY=  60
    gui.box(ThisX-1,ThisY,ThisX+1,ThisY+2+TMR-BND, "black", "white")
    gui.pixel(ThisX,ThisY+1+TMR,"white")
    if HitTiming then gui.pixel(ThisX,ThisY+1+TMR-HitTiming,"green") end
  end

    if LastHit then
        if LastHit < 0 then
            gui.text(128,80,"Late  " .. -LastHit)
        elseif LastHit > 0 then
            gui.text(128,80,"Early  " .. LastHit)
        else
            gui.drawbox(127,79,142,88,"green")
            gui.text(128,80,"OK")
        end
    end

    gui.text(  1,110,"Timing error: " .. accuracy)
    gui.text(  1,120,"Deviation: " .. deviation)

    gui.text(  1,140,"Perfect hits: " .. perfect)
    gui.text(  1,160,"Early: " .. earlies .. " : " .. accearly)
    gui.text(  1,170,"Late: " .. lates .. " : " .. acclate)

    local Tot=(perfect + earlies + lates)
    if Tot ~= 0 then
        local temp= perfect / Tot
        temp= math.floor(temp*1000)/10
        gui.text(  1,185,"Accuracy: " .. temp .. "%")

        temp= deviation / Tot
        temp= math.floor(temp*100)/100
        gui.text(1,195,"Dev.Rate: " .. temp)
    else
        gui.text(  1,185,"Accuracy: --.-%")
        gui.text(1,195,"Dev.Rate: -.--")
    end

    gui.text(145, 14,memory.readbyte(EHP))
    gui.text(  1,  1,DEBUG_Status)
    gui.text(230,  1,Dsp.stick)
    gui.text(  1, 50,"Punches: " .. Tot)

    if AutoCheat then   gui.text(88,1,"Eternal Cheat Acitve!")  end
end

gui.register(DisplayStuffs)


--*****************************************************************************
function CheatEternalBattle()
--*****************************************************************************
--    memory.writebyte(CLOCK, 0)
--    memory.writebyte(EHP,  96)
--    memory.writebyte(HEART, 7)
end

while true do
    if AutoCheat then CheatEternalBattle() end
    emu.frameadvance()
end