require( "euler/primes" )

local familySize = 8

local function checkFamily(str)
    local count = 0
    local first = nil
    for d = 0, 9 do
        -- replace all 'x' with the digit d
        local str2 = ""
        for i = 1, #str do
            local c = string.sub(str, i, i)
            if c == "x" then
                c = tostring(d)
            end
            str2 = str2 .. c
        end

        -- ignore numbers with leading zeros
        if string.sub(str2, 1, 1) ~= "0" then
            local n = tonumber(str2)
            if n >= 2 and isPrime(n) then
                if first == nil then
                    first = n
                end
                count = count + 1
            end
        end
    end

    if count == 8 then
        print(first)
        os.exit(0)
    end
end


local function compute3(numDigits, numRepl, n)
    -- print(string.format("numDigits(%d) numRepl(%d) n(%d)", numDigits, numRepl, n))

    
    -- add replacements to n

    -- There is a slot for each of the digits fixed by n, and a slot
    -- before and after each of those slots.
    local numFixed = numDigits - numRepl
    local numSlots = 2*numFixed + 1

    -- make an empty table of slots
    local slots = {}
    for i = 1, numSlots do
        table.insert(slots, "")
    end

    -- insert the fixed digits in the even slots
    local fmt = string.format("%%0%dd", numFixed)
    local fixedStr = string.format(fmt, n)
    for i = 1, numFixed do
        local digit = string.sub(fixedStr, i, i)
        slots[2*i] = digit
    end

    local checked = {}

    -- count to determine the locations of the replacements
    local numReplSlots = numFixed + 1
    for m = 0, numReplSlots ^ numRepl - 1 do
        -- insert the replacements into the slots
        local n = m
        for i = 1, numRepl do
            local k = n % numReplSlots
            n = n - k
            n = n / numReplSlots
            local j = 2*k + 1
            slots[j] = slots[j] .. "x"
        end

        -- form the number string
        local str = ""
        for i = 1, numSlots do
            str = str .. slots[i]
        end

        if not checked[str] then
            checked[str] = true
            checkFamily(str)
        end

        -- clear the replacement slots
        for i = 0, numFixed do
            slots[2*i + 1] = ""
        end
    end
end


local function compute2(numDigits, numRepl)
    -- count through the remaining digits
    local digits = numDigits - numRepl
    local min = 10 ^ (digits - 1)
    local max = 10 ^ digits - 1
    for n = min, max do
        compute3(numDigits, numRepl, n)
    end
end


local function compute1(numDigits)
    for numRepl = 1, numDigits - 1 do
        compute2(numDigits, numRepl)
    end
end


local function run()
    local numDigits = 2
    while true do
        compute1(numDigits)
        numDigits = numDigits + 1
    end
end


run()
