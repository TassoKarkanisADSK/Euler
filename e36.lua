require( "euler/sundry" )

local function isPalindrome( n )
    -- eliminate n such that the reverse has a leading zero
    if n % 10 == 0 then
        return false
    end

    -- compute the reverse
    local digits = getDigits( n )
    local power = 1
    local m = 0
    for i = #digits, 1, -1 do
        local d = digits[i]
        m = m + d * power
        power = power * 10
    end

    return m == n
end


local function isPalindrome2( n )
    -- eliminate palindromes with leading zeros
    if n % 2 == 0 then
        return false
    end
    
    -- get the base 2 representation as a string
    local zeroOne = { "0", "1" }
    local str = ""
    while n > 0 do
        local d = n % 2
        n = (n - d) / 2
        str = str .. zeroOne[d + 1]
    end

    return str == string.reverse(str)
end


local sum = 0
for i = 1, 999999 do
    if isPalindrome(i) and isPalindrome2(i) then
        sum = sum + i
    end
end

return sum
