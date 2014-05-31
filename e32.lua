require( "euler/primes" )

local function clear( digits )
    for i = 1, 9 do
        digits[i] = false
    end
end

local function check( n, digits )
    while n > 0 do
        local d = n % 10
        if d == 0 then
            return false
        end

        if digits[d] then
            return false
        end

        digits[d] = true

        n = (n - d) / 10
    end

    return true
end

local function isPan( digits )
    for i = 1, 9 do
        if not digits[i] then
            return false
        end
    end

    return true
end

-- compute the possible factors
local Min = 1
local Max = 10000

local digits = {}
local factors = {}
for i = Min, Max do
    clear( digits )
    if check(i,digits) then
        table.insert( factors, i )
    end
end

-- compute the products
local pandigital = {}
local length = #factors
for i = 1, length do
    local a = factors[i]
    clear( digits )
    check( a, digits )

    for j = 1, length do
        local b = factors[j]
        clear( digits )
        local prod = a * b

        if check(b,digits) and check(a,digits) and check(prod,digits) then
            if isPan(digits) then
                pandigital[prod] = true
            end
        end
    end
end

local sum = 0
for n,_ in pairs(pandigital) do
    sum = sum + n
end

return sum
