
local function ithPrimeGenerator()
   local primes = { 2 }
   
   local computeNextPrime = function()
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
                                     break
                                  end
                                  
                                  n = n + 1
                               end
                            end
   
   local f = function( i )
                -- check if this prime is already computed
                if primes[i] == nil then
                   -- compute primes until we reach this one
                   for j = #primes, i do
                      computeNextPrime()
                   end
                end
                
                return primes[i]
             end
   
   return f
end
ithPrime = ithPrimeGenerator()


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
   
   -- remove the original n again
   f[originalN] = nil
   return f
end
