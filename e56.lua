require("BigNum/BigNum")


local function digitSum(n)
    local sum = 0
    local str = tostring(n)
    for i = 1, #str do
        local digit = string.sub(str,i,i)
        local digit = tonumber(digit)
        sum = sum + digit
    end
    return sum
end


local function run()
    local maxSum = 0
    for i = 2, 99 do
        print("i:", i)
        local n = BigNum.new(i)
        local m = n
        for j = 2, 99 do
            local sum = digitSum(m)
            if sum > maxSum then
                maxSum = sum
            end

            m = m * n
        end
    end
    return maxSum
end


local count = run()
print(count)
