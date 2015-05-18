require( "euler/primes" )
require( "euler/sundry" )

local function number( t )
    local n = 0
    local m = 1
    for i = #t, 1, -1 do
        n = n + m*t[i]
        m = 10 * m
    end
    return n
end


local function generateNPandigitals( n, f )
    -- make a nice table of digits
    local digits = {}
    for i = 1, n do
        digits[i] = i
    end

    local f2 = function( t )
        local n = number( t )
        f( n )
    end

    orderedPermutations( digits, f2 )
end


local function generatePandigitals( f )
    for n = 1, 9 do
        generateNPandigitals( n, f )
    end
end


local function computeN()
    local N
    
    local f = function( k )
        if isPrime(k) then
            N = k
        end
    end

    generatePandigitals( f )

    return N
end


return computeN()
