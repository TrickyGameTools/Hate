-- <License Block>
-- ***********************************************************
-- Neil_Libs/Hate.neilbundle/Hate/AltEllipse.lhl/altellipse.lua
-- This particular file has been released in the public domain
-- and is therefore free of any restriction. You are allowed
-- to credit me as the original author, but this is not
-- required.
-- This file was setup/modified in:
-- 2022
-- If the law of your country does not support the concept
-- of a product being released in the public domain, while
-- the original author is still alive, or if his death was
-- not longer than 70 years ago, you can deem this file
-- "(c) Jeroen Broks - licensed under the CC0 License",
-- with basically comes down to the same lack of
-- restriction the public domain offers. (YAY!)
-- ***********************************************************
-- Version 22.07.18
-- </License Block>
--[[
  altellipse.lua
  
  version: 17.07.30
  Copyright (C) 2017 Jeroen P. Broks
  This software is provided 'as-is', without any express or implied
  warranty.  In no event will the authors be held liable for any damages
  arising from the use of this software.
  Permission is granted to anyone to use this software for any purpose,
  including commercial applications, and to alter it and redistribute it
  freely, subject to the following restrictions:
  1. The origin of this software must not be misrepresented; you must not
     claim that you wrote the original software. If you use this software
     in a product, an acknowledgment in the product documentation would be
     appreciated but is not required.
  2. Altered source versions must be plainly marked as such, and must not be
     misrepresented as being the original software.
  3. This notice may not be removed or altered from any source distribution.
]]
return function(mode,x,y,w,h)

  local hw = w/2
  local hh = h/2
  local cx = x + hw
  local cy = y + hw
  hate.graphics.ellipse(mode,cx,cy,hw,hh)
  
end