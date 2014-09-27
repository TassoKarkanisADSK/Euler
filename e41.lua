require( "euler/primes" )

local function number( t )
    local n = 0
    local m = 1
    for i = #t, 1, -1 do
        n = n + m*t[i]
        m = 10 * m
    end
    return n
end


local function copyTable( t )
    local t2 = {}
    
    for k,v in pairs(t) do
        t2[k] = v
    end

    return t2
end


local function orderedPermutations( t, f )
    -- base case
    if #t == 1 then
        f( t )
    end

    for k = 1, #t do
        local t2 = {}
        for i = 1, #t do
            if i ~= k then
                table.insert( t2, t[i] )
            end
        end

        local f2 = function( t3 )
            local t4 = copyTable( t3 )
            table.insert( t4, 1, t[k] )
            f( t4 )
        end

        orderedPermutations( t2, f2 )
    end
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
