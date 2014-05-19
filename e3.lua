require( "BigNum/BigNum" )

local function isPrime( n )
   local one = BigNum.new( 1 )
   local two = BigNum.new( 2 )
   if n == one then
      return false
   end

   if n == two then
      return true
   end

   local i = two
   while i*i < n do
      if BigNum.gcd(i,n) ~= one then
	 return false
      end
      i = i + one
   end
   return true
end

local function primes( f )
   local n = BigNum.new( 2 )
   local one = BigNum.new( 1 )
   while true do
      if not f(n) then
	 return
      end

      n = n + one
      while not isPrime(n) do
	 n = n + one
      end
   end
end

local n = BigNum.new( "600851475143" )
local factor = 1
local one = BigNum.new( 1 )
local f = function( p )
   if p*p > n then
      return false
   end

   if BigNum.gcd(p,n) ~= one then
      factor = p
      print( "factor:", factor )
      n = n / p

      if isPrime(n) then
	 if n > factor then
	    factor = n
	 end
	 return false
      end
   end

   return true
end

primes( f )

print( "factor:", factor )

