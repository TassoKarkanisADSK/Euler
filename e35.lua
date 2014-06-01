require( "euler/primes" )

-- compute the primes up to 1 million

local primes = {}
do
    local i = 1
    while true do
        local p = ithPrime( i )
        if p > 1000000 then
            break
        end

        primes[p] = true
        
        i = i + 1
    end
end

local function getDigits( n )
    local digits = {}
    
    while n > 0 do
        local d = n % 10
        table.insert( digits, d )
        n = (n - d) / 10
    end

    return digits
end


local function getRotation( digits, n )
    local len = #digits
    local m = 0
    local power = 1
    for i = 1, len do
        local j = (i + n - 1) % len
        m = m + digits[j + 1] * power
        power = power * 10
    end

    return m
end


local function isCircular( n )
    -- check if n is prime
    if not primes[n] then
        return false
    end

    local digits = getDigits( n )
    for i = 2, #digits do
        local m = getRotation( digits, i - 1 )
        if not primes[m] then
            return false
        end
    end

    return true
end

-- count
local count = 0
for i = 2, 1000000 do
    if isCircular(i) then
        count = count + 1
    end
end

return count
    
