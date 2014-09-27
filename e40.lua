local numDigits = 0
local product = 1
local k = 1
local i = 1
while true do
    local str = tostring( i )
    if k <= numDigits + #str then
        local index = k - numDigits
        local d = tonumber( string.sub(str,index,index) )
        product = product * d
        k = k * 10
        if k > 1000000 then
            break
        end
    end
    
    numDigits = numDigits + #str
    i = i + 1
end

return product
