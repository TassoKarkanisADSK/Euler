require( "euler/sundry" )
require( "euler/primes" )

local function permutations( t )
    local f = function()
        -- base case
        if #t == 1 then
            coroutine.yield( t )
        end
        
        for k = 1, #t do
            local t2 = {}
            for i = 1, #t do
                if i ~= k then
                    table.insert( t2, t[i] )
                end
            end

            for t3 in permutations(t2) do
                local t4 = copyTable( t3 )
                table.insert( t4, 1, t[k] )
                coroutine.yield( t4 )
            end
        end
    end

    return coroutine.wrap( f )
end


local function printTable( msg, t )
    print( msg )
    for i,v in ipairs(t) do
        print( "  " ..tostring(i) .. ": " .. tostring(v) )
    end
end


local function getSequences( t )
    local f = function()
        for i = 2, #t do
            local diff = t[i] - t[1]

            local seq = { t[1] }
            local k = 1
            for j = 2, #t do
                if t[j] - t[k] == diff then
                    table.insert( seq, t[j] )
                    k = j
                end
            end
                    
            coroutine.yield( seq )
        end
    end

    return coroutine.wrap( f )
end


-- determine the 4 digit primes
local primes = {}
local isprime = {}
do
    local i = 1
    while true do
        local p = ithPrime( i )
        if p > 9999 then
            break
        elseif p >= 1000 then
            table.insert( primes, p )
            isprime[p] = true
        end
        i = i + 1
    end
end

-- check each one for 4 different permutations
for _,p in ipairs(primes) do
    -- get all the permutations
    local perms = { p }

    for q in permutations(getDigits(p)) do
        q = getDigitsNumber( q )
        -- if the permutations is prime and unique, store it
        if q > p and isprime[q] then
            local found = false
            for _,p1 in ipairs(perms) do
                if q == p1 then
                    found = true
                    break
                end
            end
            if not found then
                table.insert( perms, q )
            end
        end
    end

    if #perms >= 3 then
        table.sort( perms )
        if perms[1] == p and perms[1] ~= 1487 then
            for seq in getSequences(perms) do
                if #seq >= 3 then
                    local n = 0
                    n = n + seq[1]*1e8
                    n = n + seq[2]*1e4
                    n = n + seq[3]
                    return n
                end
            end
        end
    end
end
    
