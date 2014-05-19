local function primes( f )
   local p = { 2 }
   if not f(2) then
      return
   end
   
   local n = 2
   while true do
      n = n + 1
      
      local isPrime = true
      for _,v in ipairs(p) do
	 if n % v == 0 then
	    isPrime = false
	    break
	 end
      end
      
      if isPrime then
	 table.insert( p, n )
	 if not f(n) then
	    return
	 end
      end
   end
end

local i = 0
local n
local f = function( p ) 
   i = i + 1
   if i == 10001 then
      n = p
      return false
   end
   return true
end
primes( f )
print( "n:", n )
