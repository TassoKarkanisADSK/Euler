local getPentagonal
local isPentagonal

do
    local P = { 1 }
    local Prev = { [1] = true }
    
    getPentagonal = function( i )
        for j = #P + 1, i do
            local p = j*(3*j - 1)/2
            P[j] = p
            Prev[p] = true
        end
        return P[i]
    end

    isPentagonal = function( p )
        while P[#P] < p do
            getPentagonal( #P + 1 )
        end
        return Prev[p]
    end
end

local Pj = nil
local Pk = nil
local D = nil

local j = 1
while true do
    j = j + 1

    local stop = true
    
    local pj = getPentagonal( j )
    for k = j-1, 1, -1 do
        -- check to see if we can abort
        local pk = getPentagonal( k )
        local diff = pj - pk
        
        if D ~= nil and diff > D then
            break
        end

        -- check that sum and difference
        stop = false
        local sum = pj + pk
        if isPentagonal(sum) and isPentagonal(diff) and (d == nil or diff < D) then
            Pj = pj
            Pk = pk
            D = diff
        end
    end

    if stop then
        break
    end
end

return D
