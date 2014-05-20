require( "euler/primes" )

local function isAbundant( n )
   return properDivisorSum(n) > n
end


-- determine which numbers are abundant
local Max = 28123
local abundant = {}
for i = 2, Max do
   if isAbundant(i) then
      abundant[i] = true
   end
end

-- determine the sum of numbers than aren't the sum of two abundants
local sum = 3 -- one and two can't be
for n = 3, Max do
   local abSum = false
   for i = 2, math.floor(n/2) do
      j = n - i
      if abundant[i] and abundant[j] then
	 abSum = true
	 break
      end
   end

   if not abSum then
      sum = sum + n
   end
end

return sum
