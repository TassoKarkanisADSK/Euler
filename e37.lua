require( "euler/primes" )

local function isTruncatable( p, primes )
    local str = tostring( p )

    -- ignore 1-digit numbers
    if #str == 1 then
        return false
    end

    -- check that all the truncations are prime
    for i = 2, #str do
        -- check the suffix
        local str1 = string.sub( str, i )
        if not primes[tonumber(str1)] then
            return false
        end

        -- check the prefix
        local str2 = string.sub( str, 1, i - 1 )
        if not primes[tonumber(str2)] then
            return false
        end
    end

    return true
end


local i = 1
local sum = 0
local count = 0
local primes = {}
while count < 11 do
    local p = ithPrime( i )
    primes[p] = true
    if isTruncatable(p, primes) then
        count = count + 1
        sum = sum + p
    end
    i = i + 1
end

return sum


