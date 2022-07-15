-- <License Block>
-- Neil_Libs/Hate.neilbundle/Hate/qgfx2.lhl/qgfx2.lua
-- Quick Graphics 2
-- version: 22.07.15
-- Copyright (C) 2016, 2017, 2022 Jeroen P. Broks
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


local shit = {}

assets = assets or {}

mkl.version("Cynthia Johnson - qgfx2.lua","22.07.15")
mkl.lic    ("Cynthia Johnson - qgfx2.lua","ZLib License")



function LoadImage(file)
  local ret = { ox = 0, oy = 0, t="image", file=file,
              }
  if type(file)=='string' then
     if hate.filesystem.isDirectory(file:upper()) then
       local files = hate.filesystem.getDirectoryItems( file:upper() )
       table.sort(files)
       local l = {}    ret.images = l
       local i,w,h
       for f in each(files) do
           i = hate.graphics.newImage(upper(file.."/"..f))           
           if i then 
              l[#l+1]=i
              w = w or i:getWidth()
              h = h or i:getHeight()
              if w~=w or h~=h then return end 
           end
       end
       if #l==0 then return end
       if hate.filesystem.isFile(file:upper().."/HOTSPOTS.GINI") then
          local w,h = ret.images[1]:getWidth(),ret.images[1]:getHeight()
          local h = ReadIni(file:upper().."/HOTSPOTS.GINI")
          if     h.C("X")=="LEFT"   then ret.ox=0
          elseif h.C("X")=="RIGHT"  then ret.ox=w
          elseif h.C("X")=="CENTER" then ret.ox=w/2
          else   ret.ox = h.C("X").tonumber() or 0 end
          if     h.C("Y")=="UP"   or h.C("Y")=="TOP"    then ret.oy=0
          elseif h.C("Y")=="DOWN" or h.C("Y")=="BOTTOM" then ret.oy=w
          elseif h.C("Y")=="CENTER"                     then ret.oy=h/2
          else   ret.oy = h.C("Y").tonumber() or 0 end
       end   
     else    
       ret.images = {hate.graphics.newImage(upper(file))}
       if not ret.images[1] then return end
     end   
  else 
     ret.images={file} 
  end
  ret.image=ret.images[1]            
  return ret
end

             

function LangFont(langarray)
-- // content comes later
end

DrawLine = hate.graphics.line
Line     = hate.graphics.line


function DrawRect(x,y,w,h,ftype,segs)
hate.graphics.rectangle(ftype or "fill",x,y,w,h,segs or 0)
end Rect=DrawRect


Color = hate.graphics.setColor
SetColor = Color
color = Color

function white() Color(255,255,255) end
function black() Color(  0,  0,  0) end
function red()   Color(255,  0,  0) end
function green() Color(  0,255,  0) end
function blue()  Color(  0,  0,255) end
function ember() Color(255,180,  0) end

shit.LoadImage = LoadImage -- = hate.graphics.newImage,hate.graphics.newImage
CLS = hate.graphics.clear
shit.CLS,shit.cls,shit.Cls,cls,Cls = CLS,CLS,CLS,CLS,CLS

function DrawImage(img,x,y,frame,rad,sx,sy)
local i = (({ ['string'] = function() return assets[img] end,
              ['table']  = function() return img end })[type(img)] or function() error('Unknown image tag type:'..type(img)) end)()
assert(i,"DrawImage("..valstr(img)..","..x..","..y..","..(frame or 1).."): I have no image for "..valstr(img))
assert(i.images[frame or 1] , "DrawImage("..valstr(img)..","..x..","..y..","..(frame or 1).."): Frame out of bounds - I only have "..#i.images.." frame(s)")
-- This setup does not work the way it should, but that will be sorted out later.               
--hate.graphics.push()
--hate.graphics.origin(i.ox,i.oy)
hate.graphics.draw(i.images[frame or 1],x,y,rad or 0,i.scalex or sx or 1, i.scaley or i.scalex or sy or sx or 1,i.ox or 0, i.oy or 0)
--hate.graphics.pop()                   
end 

function ImageSizes(img)
local i = (({ ['string'] = function() return assets[img] end,
              ['table']  = function() return img end ,
              ['nil']    = function() error("I have no image for "..valstr(img)) end }
              )[type(img)])()
local w,h
assert(i,"I have no image for "..valstr(img))
w = i.images[1]:getWidth()
h = i.images[1]:getHeight()
return w,h
end

function ImageWidth(img)
local w,h = ImageSizes(img)
return w
end

function ImageHeight(img)
local w,h = ImageSizes(img)
return h
end

function cpImg(img)
local ret = {}
for k,v in pairs(img) do ret[k] = v end
return ret
end

function Hot(img,x,y)
local i = (({ ['string'] = function() return assets[img] end,
              ['table']  = function() return img end })[type(img)])()
i.ox = x or i.ox
i.oy = y or i.oy
end       

function QHot(img,qtag)
    local iw,ih = ImageSizes(img)
    local hx,hy
    if     qtag=="lt" then hx= 0   hy= 0  
    elseif qtag=='rt' then hx=iw   hy= 0
    elseif qtag=='ct' then hx=iw/2 hy= 0
    elseif qtag=='lc' then hx= 0   hy=ih/2
    elseif qtag=='cc' or
           qtag=='c'  then hx=iw/2 hy=ih/2
    elseif qtag=='rc' then hx=iw   hy=ih/2
    elseif qtag=='lb' then hx= 0   hy=ih
    elseif qtag=='cb' then hx=iw/2 hy=ih
    elseif qtag=='rb' then hx=iw   hy=ih end
    Hot(img,hx,hy)
end    


function HotCenter(img)
local i = (({ ['string'] = function() return assets[img] end,
              ['table']  = function() return img end })[type(img)])()
i.ox=i.image:getWidth()/2
i.oy=i.image:getHeight()/2
end; shit.HotCenter = HotCenter

QText=hate.graphics.print
shit.QText=QText

return shit