local function primes( f )
   local count = 1
   if not f(count,2) then
      return
   end
   
   local p = { 2 }

   local i = 3
   while true do
      -- find the next prime
      local isPrime = true
      -- divide by all previous primes
      for _, v in ipairs( p ) do
         -- stop when exceeding the square
         if v*v > i then
            break
         end

         if i % v == 0 then
            isPrime = false
            break
         end
      end

      if isPrime then
         -- we've found another one
         count = count + 1
         table.insert( p, i )

         if not f(count,i) then
            return
         end
      end
      
      i = i + 1
   end
end


local sum = 0
primes( function(i,p)
           if p < 2000000 then
              sum = sum + p
              print( "p:", p, "sum:", sum )
              return true
           else
              return false
           end
        end )


print( "sum:", sum )