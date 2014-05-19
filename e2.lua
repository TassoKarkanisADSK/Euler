local function fib( f )
   local a = 1
   if not f(1,a) then
      return
   end

   local b = 2
   if not f(2,b) then
      return
   end
   
   local i = 3
   while true do
      local n = a + b
      if not f(i,n) then
	 return
      end
      
      a = b
      b = n
      i = i + 1
   end
end


local sum = 0
local f = function( i, n )
   if n > 4000000 then
      return false
   end

   if n % 2 == 0 then
      sum = sum + n
   end
   return true
end

fib( f )
print( "sum:", sum )
