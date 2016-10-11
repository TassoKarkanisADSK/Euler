require( "euler/primes" )


local function evaluate(a)
    local val = 1
    for k,v in pairs(a) do
        val = val * (k ^ v)
    end
    return val
end


local function printNum(t)
    print("c:", evaluate(t))
    for k,v in pairs(t) do
        print(" k:", k, "v:", v)
    end
end


local function multiply(a, b)
    for k,v in pairs(b) do
        if a[k] == nil then
            a[k] = v
        else
            a[k] = a[k] + v
        end
    end
    return a
end


local function divide(a, b)
    for k,v in pairs(b) do
        assert(a[k] ~= nil)
        assert(a[k] >= v)

        if a[k] == v then
            a[k] = nil
        else
            a[k] = a[k] - v
        end
    end
    return a
end


local function greater(a, n)
    local val = 1
    for k,v in pairs(a) do
        for i = 1, v do
            val = val * k
            if val > n then
                return true
            end
        end
    end
    return false
end


local factorizations = {}

local function factorization(n)
    if factorizations[n] == nil then
        local t = primeFactorization(n)
        factorizations[n] = t
    end

    return factorizations[n]
end


local function evalFactorial(n)
    local f = {}
    for i = 2, n do
        local t = factorization(i)
        multiply(f, t)
    end
    return f
end


local function evalCombinations(n, r)
    -- a base case
    if n == r then
        return {}
    end
    
    -- note: cancel the r! in numerator and denominator

    -- evaluate the remaining numerator
    local numerator = {}
    for k = r + 1, n do
        local f = factorization(k)
        multiply(numerator, f)
    end

    -- evaluate the remaining denominator
    local denominator = evalFactorial(n - r)

    return divide(numerator, denominator)
end



local function run()
    local count = 0
    for n = 1, 100 do
        for r = 1, n do
            local t = evalCombinations(n, r)
            if greater(t, 1000000) then
                -- print(string.format("greater: (%d,%d)",n,r))
                count = count + 1
            end
        end
    end

    return count
end


return run()
