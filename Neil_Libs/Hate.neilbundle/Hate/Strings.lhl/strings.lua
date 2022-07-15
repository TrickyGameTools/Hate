-- <License Block>
-- Neil_Libs/Hate.neilbundle/Hate/Strings.lhl/strings.lua
-- Strings
-- version: 22.07.15
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

--[[
function prefixed(a,b)
     return left(a,len(b)) == b
end

function suffixed(a,b)
     return right(a,len(b)) == b
end
]]
prefixed = Neil.Globals.Prefixed
suffixed = Neil.Globals.Suffixed 


mkl.version("Cynthia Johnson - strings.lua","22.07.15")
mkl.lic    ("Cynthia Johnson - strings.lua","ZLib License")