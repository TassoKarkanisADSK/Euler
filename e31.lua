-- count with limits and add up the result
local Value = { 1, 2, 5, 10, 20, 50, 100, 200 }
local Max = { 200, 100, 40, 20, 10, 4, 2, 1 }


local function increment( N, n )
    value = Value[n]
    for i = n, 8 do
        N[i] = N[i] + 1
        if N[i] <= Max[i] then
            value = value - Value[i]
            return value
        else
            value = value + (N[i] - 1)*Value[i]
            N[i] = 0
        end
    end

    return nil
end


local function nextTotal( N )
    -- redistribute the value upwards in a minimal way
    local value = 0
    local incremented = false
    for i = 1, 8 do
        if value >= Value[i] then
            local rem = increment( N, i )
            if rem == nil then
                break
            end
            
            incremented = true
            value = value - Value[i] + rem
            break
        else
            value = value + N[i]*Value[i]
            N[i] = 0
        end
    end

    -- check if we're at the end
    if not incremented then
        return false
    end

    -- add the remaining value back in
    for i = 1, 8 do
        -- compute this digit
        local digit = math.floor( value / Value[i] )

        -- enforce the max
        if digit > Max[i] then
            digit = Max[i]
        end

        N[i] = digit
        value = value - digit*Value[i]
        
        -- stop if we ran out of value
        if value == 0 then
            break
        end
    end

    return true
end


local N = { 200, 0, 0, 0, 0, 0, 0, 0 }
local count = 0
local i = 0
while true do
    count = count + 1
    local ok = nextTotal( N )
    if not ok then
        break
    end
    
end

return count


