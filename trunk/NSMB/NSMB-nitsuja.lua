-- info and ghost display script for TASing in DeSmuME
-- supported games: Sonic Rush, Sonic Rush Adventure, Sonic Colo[u]rs, and New Super Mario Bros.
-- original script author: nitsuja

-- script input configuration
hide_key = 'capslock'
protect_ghost_key = 'leftclick'
delete_ghost_key = 'rightclick'
adjust_ghost_backward_key = 'leftbracket'
adjust_ghost_forward_key = 'rightbracket'
-- note: press forward and backward keys together -> reset adjustment

-- script feature set settings
draw_info_text = true
draw_velocity_trails = true
draw_ghosts = true
max_ghosts = 16
color_coded_speed = true
use_in_game_time = true
keep_history_across_sessions = true







if keep_history_across_sessions then
  -- define which variable live across multiple runs of the script
  emu.persistglobalvariables{
    currenttracknumber = 1, 

    -- a record of frame information... 
    -- looks like: {savenumber1={time1=x1y1,time2=x2y2,...},savenumber2=...}
    frameinforecords = {}, -- initially it's an empty table
  }
else
  currenttracknumber = 1
  frameinforecords = {}
end



local drawinfo_y = 30
local drawinfo = function(msg,val,xoff,xoff2,color)
  gui.text(180+(xoff or 0),drawinfo_y,msg,0xffffff3f)
  gui.text(220+(xoff2 or 0),drawinfo_y,val or _G[msg],color)
  drawinfo_y = drawinfo_y + 10
end



-- a helper function to convert from unpacked x,y position to combined xy
local function packxy(x,y)
  return OR(x, SHIFT(y, -16))
end
-- a helper function to convert from packed xy position to separate x,y
local function unpackxy(xy)
  local x = AND(xy, 0xFFFF)
  local y = SHIFT(xy, 16)
  if y > 32767 then y = y - 65536 end
  return x,y
end



-- hack fix for desmume's readlongunsigned returning signed values
local origreadlongunsigned = memory.readlongunsigned
memory.readlongunsigned = function(...)
  rv = origreadlongunsigned(...)
  if rv < 0 then rv = 1 + (rv + 0xFFFFFFFF) end
  return rv
end



-- stub out game-specific functions until we know which game this is
function getcamx() return 0 end
function getcamy() return 0 end
function istopontop() return true end
function isnotinlevel() return false end
function getinstantid() return 0 end
function getperframeinfo() return 0 end

