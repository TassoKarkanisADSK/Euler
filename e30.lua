local P = 5

-- compute the powers
local function computePowers()
    local powers = {}
    for i = 0, 9 do
        local n = i ^ P
        powers[i] = n
    end
    return powers
end

local function findMax()
    -- the function we're find the root of 
    local M = 9 ^ P
    local f = function( x )
        local y = 10 ^ x - M*x
        return y
    end
    
    local min = 1
    local max = 8
    for i = 1, 30 do
        local mid = 0.5*(min + max)
        local y = f( mid )
        if y < 0 then
            min = mid
        else
            max = mid  
        end
    end

    local y = 0.5*(min + max)
    return y
end

-- find the stopping number
local y = findMax()
local Max = 10 ^ y

local powers = computePowers()
local total = 0
local i = 2
for i = 2, math.ceil(Max) do
    local n = i
    local sum = 0
    while n > 0 do
        local digit = n % 10
        sum = sum + powers[digit]
        n = (n - digit) / 10
    end

    if sum == i then
        total = total + sum
    end
end

return total
