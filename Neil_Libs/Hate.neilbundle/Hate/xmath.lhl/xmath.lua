-- <License Block>
-- ***********************************************************
-- Neil_Libs/Hate.neilbundle/Hate/xmath.lhl/xmath.lua
-- This particular file has been released in the public domain
-- and is therefore free of any restriction. You are allowed
-- to credit me as the original author, but this is not
-- required.
-- This file was setup/modified in:
-- 2017, 2022
-- If the law of your country does not support the concept
-- of a product being released in the public domain, while
-- the original author is still alive, or if his death was
-- not longer than 70 years ago, you can deem this file
-- "(c) Jeroen Broks - licensed under the CC0 License",
-- with basically comes down to the same lack of
-- restriction the public domain offers. (YAY!)
-- ***********************************************************
-- Version 22.07.17
-- </License Block>
--[[
        xmath.lua
	(c) 2017 Jeroen Petrus Broks.
	
	This Source Code Form is subject to the terms of the 
	Mozilla Public License, v. 2.0. If a copy of the MPL was not 
	distributed with this file, You can obtain one at 
	http://mozilla.org/MPL/2.0/.
        Version: 17.07.29
]]
function highest(a1,a2)
   local ret=nil
   local a = {a1,a2} 
   for i in each(a) do
       if (not ret) or ret<i then ret=i end
   end
   return ret or 0
end