function initgamespecificfunctions()

  if whichgame == 'sc' then

    function getcamx()
      -- estimates the camera position of 2 frames ago, since that matches up best visually
      local x = memory.readlong(0x021203BC+8+ramshift)*2 - memory.readlong(0x021203BC+ramshift)
      return math.floor((x / 4096) + .5)
    end
    function getcamy()
      -- each screen has its own set of camera values, which will be different for the y component.
      -- this function returns the y value of whichever screen is on top.
      local y1 = memory.readlong(0x021203C0+8+ramshift)*2 - memory.readlong(0x021203C0+ramshift)
      local y2 = memory.readlong(0x02120448+8+ramshift)*2 - memory.readlong(0x02120448+ramshift)
      return math.floor((math.min(y1,y2) / 4096) + .5)
    end
    function istopontop()
      return memory.readlong(0x021203C0+ramshift) < memory.readlong(0x02120448+ramshift)
    end
    function isnotinlevel()
      return memory.readlong(0x02163EE4+ramshift) == 0 or memory.readword(0x0212089C+ramshift) == 0 -- hack
    end
    function getinstantid()
      -- this function should return whatever metric we want to minimize,
      -- although it should be scaled such that it most often increases by 1 per frame.
      -- for example, we could return (framecount + estimated_future_delays) or (framecount - score*n).
      -- in this case, let's simply use in-game level time and nothing else.
      return memory.readword(0x0212089C+ramshift) -- time = 
    end
    function getperframeinfo()
      -- a helper function to get current player position info
      -- (packed into a single number, since we might store a LOT of this data...)

      --local baseaddr = memory.readlong(0x02120850+ramshift) -- often 0x0219B220
      --local rawx = memory.readlong(baseaddr + 0x44)
      --local x = rawx/4096
      --local y = memory.readlong(baseaddr + 0x48)/4096
      --local lagx = memory.readlong(0x27E36EC+ramshift)
      --if lagx < 32768 and lagx ~= rawx then -- hack to smooth out near-lag frames
      --  -- (a better way is sync the script to memory.registerwrite of the level timer,
      --  -- but non-dev desmume doesn't support that function)
      --  x = x + memory.readlong(baseaddr + 0xC0)/4096
      --  y = y + memory.readlong(baseaddr + 0xC4)/4096
      --end
        
      -- more 'correct' values. the other way makes for obviously screwy-looking trails.
      -- unfortunately this way is 1 frame behind, but that might be unavoidable because
      -- this could be the earliest frame that the game is actually sure about the position.
      local x = memory.readlong(0x0212A340+ramshift)/4096
      local y = memory.readlong(0x0212A344+ramshift)/4096
      return packxy(x,y)
    end

  elseif whichgame == 'sra' then

    function getcamx()
      local x = memory.readlong(0x02133ACC+8+ramshift3)*2 - memory.readlong(0x02133ACC+ramshift3)
      return math.floor((x / 4096) + .5)
    end
    function getcamy()
      local y1 = memory.readlong(0x02133AD0+8+ramshift4)*2 - memory.readlong(0x02133AD0+ramshift4)
      local y2 = memory.readlong(0x02133B40+8+ramshift4)*2 - memory.readlong(0x02133B40+ramshift4)
      return math.floor((math.min(y1,y2) / 4096) + .5)
    end
    function istopontop()
      return memory.readlong(0x02133AD0+ramshift4) < memory.readlong(0x02133B40+ramshift4)
    end
    function isnotinlevel()
      return memory.readword(0x213399C+ramshift) == 0
    end
    function getinstantid()
      return memory.readword(0x021338C8+ramshift2)
    end
    function getperframeinfo()
      --local baseaddr = memory.readlong(0x02133884+ramshift?)
      --local rawx = memory.readlong(baseaddr + 0x44)
      --local x = rawx/4096
      --local y = memory.readlong(baseaddr + 0x48)/4096
      local x = memory.readlong(0x0214389C+ramshift5)/4096
      local y = memory.readlong(0x021438A0+ramshift5)/4096
      return packxy(x,y)
    end

  elseif whichgame == 'sr' then

    function getcamx()
      local x = memory.readlong(0x0236AADC+8+ramshift)*2 - memory.readlong(0x0236AADC+ramshift)
      return math.floor((x / 256) + .5)
    end
    function getcamy()
      local y1 = memory.readlong(0x0236AAE0+8+ramshift)*2 - memory.readlong(0x0236AAE0+ramshift)
      local y2 = memory.readlong(0x0236AB44+8+ramshift)*2 - memory.readlong(0x0236AB44+ramshift)
      return math.floor((math.min(y1,y2) / 256) + .5)
    end
    function istopontop()
      return memory.readlong(0x02090050+ramshift) < memory.readlong(0x02090058+ramshift) 
    end
    function isnotinlevel()
      return false -- nyi
    end
    function getinstantid()
      return memory.readword(0x02091EBC+ramshift)
    end
    function getperframeinfo()
      --local x = memory.readlong(0x020907DC+ramshift)/256
      --local y = memory.readlong(0x020907E0+ramshift)/256
      local x = memory.readlong(0x02090B54+ramshift)/256
      local y = memory.readlong(0x02090B58+ramshift)/256
      return packxy(x,y)
    end

  elseif whichgame == 'nsmb' then

    function getcamx()
      local x = memory.readlong(0x020CAF20) -- or 0x020CADCC (1 ahead)
      return math.floor((x / 4096) + .5)
    end
    function getcamy()
      return math.floor((memory.readlong(0x020CADDC) / -4096) + .5) - (istopontop() and 240 or 512) -- or 0x02085B78 (lower)
    end
    function istopontop()
      return AND(memory.readbyte(0x020CAD0C),8) ~= 0
    end
    function isnotinlevel()
      return memory.readwordsigned(0x021C5A62) == -1 -- or 0x021C5B5E or 0x021C5B82 -- not very good, only detects map screen
    end
    function getinstantid()
      return memory.readword(0x020CAB14) -- or 0x2088BD8
    end
    function getperframeinfo()
      local x = memory.readlong(0x0212AFC4)/4096 -- or 0x020CAEBC (1 ahead)
      local y = memory.readlong(0x0212AFC8)/-4096 -- or 0x020CAEBC (1 ahead)
      return packxy(x,y)
    end

  end

  if not use_in_game_time then
    getinstantid = function() return emu.framecount() end
  end
  
end


local speedtocolor, speedtocolornb
if color_coded_speed then
  speedtocolor = function (speed)
    speed = math.abs(speed)
    if speed < 512 then return 0x000000FF end
    if speed < 2560 then return 0xFF0000FF end
    if speed == 2560 then return 0xFF4000FF end
    if speed < 3072 then return 0xFF7F00FF end
    if speed == 3072 then return 0xFFAF00FF end
    if speed < 3648 then return 0xFFFF00FF end
    if speed <= 3840 then return 0xFFFFFFFF end
    if speed < 4096 then return 0x7FFF7FFF end
    if speed == 4096 then return 0x7FFFFFFF end
    if speed < 8192 then return 0x00FFFFFF end
    return 0xBF7FFFFF
  end
  speedtocolornb = function (speed)
    local color = speedtocolor(speed)
    if AND(color,0xFFFFFF00) == 0 then color = OR(color,0x7F7F7F00) end
    return color
  end
else
  speedtocolor = function (speed) return 0xFFFFFFFF end
  speedtocolornb = function (speed) return 0xFFFFFFFF end
end

function drawinfodisplay()
  if input.get()[hide_key] then return end
  if not draw_info_text then return end

  local topontop = istopontop()
  drawinfo_y = not topontop and 20 or 20-192

  if isnotinlevel() then
    drawinfo('...', '')
    return
  end

  local metery, timex, timey
  if whichgame == 'sc' then
    local baseaddr = memory.readlong(0x02120850+ramshift) -- (or 0x0212085C or 0x02120860)
    xvel  = math.floor(memory.readlongsigned(baseaddr + 0xC0) / 16 + 0.5)
    yvel  = math.floor(memory.readlongsigned(baseaddr + 0xC4) / 16 + 0.5)
    speed = math.floor(memory.readlongsigned(baseaddr + 0xCC) / 16 + 0.5)
    meter = (memory.readwordsigned(baseaddr + 0x654) * 300 / 4800)
    power = (memory.readwordsigned(baseaddr + 0x820))
    if memory.readbyte(0x021201EC+ramshift) == 2 then power = 0 end
    time = memory.readword(0x0212089C+ramshift) -- level timer only
    xpos = memory.readlong(baseaddr + 0x44) / 4096
    ypos = memory.readlong(baseaddr + 0x48) / 4096
    --local angval = memory.readshort(0x0212FF94+ramshift)
    --if angval == 0 then angval = memory.readlong(baseaddr + 0x1AC) end
    --angle = math.floor(-math.asin(angval / 4096) * (180 / math.pi) + 0.5)
    --if angval > 4096 or angval < -4096 then angle = 0 end
    metery = 160
    timex = 160
    timey = 11
    if power > 0 then gui.text(0,not topontop and 48 or 48-192,power) end
  elseif whichgame == 'sra' then
    local baseaddr = memory.readlong(0x02133884+ramshift)
    xvel  = math.floor(memory.readlongsigned(baseaddr + 0xBC) / 16 + 0.5)
    yvel  = math.floor(memory.readlongsigned(baseaddr + 0xC0) / 16 + 0.5)
    speed = math.floor(memory.readlongsigned(baseaddr + 0xC8) / 16 + 0.5)
    meter = memory.readwordsigned(baseaddr + 0x5f8) * 300 / 4800
    time = memory.readword(0x021338C8+ramshift2)
    xpos = memory.readlong(baseaddr + 0x44) / 4096
    ypos = memory.readlong(baseaddr + 0x48) / 4096
    --angle = memory.readlongsigned(baseaddr + 0x34) * 180 / 32768 -- todo
    --angle = angle<180 and -angle or 360-angle
    --if -angle == 0 then angle = 0 end
    metery = 46
    timex = 152
    timey = 17
  elseif whichgame == 'sr' then
    xvel  = memory.readwordsigned(0x020907E8+ramshift)
    yvel  = memory.readwordsigned(0x020907EA+ramshift)
    speed = memory.readwordsigned(0x020907F4+ramshift)
    meter = memory.readwordsigned(0x02090B10+ramshift) * 300 / 4800
    time = memory.readword(0x02091EBC+ramshift)
    xpos = memory.readlong(0x020907DC+ramshift) / 256
    ypos = memory.readlong(0x020907E0+ramshift) / 256
    --local angval = memory.readshort(0x02090934+ramshift) -- todo
    --angle = math.floor(-math.asin(angval / 4096) * (180 / math.pi) + 0.5)
    --if angval > 4096 or angval < -4096 then angle = 0 end
    metery = 41
    timex = 82
    timey = 17
  elseif whichgame == 'nsmb' then
    xvel  = math.floor(memory.readwordsigned(0x021B7104) / 4 + 0.5)
    yvel  = math.floor(memory.readwordsigned(0x021B7108) / 4 + 0.5)
    speed = math.floor(memory.readwordsigned(0x021B6A90) / 4 + 0.5)
    meter = 0
    time = memory.readword(0x020CAB14)
    xpos = memory.readlong(0x020CAEBC) / 4096
    ypos = memory.readlong(0x020CAEC0) / -4096
    timex = 180
    timey = 1
  else
    speed = 0
    xvel = 0
    meter = 0
    metery = 0
    timex = 0
    timey = 0
  end

  drawinfo('speed',speed,0,0,speedtocolornb(speed))
  drawinfo('xvel',xvel,0,0,speedtocolornb(xvel))
  drawinfo('yvel')
  if meter > 0 then gui.text(0,not topontop and metery or metery-192,string.format('%.1f%%',meter)) end
  gui.text(timex,not topontop and timey or timey-192,time,0x7FFFFFFF) 
  drawinfo('x', xpos, 0,-30)
  drawinfo('y', ypos, 0,-30)
  --drawinfo('angle', angle)

end






-- draws the box of the given frame of a track
function renderframeinfo(records, id,camx,camy, tracknumber)

  if not records then return end

  local packedinfo = records[id]
  if not packedinfo then return end

  local xpos,ypos = unpackxy(packedinfo)

  local notcurrent = (tracknumber ~= currenttracknumber)

  -- don't draw anything if it's after the last frame
  if notcurrent and (id > (records.endid or id)) then return end

  -- draw a box where the player is (in this track)
  local hwidth = 10
  local hheight = 16
  local x = xpos - camx
  local y = ypos - camy - 192
  if y > 0 then
    y = y - 80
    if y <= 16 then return end
  end

  -- force offscreen boxes to draw partially onscreen so we can know where they are
  local offscreen
  if x<0    then x=0    offscreen = true end
  if x>256  then x=256  offscreen = true end
  if y<-192 then y=-192 offscreen = true end
  if y>192  then y=192  offscreen = true end
  
  local color        = records.important and 0xFF7F7F7F or 0x7F7FFF7F
  local outlinecolor = notcurrent and 0x000000FF or speedtocolor(math.abs(speed or 0))
  if not notcurrent then -- make filling more transparent if is current state
    color = OR(AND(color,0xFFFFFF00),AND(color,0xFF)*0.5)
  elseif offscreen then -- make more transparent if offscreen
    color = OR(AND(color,0xFFFFFF00),AND(color,0xFF)*0.75)
    outlinecolor = OR(AND(outlinecolor,0xFFFFFF00),AND(outlinecolor,0xFF)*0.75)
  end
  gui.drawbox(x-hwidth, y-hheight, x+hwidth, y+hheight, color, outlinecolor)
  
--  -- draw the track number somewhere in the box
--  if notcurrent then
--    x = x + (tracknumber%6) * 4 - 10
--    y = y + (tracknumber/6) * 6 - 15
--    local message = string.format("%d", tracknumber)
--    gui.text(x, y, message, 0xFFFFFFFF)
--  end

  -- draw the track's offset amount somewhere in the box
  if notcurrent and records.offset and records.offset ~= 0 then
    --x = x + (tracknumber%6) * 4 - 13
    x = x - 8
    y = y + (tracknumber/6) * 6 - 15
    local message = string.format("%s%d", records.offset > 0 and '+' or '', records.offset)
    gui.text(x, y, message, outlinecolor,color)
  end
  
  if not offscreen then
    records.seenago = 0
  end

end


function ispointwithintrackbox(records, id,camx,camy, tracknumber, xcheck,ycheck)

  if not records then return end
  local packedinfo = records[id]
  if not packedinfo then return end

  local xpos,ypos = unpackxy(packedinfo)

  local notcurrent = (tracknumber ~= currenttracknumber)

  -- don't check if it's after the last frame
  if notcurrent and (id > (records.endid or id)) then return end

  -- check a box where the player is (in this track)
  local hwidth = 10
  local x = xpos - camx

  -- offscreen boxes draw partially onscreen so you can interact with them
  if x<0    then x=0   end
  if x>256  then x=256 end

  if xcheck < x-hwidth or xcheck > x+hwidth then return end
  
  local hheight = 16
  local y = ypos - camy - 192
  if y > 0 then
    y = y - 80
    if y <= 16 then return end
  end
  
  -- offscreen boxes draw partially onscreen so you can interact with them
  if y<-192 then y=-192 end
  if y>192  then y=192  end
  
  if ycheck < y-hheight or ycheck > y+hheight then return end
  
  return true

end


local points = {}
local ids = {}
function renderpasttrajectory(records, id, tracknumber)
  
  if not records or not draw_velocity_trails then return end
  
  local lastx
  local j = 1
  for i=id,id-64,-1 do
    local info = records[i]
    if info then
      points[j] = info
      ids[j] = i
      j = j + 1
    end
  end
  for k=j,#points do
    points[k] = nil
    ids[k] = nil
  end

  local camx = getcamx()
  local camy = getcamy() + 192
  
  if #points < 2 then return end

  local ax,ay = unpackxy(points[1])
  local bx,by = unpackxy(points[2])
  ax = ax - camx
  ay = ay - camy
  bx = bx - camx
  by = by - camy
  
  local speedfactor = (whichgame == 'nsmb' and 4 or 1)
  
  local skipfirst = false
  for i=3,j-1 do
    
    local aym = ay-16
    local ayp = ay+16
    local bym = by-16
    local byp = by+16
    
    if aym > 0 then aym = math.max(0,aym - 80) end
    if ayp > 0 then ayp = math.max(0,ayp - 80) end
    if bym > 0 then bym = math.max(0,bym - 80) end
    if byp > 0 then byp = math.max(0,byp - 80) end
    
    local transp = 255 * (j+3-i) / j

    local dx = bx - ax
    local dy = by - ay
    local di = ids[i-2] - ids[i-1]
    local xspeed = math.abs(dx) * speedfactor / di
    
    if math.abs(dx) < 256 and math.abs(dy) < 192 then
      local color = OR(AND(speedtocolor(xspeed*256),0xFFFFFF00), transp)
      --local color = OR(AND(speedtocolor((i%2)*2560),0xFFFFFF00), transp)
    
      if (dx < 0 or dy < 0) and (aym ~= 0 or bym ~= 0) then
        gui.drawline(ax-10,aym,bx-10,bym, color, skipfirst)
      end
      if (dx < 0 or dy > 0) and (ayp ~= 0 or byp ~= 0) then
        gui.drawline(ax-10,ayp,bx-10,byp, color, skipfirst)
      end
      if (dx > 0 or dy < 0) and (aym ~= 0 or bym ~= 0) then
        gui.drawline(ax+10,aym,bx+10,bym, color, skipfirst)
      end
      if (dx > 0 or dy > 0) and (ayp ~= 0 or byp ~= 0) then
        gui.drawline(ax+10,ayp,bx+10,byp, color, skipfirst)
      end

      skipfirst = true
    end   

    ax=bx
    ay=by
    bx,by = unpackxy(points[i])
    bx = bx - camx
    by = by - camy

  end

end




function drawghostdisplay()

  local inp = input.get()

  if inp[hide_key] then return end

  if isnotinlevel() then return end

  -- calculate/retrieve the frame info
  local id = getinstantid()
  if id < 2 then return end
  local camx = getcamx()
  local camy = getcamy()

  if draw_ghosts then

    -- draw hitboxes for this frame for all tracks except the current one
    for tracknumber,records in ipairs(frameinforecords) do
      if tracknumber ~= currenttracknumber then
        local tempid = id
        if records and records.offset then
          tempid = tempid + records.offset
        end
        renderframeinfo(records, tempid,camx,camy, tracknumber)
      end
    end

  end

  -- draw velocity trails for the current track
  renderpasttrajectory(frameinforecords[currenttracknumber], id, currenttracknumber)

  -- draw the information for this frame for the current track
  renderframeinfo(frameinforecords[currenttracknumber], id,camx,camy, currenttracknumber)
  
end


function figureoutwhichgame()
  if emu.framecount() < 10 then return end
  local gameid = memory.readlongunsigned(0x200000C)
  if gameid == 0xF509DEFF or gameid == 0x72E9DEFF or gameid == 0x023FDEFF then
    whichgame = 'sc'
    ramshift = (gameid == 0x023FDEFF) and -0x20 or 0
    print('Sonic Colo'..(gameid == 0x72E9DEFF and 'u' or '')..'rs detected')
  elseif gameid == 0xE481DEFF or gameid == 0x33A9DEFF or gameid == 0xB936DEFF or gameid == 0xAD6FDEFF then
    whichgame = 'sra'
    ramshift = (gameid == 0xAD6FDEFF) and -0x800 or 0
    ramshift2 = (gameid == 0xAD6FDEFF) and -0x7F0 or 0
    ramshift3 = (gameid == 0xAD6FDEFF) and -0x794 or 0
    ramshift4 = (gameid == 0xAD6FDEFF) and -0x804 or 0
    ramshift5 = (gameid == 0xAD6FDEFF) and 0x3CC or 0
    print('Sonic Rush Adventure detected')
  elseif gameid == 0x9771DEFF or gameid == 0x97EDDEFF or gameid == 0x187BDEFF then
    whichgame = 'sr'
    ramshift = (gameid == 0x187BDEFF) and 0x20 or 0
    print('Sonic Rush detected')
  elseif gameid == 0xA315DEFF then
    whichgame = 'nsmb'
    print('New Super Mario Bros. detected')
  elseif not checkedwhichgame then
    print(string.format('unknown game %X',gameid))
  end
  if whichgame then initgamespecificfunctions() end
  checkedwhichgame = true
end

emu.registerafter( function()

  if not whichgame then figureoutwhichgame() end

  if isnotinlevel() then return end

  id = getinstantid()
  
  if id == 0 then return end

  -- just in case...
  if not frameinforecords[currenttracknumber] then frameinforecords[currenttracknumber] = {} end

  -- store the new information for this frame
  prevperframeinfo = getperframeinfo()
  local currecords = frameinforecords[currenttracknumber]
  currecords[id] = prevperframeinfo
  currecords.endid = id
  currecords.endinfo = prevperframeinfo
  currecords.seenago = 0

  -- update "last seen" counter for each track
  for tracknumber,records in ipairs(frameinforecords) do
    records.seenago = (records.seenago or 0) + 1
  end

end)




emu_registeridle = (function()

  if not whichgame and not checkedwhichgame then figureoutwhichgame() end

  -- hack to detect when a savestate got loaded, because desmume currently lacks savestate.registerload
  local curid = getinstantid()
  local curframeinfo = getperframeinfo()
  local removenum
  if id ~= curid or prevperframeinfo ~= curframeinfo then

    local prevrecords = frameinforecords[currenttracknumber]
    local previnfo = prevperframeinfo
    local previd = id

    id = curid
    prevperframeinfo = curframeinfo
    
    -- savestate got loaded...
    
    -- sort tracks, with higher indices being less important to keep
    table.sort(frameinforecords, function(a,b)
      if not a then return b ~= nil end -- probably not needed, shouldn't be
      if (a==prevrecords) ~= (b==prevrecords) then return a==prevrecords end -- don't discard the track we just recorded
      if a.important ~= b.important then return (a.important and 1 or 0) > (b.important and 1 or 0) end -- avoid discarding protected/important tracks
      if a.seenago ~= b.seenago then return (a.seenago or 9999) < (b.seenago or 9999) end -- discard "least recently seen"
      local ax,_ = unpackxy(a.endinfo or 0)
      local bx,_ = unpackxy(b.endinfo or 0)
      return ax*(b.endid or 0) > bx*(a.endid or 0) -- use average x velocity as tiebreaker
    end)
    
    -- figure out where the previous value of currenttracknumber got moved to by the sorting
    local prevtracknumber
    for tracknumber,records in ipairs(frameinforecords) do
      if records == prevrecords then
        prevtracknumber = tracknumber
        break
      end
    end
    
    -- use next unoccupied track, or replace worst track if out of space
    currenttracknumber = 1+#frameinforecords
    if currenttracknumber > max_ghosts then currenttracknumber = max_ghosts end
    
    -- if the new state matches the middle of another track, copy that track to the new one being selected
    for tracknumber,records in ipairs(frameinforecords) do
      if records[curid] == curframeinfo and tracknumber ~= currenttracknumber then
        frameinforecords[currenttracknumber] = copytable(records)
        frameinforecords[currenttracknumber].endid = curid
        frameinforecords[currenttracknumber].endinfo = curframeinfo
        break
      end
    end
    
    -- if the previous state matches the middle of another track, delete the previous state's track
    if frameinforecords[prevtracknumber] then
      for tracknumber,records in ipairs(frameinforecords) do
        if records[previd] == previnfo and tracknumber ~= prevtracknumber and tracknumber ~= currenttracknumber then
          removenum = prevtracknumber
          break
        end
      end
    end
  end


  -- if the current state matches the end of another track, delete that track
  if not removenum and frameinforecords[currenttracknumber] and frameinforecords[currenttracknumber].endid == curid and frameinforecords[currenttracknumber].endinfo == curframeinfo then
    for tracknumber,records in ipairs(frameinforecords) do
      if records.endid == curid and records.endinfo == curframeinfo and tracknumber ~= currenttracknumber then
        --removenum = tracknumber
        local important = frameinforecords[tracknumber].important
        frameinforecords[tracknumber] = frameinforecords[currenttracknumber]
        frameinforecords[tracknumber].important = important or frameinforecords[tracknumber].important
        removenum = currenttracknumber
        currenttracknumber = tracknumber
        break
      end
    end
  end

  -- actually remove whatever we decided to, if anything
  if removenum then
    table.remove(frameinforecords, removenum)
    if currenttracknumber > removenum then
      currenttracknumber = currenttracknumber - 1
    end
  end


  -- check for removing a track via right-clicking on it
  local inp = input.get()
  if inp[delete_ghost_key] and not removecheckwasrightclick then
    --while true do
      removenum = nil
      
      local id = getinstantid()
      local camx = getcamx()
      local camy = getcamy()

      for tracknumber,records in ipairs(frameinforecords) do
        local tempid = id
        if frameinforecords[tracknumber] and frameinforecords[tracknumber].offset and tracknumber ~= currenttracknumber then
          tempid = tempid + frameinforecords[tracknumber].offset
        end
        if ispointwithintrackbox(records, tempid,camx,camy, tracknumber, inp.xmouse, inp.ymouse) then
          removenum = tracknumber
          break
        end
      end

      if removenum then
        if frameinforecords[removenum].important then
          frameinforecords[removenum].important = nil -- strip importance before deleting
        elseif removenum == currenttracknumber then
          frameinforecords[removenum] = {}
          frameinforecords[removenum].seenago = 0
        else
          table.remove(frameinforecords, removenum)
          if currenttracknumber > removenum then
            currenttracknumber = currenttracknumber - 1
          end
        end
        removecheckwasrightclick = inp[delete_ghost_key] -- only remove 1 per click-drag
      end
      
      --if not removenum then break end -- only remove 1 per click
    --end
  end
  if not inp[delete_ghost_key] then removecheckwasrightclick = rightclick end


  -- check for marking a track as important via left-clicking on it
  if inp[protect_ghost_key] and not markcheckwasleftclick then
    --while true do
      local id = getinstantid()
      local camx = getcamx()
      local camy = getcamy()

      for tracknumber,records in ipairs(frameinforecords) do
        local tempid = id
        if frameinforecords[tracknumber] and frameinforecords[tracknumber].offset and tracknumber ~= currenttracknumber then
          tempid = tempid + frameinforecords[tracknumber].offset
        end
        if ispointwithintrackbox(records, tempid,camx,camy, tracknumber, inp.xmouse, inp.ymouse) and not frameinforecords[tracknumber].important then
          frameinforecords[tracknumber].important = true
          markcheckwasleftclick = inp[protect_ghost_key] -- only mark 1 per click-drag
          break
        end
      end
      
      --if not removenum then break end -- only mark 1 per click
    --end
  end
  if not inp[protect_ghost_key] then markcheckwasleftclick = leftclick end



  -- check for adjusting a track's offset via [ and ] while moused over it
  if inp[adjust_ghost_backward_key] or inp[adjust_ghost_forward_key] then
    local id = getinstantid()
    local camx = getcamx()
    local camy = getcamy()
    for tracknumber,records in ipairs(frameinforecords) do
      if tracknumber ~= currenttracknumber then
        local tempid = id
        if frameinforecords[tracknumber] and frameinforecords[tracknumber].offset then
          tempid = tempid + frameinforecords[tracknumber].offset
        end
        if ispointwithintrackbox(records, tempid,camx,camy, tracknumber, inp.xmouse, inp.ymouse) then
          local newoffset = (frameinforecords[tracknumber].offset or 0) + (inp[adjust_ghost_backward_key] and -1 or 1)
          if inp[adjust_ghost_backward_key] and inp[adjust_ghost_forward_key] then newoffset = 0 end
          local newtempid = id + newoffset
          if newtempid == 0 or ((newtempid <= (records.endid or newtempid)) and frameinforecords[tracknumber][newtempid]) then -- don't let it disappear
            if newoffset == 0 then newoffset = nil end
            frameinforecords[tracknumber].offset = newoffset
          end
        end
      end
    end
  end

end)



gui.register(function()
  emu_registeridle() -- update some things even while paused, calling this here is a hack and might rely on desmume's dual-core mode
  drawghostdisplay()
  drawinfodisplay()
end)