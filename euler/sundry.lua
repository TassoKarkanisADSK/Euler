-- return the base 10 digits of a number as a table
function getDigits( n )
    local digits = {}
    
    while n > 0 do
        local d = n % 10
        table.insert( digits, d )
        n = (n - d) / 10
    end

    return digits
end
