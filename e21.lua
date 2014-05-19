require( "euler/primes" )

local function nextCombination( c, mults )
   local incremented = false
   
   for i = 1, #c do
      c[i] = c[i] + 1
      if c[i] <= mults[i] then
         incremented = true
         break
      end

      c[i] = 0
   end

   return incremented
end


local function properDivisorSum( n )
   local f = primeFactorization( n )

   -- make arrays of the primes and mults
   local primes = {}
   local mults = {}
   for p,m in pairs(f) do
      table.insert( primes, p )
      table.insert( mults, m )
   end

   if #primes == 0 then
      return 1
   end

   -- initialize a combination
   local c = {}
   for i = 1, #primes do
      c[i] = 0
   end

   -- find the sum
   local sum = 0
   while true do
      local factor = 1
      for i = 1, #c do
         factor = factor * (primes[i] ^ c[i])
      end

      if factor ~= n then
         sum = sum + factor
      end
      
      if not nextCombination(c,mults) then
         break
      end
   end

   return sum
end


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