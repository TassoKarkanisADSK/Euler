local function digitString(x)
    local xstr = tostring(x)
    local str = ""

    for d = 0, 9 do
        local dstr = tostring(d)
        local count = 0
        for i = 1, #xstr do
            if string.sub(xstr,i,i) == dstr then
                count = count + 1
            end
        end

        if count > 0 then
            str = str .. string.format("(%s,%d)", dstr, count)
        end
    end

    return str
end


local function check(x)
    local s1 = digitString(x)
    for m = 2,6 do
        local s2 = digitString(m * x)
        if s1 ~= s2 then
            return false
        end
    end

    return true
end


local function run()
    local digits = 0

    while true do
        digits = digits + 1
        local min = 10 ^ (digits - 1)
        local max = 10 ^ digits - 1
        for x = min, max do
            local str = tostring(x)
            local str2 = tostring(6 * x)
            if #str ~= #str2 then
                break
            end
            
            local c = check(x)
            if c then
                return x
            end
        end
    end
end

local x = run()
print(x)
