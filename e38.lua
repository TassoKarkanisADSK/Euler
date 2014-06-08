require( "euler/primes" )

-- make a table mapping the digits to 0 and the first 9 primes 
local digits = {}
digits['0'] = 0
local Product = 1
for i = 1, 9 do
    local p = ithPrime( i )
    Product = Product * p
    digits[tostring(i)] = p
end


local function panDigital( str )
    -- special case for strings that are too long
    local len = #str
    if len > 9 then
        return true, false
    end

    -- special case strings too short
    if len < 9 then
        return false, false
    end

    -- one more check for size
    local p = tonumber( str )
    if p > 987654321 then
        return true, false
    end

    -- check by computing the digit products
    local prod = 1
    for i = 1, 9 do
        local d = string.sub( str, i, i )
        prod = prod * digits[d]
    end

    local isPD = prod == Product
    return false, isPD
end


local largest = 0
local n = 2
while true do
    local m = 1
    while true do
        -- form the string
        local str = ""
        for i = 1, n do
            str = str .. tostring(m * i)
        end

        -- check it
        local tooBig, isPD = panDigital( str )
        if tooBig then
            break
        end

        if isPD then
            local q = tonumber( str )
            if q > largest then
                largest = q
            end
        end

        m = m + 1
    end

    if m == 1 then
        break
    end

    n = n + 1
end

return largest
