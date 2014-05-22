require( "euler/Num" )

local function factorial( n )
   -- base case
   if n == 1 then
      return Num.alloc( 1 )
   else
      return factorial(n-1) *  Num.alloc(n)
   end
end


local f100 = factorial( 100 )
local sum = 0
for i = 1, #f100 do
   sum = sum + f100[i]
end

return sum