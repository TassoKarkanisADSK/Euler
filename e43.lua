require( "euler/sundry" )


local function concat( t1, t2 )
    local t3 = { unpack(t1) }
    
    for _,x in ipairs(t2) do
        table.insert( t3, x )
    end
    
    return t3
end


local function reverse( t )
    local r = {}
    for i = #t, 1, -1 do
        table.insert( r, t[i] )
    end
    return r
end


local function choose1( t )
    local func = function()
        for i,_ in ipairs(t) do
            local first = { unpack( t, 1, i-1 ) }
            local rest = { unpack( t, i+1 ) }
            coroutine.yield( t[i], concat(first, rest) )
        end
    end

    return coroutine.wrap( func )
end


local function printTable( msg, t )
    print( msg .. ":" )
    for k,v in pairs(t) do
        print( "  " .. tostring(k) .. " = " .. tostring(v) )
    end
end


local sum = 0

local function countHelper( number, choices, divisors, index )
    if #choices == 1 then
        -- base case
        local n = concat( number, choices )
        n = reverse( n )
        sum = sum + getDigitsNumber( n )
    else
        -- choose one more digit
        for digit,rest in choose1(choices) do
            -- check the divisor
            local n = 1*number[#number-1] + 10*number[#number] + 100*digit
            if n % divisors[index] == 0 then
                countHelper( concat(number,{digit}),
                             rest,
                             divisors,
                             index + 1 )
            end
        end
        
    end
end    


local function count()
    local choices = { 0, 1, 2, 3, 4, 5, 6, 7, 8, 9 }
    local divisors = { 17, 13, 11, 7, 5, 3, 2 }
    
    for digit1,rest in choose1(choices) do
        for digit2,rest in choose1(rest) do
            local number = { digit1, digit2 }
            countHelper( number, rest, divisors, 1 )
        end
    end
end


count()
return sum
