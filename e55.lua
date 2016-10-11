require("BigNum/BigNum")


local function isPalindrome(n)
    local str = tostring(n)
    local rev = string.reverse(str)
    return rev == str
end


local function isLychrel(num)
    local n = BigNum.new(num)
    for i = 1, 49 do
        local n2 = BigNum.new(string.reverse(tostring(n)))
        local n3 = n + n2

        if isPalindrome(n3) then
            return false
        end

        n = n3
    end

    return true
end


local function run()
    local count = 0
    for i = 1, 9999 do
        if isLychrel(i) then
            count = count + 1
        end
    end
    return count
end


return run()
