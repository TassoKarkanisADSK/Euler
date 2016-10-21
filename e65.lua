require("euler/assert")
require("BigNum/BigNum")

local function getSequence(n)
    local seq = {2}
    if n < 2 then
        return seq
    end
    
    for i = 2, n do
        local k
        if i % 3 == 0 then
            k = 2*i/3
        else
            k = 1
        end
        table.insert(seq, k)
    end
    return seq
end


local function getConvergent(n)
    local seq = getSequence(n)
    local num = BigNum.new(seq[#seq])
    local denom = BigNum.new(1)
    for i = #seq - 1, 1, -1 do
        local tmp = seq[i]*num + denom
        denom = num
        num = tmp
    end

    return num, denom
end


local function test()
    -- check the sequence generation
    for i = 1, 50 do
        local seq = getSequence(i)
        assert(#seq == i, "size of seq " .. i)
    end

    local seq = getSequence(10)
    assert(seq[1] == 2, "first element")
    assert(seq[2] == 1, "second element")
    assert(seq[3] == 2, "third element")
    assert(seq[4] == 1, "fourth element")
    assert(seq[5] == 1, "fifth element")
    assert(seq[6] == 4, "sixth element")
    assert(seq[7] == 1, "seventh element")
    assert(seq[8] == 1, "eighth element")
    assert(seq[9] == 6, "ninth element")
    assert(seq[10] == 1, "ninth element")

    -- for i = 1, 10 do
    --     local num, denom = getConvergent(i)
    --     print(string.format("%d: %d/%d", i, tostring(num), tostring(denom)))
    -- end

    -- check convergents
	local expected = {{2,1}, {3,1}, {8,3}, {11,4}, {19,7}, {87,32}}
	for i = 1, #expected do
	   local num, denom = getConvergent(i)
	   assert(num == BigNum.new(expected[i][1]), "num " .. i)
	   assert(denom == BigNum.new(expected[i][2]), "denom " .. i)
	end
end


local function solve()
	local num = getConvergent(100)
	num = tostring(num)
	local sum = 0
	for i = 1, #num do
		local d = num:sub(i,i)
		sum = sum + tonumber(d)
	end
    return sum
end


return {
   test = test,
   solve = solve
}
