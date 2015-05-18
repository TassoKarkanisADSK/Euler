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


-- return the number corresponding to the digits in the table
function getDigitsNumber( t )
    local n = 0
    
    local mult = 1
    for i = #t, 1, -1 do
        n = n + mult * t[i]
        mult = mult * 10
    end

    return n
end

-- call f with the ordered permutations of table t
function copyTable( t )
    local t2 = {}
    
    for k,v in pairs(t) do
        t2[k] = v
    end

    return t2
end


function orderedPermutations( t, f )
    -- base case
    if #t == 1 then
        f( t )
    end

    for k = 1, #t do
        local t2 = {}
        for i = 1, #t do
            if i ~= k then
                table.insert( t2, t[i] )
            end
        end

        local f2 = function( t3 )
            local t4 = copyTable( t3 )
            table.insert( t4, 1, t[k] )
            f( t4 )
        end

        orderedPermutations( t2, f2 )
    end
end
