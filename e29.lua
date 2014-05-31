require( "euler/Num" )

-- generate all the powers
local numbers = {}
for i = 2, 100 do
    local n = Num( i )
    local m = n
    for j = 1, 99 do
        m = m * n
        numbers[tostring(m)] = true
    end
end

-- compute the sign
local count = 0
for _, _ in pairs(numbers) do
    count = count + 1
end

return count
