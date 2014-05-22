require( "euler/Num" )

local f1 = Num.alloc( 1 )
local f2 = Num.alloc( 1 )
local i = 2
while true do
   i = i + 1
   local f = f1 + f2
   if #f == 1000 then
      break
   end

   f1 = f2
   f2 = f
end

return i