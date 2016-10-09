-- table of primes computed so far
local primes = {2}

-- set of primes computed so far
local primesSet = {[2] = true}
   
local function computeNextPrime()
   local n = primes[#primes] + 1
   while true do
	  -- check if n is prime
	  local isPrime = true
	  local i = 1
	  while primes[i]*primes[i] <= n do
		 if n % primes[i] == 0 then
			isPrime = false
			break
		 end
		 i = i + 1
	  end
	  
	  if isPrime then
		 table.insert( primes, n )
		 primesSet[n] = true
		 break
	  end
	  
	  n = n + 1
   end
end


function ithPrime(i)
   -- check if this prime is already computed
   if primes[i] == nil then
	  -- compute primes until we reach this one
	  for j = #primes, i do
		 computeNextPrime()
	  end
   end
   
   return primes[i]
end


local function primeFactor( n )
   local i = 1
   while true do
      -- if n is prime, return it
      local p = ithPrime( i )
      if p*p > n then
         return n
      end
      
      -- check the next prime
      if n % p == 0 then
         return p
      end
      
      i = i + 1
   end
end


function isPrime(n)
   -- check if we have already computed this far
   local p = primes[#primes]
   if n <= p then
	  local q = primesSet[n]
	  if q then
		 return true
	  else
		 return false
	  end
   end

   -- find a prime factor
   local q = primeFactor(n)
   return q == n
end


function primeFactorization( n )
   local originalN = n
   local f = {}
   while n > 1 do
      -- find some prime factor and store it
      local p = primeFactor( n )
      
      if f[p] == nil then
         f[p] = 1
      else
         f[p] = f[p] + 1
      end
      
      -- reduce n
      n = n / p
   end
   
   -- remove the original n again (unless n is prime)
   f[originalN] = nil
   if next(f) == nil then
       f[originalN] = 1
   end
   
   return f
end


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


function properDivisorSum( n )
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
