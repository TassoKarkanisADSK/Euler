require("euler/primes")


local function topRight(i)
    local j = 2*i - 1
    return j*j - 3*j + 3
end


local function topLeft(i)
    local j = 2*i - 1
    return j*j - 2*j + 2
end


local function bottomLeft(i)
    local j = 2*i - 1
    return j*j - j + 1
end


local function bottomRight(i)
    local j = 2*i - 1
    return j*j
end


local function run()
    -- initialize to i = 1
    local prime = 0
    local notPrime = 1

    local i = 2
    while true do
        -- evaluate the new corners
        local t = {}
        table.insert(t, topRight(i))
        table.insert(t, topLeft(i))
        table.insert(t, bottomLeft(i))
        table.insert(t, bottomRight(i))

        -- increment the counts
        for j = 1, #t do
            if isPrime(t[j]) then
                prime = prime + 1
            else
                notPrime = notPrime + 1
            end
        end

        -- check the fraction
        local fraction = prime/(prime + notPrime)
        if fraction < 0.1 then
            return 2*i - 1
        end

        -- increment
        i = i + 1
    end
end

local count = run()
print(count)
