require( "euler/primes" )


-- make a table of primes
local isPrime = {}
for i = 1,1000 do
   local p = ithPrime( i )
   isPrime[p] = true
end


local function consecutivePrimes( a, b )
   local n = 0
   while true do
      local f = n*n + a*n + b
      if not isPrime[f] then
         break
      end
      n = n + 1
   end
   
   return n
end


-- iterate
local maxPrimes = 0
local coefficientProduct
for i = 1,1000 do
   -- b must be positive (I think) and prime
   local b = ithPrime( i )
   if b < 1000 then
      for a = -999,999 do
         -- n = 1 -> 1 + a + b is prime
         if isPrime[1 + a + b] then
            local numPrimes = consecutivePrimes( a, b )
            if numPrimes > maxPrimes then
               maxPrimes = numPrimes
               coefficientProduct = a * b
            end
         end
      end
   end
end

return coefficientProduct