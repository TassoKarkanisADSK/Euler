
-- compute the digit factorials
local factorial = {}
factorial[0] = 1
for i = 1, 9 do
    factorial[i] = factorial[i-1] * i
end

local function digitSum( n )
    local sum = 0
    while n > 0 do
        local d = n % 10
        sum = sum + factorial[d]
        n = (n - d) / 10
    end
    return sum
end


local sum = 0
for i = 10, 10000000 do
    if i == digitSum(i) then
        sum = sum + i
    end
end

return sum
