-- compute the roots x for x <= 500
local roots = {}
for i = 1, 500 do
    roots[i*i] = i
end

-- initialize the perimeter counts to zero
local perimeters = {}
for i = 1, 1000 do
    perimeters[i] = 0
end

-- accumulate the perimeter solutions
local maxP = 0
for a = 1, 500 do
    for b = a, 500 do
        local c2 = a*a + b*b
        local c = roots[c2]
        if c ~= nil then
            local p = a + b + c
            if p <= 1000 then
                perimeters[p] = perimeters[p] + 1
            end
        end
    end
end

-- find the maximum perimeter count
local j = 1
for i = 2, 1000 do
    if perimeters[i] > perimeters[j] then
        j = i
    end
end

return j
        
    
            
