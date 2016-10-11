-- for each odd number
   -- if not prime
      -- for each smaller prime
         -- if divides
            -- if quotient is even
               -- root of quotient divided by two is integer
                  -- result

require( "euler/primes" )

local n = 3
while true do
    if not isPrime(n) then
        local found = false

        local i = 1
        while true do
            local p = ithPrime( i )
            if p < n then
                local q = n - p
                if q % 2 == 0 then
                    q = q/2
                    q = math.sqrt( q )
                    local a1,a2 = math.modf( q )
                    if a2 == 0 then
                        found = true
                        break
                    end
                end
            else
                break
            end
            i = i + 1
        end

        if not found then
            break
        end
    end
    
    n = n + 2
end

return n
