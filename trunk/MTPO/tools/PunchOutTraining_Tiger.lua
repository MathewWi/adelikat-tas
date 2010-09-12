-- For Mike Tyson's Punch Out!! when fighting Tiger
-- Intended to help time hits in real time.
--FatRatKnight


local EHP= 0x0398  -- Enemy HP address
local HRT= 0x0325  -- Mac's Heart's been dropped indicator
local TMR= 75      -- Frames in advance for your punches.

local UPP= 19      -- Frames prior to the golden zone to display.
local BND= -8      -- KEEP NEGATIVE!! Frames after the golden zone.
local threshold= 22-- How many frames before the target timing does it allow?
local deadzone= 18 -- Frames to ignore a block following a failed punch.

local DISPx= 180
local DISPy= 180
local DISPx2= DISPx+11 -- Right side of box. Adjust that plus to your need
local Dsp= {line= true, bar= true, stealth= 0, stick= 30}

local accuracy= 0
local perfect= 0
local earlies= 0
local lates= 0

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
local function Is_Blocked()   return (memory.readbyte(HRT) == 0x80)  end
--*****************************************************************************

--*****************************************************************************
local function AB1()  local p= joypad.get(1); return (p.A or p.B)  end
--*****************************************************************************

local Pad, LastPad= {}, {}
--*****************************************************************************
local function AB2()
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
end


local MainLoop  -- There exists a MainLoop. Needed for a few function.

local DZ
--*****************************************************************************
local function ForcedWait()
--*****************************************************************************
    DEBUG_Status= "Deadzone, ignoring you!!"
    DZ= DZ-1
    if DZ <= 0 then emu.registerbefore(MainLoop) end
end

--*****************************************************************************
local function Reset()
--*****************************************************************************
    DEBUG_Status= "Reset"
    HitTiming= nil
end

--*****************************************************************************
local function ScanHit()
--*****************************************************************************
    DEBUG_Status= "Scanned!"
    timer= Dsp.stick
    emu.registerafter(IdleStuffs)
    LastHit= HitTiming

    if HitTiming < 0 then
        accuracy= accuracy - HitTiming
        lates= lates+1
    elseif HitTiming > 0 then
        accuracy= accuracy + HitTiming
        earlies= earlies+1
    else
        perfect= perfect+1
    end
end

--*****************************************************************************
local function WaitForIt()
--*****************************************************************************
    DEBUG_Status= "Timing..."
    HitTiming= HitTiming-1
    if HitTiming < BND then Reset(); emu.registerbefore(MainLoop)
    else
        if AB2() and HitTiming < threshold then
            ScanHit()
            DZ= deadzone
            emu.registerbefore(ForcedWait)
        end
    end
end

--*****************************************************************************
local function NewHit()
--*****************************************************************************
    DEBUG_Status= "BLOCKED"
    HitTiming= TMR
    emu.registerbefore(WaitForIt)
end

--*****************************************************************************
function MainLoop()
--*****************************************************************************
    DEBUG_Status= "Main"
    if Is_Blocked() then NewHit() end
end

emu.registerbefore(MainLoop)


--*****************************************************************************
function ResetStats()
--*****************************************************************************
    accuracy= 0
    perfect= 0
    earlies= 0
    lates= 0
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
    if Press("P")  then ResetStats() end
    if keys.leftclick and lastkeys.leftclick then
        DISPx=  DISPx  + keys.xmouse - lastkeys.xmouse
        DISPx2= DISPx2 + keys.xmouse - lastkeys.xmouse
        DISPy=  DISPy  + keys.ymouse - lastkeys.ymouse
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
    local ThisY= 100
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

    gui.text(1,120,"Timing error: " .. accuracy)
    gui.text(1,140,"Perfect hits: " .. perfect)
    gui.text(1,160,"Early: " .. earlies)
    gui.text(1,170,"Late: " .. lates)


    gui.text(1,1,DEBUG_Status)
    gui.text(200,1,Dsp.stick)
end

gui.register(DisplayStuffs)