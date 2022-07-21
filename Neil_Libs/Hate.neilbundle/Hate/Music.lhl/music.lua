-- <License Block>
-- Neil_Libs/Hate.neilbundle/Hate/Music.lhl/music.lua
-- Music
-- version: 22.07.17
-- Copyright (C) 2016-2017, 2022 Jeroen P. Broks
-- This software is provided 'as-is', without any express or implied
-- warranty.  In no event will the authors be held liable for any damages
-- arising from the use of this software.
-- Permission is granted to anyone to use this software for any purpose,
-- including commercial applications, and to alter it and redistribute it
-- freely, subject to the following restrictions:
-- 1. The origin of this software must not be misrepresented; you must not
-- claim that you wrote the original software. If you use this software
-- in a product, an acknowledgment in the product documentation would be
-- appreciated but is not required.
-- 2. Altered source versions must be plainly marked as such, and must not be
-- misrepresented as being the original software.
-- 3. This notice may not be removed or altered from any source distribution.
-- </License Block>

-- *import mkl
-- *import audio

mkl.version("Cynthia Johnson - music.lua","22.07.17")
mkl.lic    ("Cynthia Johnson - music.lua","ZLib License")

local mozart = {}

mozart.config = mozart.config or {music=true}



function mozart.play(file,mode)
mozart.config = mozart.config or {music=true}
if mozart.source and (not mozart.config.music) then mozart.file=nil; StopSound(mozart.source) return end -- If music is set not to play, it won't play!
if mozart.source and mozart.file==file then return end -- If the same music is already playing, no need to play it again, right?
if mozart.optional and (not love.filesystem.isFile(file)) then 
   print("File: "..file.." does not exist, but that doesn't matter, as the engine was set to have this as an optional thing anyway")
   return
end   
if mozart.source then StopSound(mozart.source) end
mozart.source = LoadSound(file,true,mode or 'stream')
mozart.source.source.SetLooping(true)
PlaySound(mozart.source)
mozart.file=file
end

function mozart.stop()
if not mozart.source then return end
StopSound(mozart.source)
end




StartMusic = mozart.play
Music = mozart.play



return mozart