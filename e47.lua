require( "euler/primes" )


local function has4DPF( n )
    local f = primeFactorization( n )
    local count = 0
    for _,_ in pairs(f) do
        count = count + 1
    end

    return count >= 4
end


local dpf = {}

local n = 2
while true do
    local index = (n % 4) + 1
    dpf[index] =  has4DPF( n )
    if dpf[1] and dpf[2] and dpf[3] and dpf[4] then
        break
    end
    n = n + 1
end

return n - 3
    
