require( "euler/primes" )


local function isCurious( a, b )
    local s = a % 10
    local t = (a - s) / 10
    local u = b % 10
    local v = (b - u) / 10

    if s == 0 or u == 0 then
        return false
    end

    local f = a / b

    if s == u and t/v == f then
        return true
    elseif s == v and t/u == f then
        return true
    elseif t == u and s/v == f then
        return true
    elseif t == v and s/u == f then
        return true
    else
        return false
    end
end


local a = 1
local b = 1
for i = 10, 98 do
    for j = i + 1, 99 do
        if isCurious(i,j) then
            a = a * i
            b = b * j
        end
    end
end

-- simplify a/b
local f = primeFactorization( a )
for p, m in pairs(f) do
    for i = 1, m do
        if b % p == 0 then
            b = b / p
        end
    end
end

return b
