require( "euler/primes" )

local function isAmicable( n )
   local m = properDivisorSum( n )
   return m ~= n and n == properDivisorSum(m)
end


local sum = 0
for i = 2, 9999 do
   if isAmicable(i) then
      sum = sum + i
   end
end

return sum
