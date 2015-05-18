local function triangulars()
    local f = function()
        local n = 1
        while true do
            local t = n*(n + 1)/2
            coroutine.yield( t )
            n = n + 1
        end
    end
    return coroutine.wrap( f )
end


local function pentagonals()
    local f = function()
        local n = 1
        while true do
            local t = n*(3*n - 1)/2
            coroutine.yield( t )
            n = n + 1
        end
    end
    return coroutine.wrap( f )
end


local function hexagonals()
    local f = function()
        local n = 1
        while true do
            local t = n*(2*n - 1)
            coroutine.yield( t )
            n = n + 1
        end
    end
    return coroutine.wrap( f )
end


local t = triangulars()
local p = pentagonals()
local h = hexagonals()

local a = t()
local b = p()
local c = h()

local count = 0
while true do
    if a == b and b == c then
        count = count + 1
        print( "a:", a )
        print( "count:", count )
    end

    if count == 3 then
        return a
    end
    
    if a <= b and a <= c then
        a = t()
    elseif b <= a and b <= c then
        b = p()
    else
        c = h()
    end


    print( "a:", a, "b:", b, "c:", c )
end
        
    
