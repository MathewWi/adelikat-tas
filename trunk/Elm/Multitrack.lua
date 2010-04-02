-- Multi-track rerecording for FCEUX
-- It may get obsolete when TASEdit comes around.
--FatRatKnight


--**********************************************
local players= 4

local selectplayer = "home"   -- For selecting which player
local recordingtype= "end" -- For selecting how to record
local key = {"right", "left", "down", "up", "enter", "M", "comma", "period"}
local btn = {"right", "left", "down", "up", "start", "select", "B", "A"}
-- Don't change btn, unless it's to adjust the spacing to keep it neat.
--**********************************************

local optType= {"Toggle", "You", "Script", "Off"} -- Names for option types
local keys, lastkeys = {}, {} -- To hold keyboard input
local Pin, thisInput = {}, {} -- Input manipulation array
local option = {}             -- Options
local fc, lastfc= nil, nil    --
local pl= 1

for i= 1, players do
    Pin[i]= {}
    thisInput[i]= {}
    option[i]= {}
    for j= 1, 8 do
        option[i][btn[j]]= 1
    end
end  -- Setting up tables upon tables...

-- Intention of options:
-- "Toggle"  Takes both your input and the input list. XOR logic
-- "You"     Uses only your input. The input list is ignored.
-- "Script"  Ignores your input. Only the input list is used.
-- "Off"     Always unpressed. Will overwrite the input list with nil.


function press(button)
-- only purpose is to save me trouble of repeatedly punching
-- in this same if statement over and over again...
    if keys[button] and not lastkeys[button] then
        return true
    end
    return false
end



function itisyourturn()
    keys= input.get()              -- Standard get info stuff.
    fc= movie.framecount()         -- Without which, what can I do?

    if press(selectplayer) then    -- Hopefully, this block is
        pl= pl + 1                 -- self-explanatory.
        if pl > players then       --
            pl= 1                  -- If not, it... Selects a player...
        end                        -- Joy.
    end                            --


    if fc ~= lastfc then           -- Holy crud! You advanced the frame!
        for P= 1, players do

            if lastfc then
            if fc == lastfc + 1 then
                Pin[P][lastfc]= joypad.get(P)
            end -- Could glitch if you load a save state that takes place one frame later.
            end

            if Pin[P][fc] then
                for i= 1, 8 do
                    op= optType[ option[P][btn[i]] ] -- Done for readability of if
                    if op == "Toggle"  or  op == "Script" then
                        thisInput[P][btn[i]]= Pin[P][fc][btn[i]]
                    else
                        thisInput[P][btn[i]]= nil
                    end
                end

            else               -- It's undefined?! Better create a table for it!
                Pin[P][fc]= {} -- Regardless of options, it's all nil anyway.
            end
        end
    end


    if keys[recordingtype] then  -- Are you setting options?
        for i= 1, 8 do
            if press(key[i]) then
                option[pl][btn[i]]= option[pl][btn[i]]+1
                if option[pl][btn[i]] > 4 then
                    option[pl][btn[i]]= 1
                end
            end
            gui.text(20,20+12*i,btn[i])
            gui.text(50,20+12*i,optType[option[pl][btn[i]]])
        end


    else -- Oh, you're not setting options. Actual input, eh?
        for i= 1, 8 do
            op= optType[ option[pl][btn[i]] ] -- Done for readability of if
            if op == "Toggle"  or  op == "You" then
            if press(key[i]) then          -- Spread the AND to the next line
                if thisInput[pl][btn[i]] then
                    thisInput[pl][btn[i]]= nil
                else
                    thisInput[pl][btn[i]]= true
                end
            end
            end
        end


        for i= 1, 8 do
            if thisInput[pl][btn[i]] then
                gui.text(50,10+12*i,btn[i])
            end
        end
    end -- Done with "options" if


    gui.text(30,10,pl)

    if movie.mode() == "record" then
        for P= 1, players do
            joypad.set(P, thisInput[P])
        end
    end

    lastfc= fc                     -- Standard "this happened last time"
    lastkeys= keys                 -- Don't want to keep registering stuff.
end





while not movie.mode() do
    gui.text(0,8, "Waiting for movie...")
    FCEU.frameadvance()
end


gui.register(itisyourturn)

while movie.mode() do
    FCEU.frameadvance()
end


-- Once movie stops, kill the script. Force removal of junk data via script closure.
-- Possible inconveniences include:
-- * You accidentally stop the movie. You have to reset the input list in the script.
-- * You must reload the script every time you switch through movies.
-- * You stop a movie, and load another without advancing a frame.
--   Junk input from previous movie may interfere.
-- * Won't care about what you set up for your normal player input.
-- * Could screw up under specific circumstances involving loading a state located 1 frame later.