local M = 1e10
local sum = 0
for i = 1, 1000 do
    local t = 1
    for j = 1, i do
        t = (t*i) % M
    end

    sum = (sum + t) % M
    
    i = i + 1
end

return sum
