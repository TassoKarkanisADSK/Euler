require( "euler/primes" )

local longestCount = 0
local longestSum = 0
local longestStart = 0

local sums = {}
local i = 1
local j = 1
while true do
    -- compute the next prime
    local p = ithPrime( j )
    if p >= 1e6 then
        break
    end

    -- update all the running sums
    for k = i, #sums do
        sums[k] = sums[k] + p
        if sums[k] >= 1e6 then
            -- this sum is too large and no longer valid
            i = k + 1
        elseif isPrime(sums[k]) then
            local count = j - k + 1
            if count > longestCount then
                longestCount = count
                longestSum = sums[k]
                longestStart = ithPrime( k )
            end
        end
    end

    -- add another sum
    table.insert( sums, p )

    j = j + 1
end

return longestSum
