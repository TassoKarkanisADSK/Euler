require( "euler/primes" )

local function triangular( f )
   local t = 1 
   local index = 1
   while true do
      if not f( t ) then
	 return
      end
      
      index = index + 1
      t = t + index
   end
end

local function numFactors( n )
   local f = primeFactorization( n )
   local factors = 1
   for p, mult in pairs(f) do
      factors = factors * (mult + 1)
   end
   
   if factors == 1 then
      factors = 2
   end

   return factors
end


local function highlyDivisible( n )
   return numFactors(n) > 500
end


local n
triangular( function(t)
	       if highlyDivisible(t) then
		  n = t
		  return false
	       else
		  return true
	       end
            end )

return n
