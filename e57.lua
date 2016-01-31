require("BigNum/BigNum")


local function firstP()
    return { n = BigNum.new(3), d = BigNum.new(2) }
end


local function nextP(p)
    -- add 1
    p = { n = p.n + p.d, d = p.d }

    -- invert
    p = { n = p.d, d = p.n }

    -- add 1
    p = { n = p.n + p.d, d = p.d }

    return p
end


local function run()
    local count = 0
    local p = firstP()

    for i = 2, 1000 do
        p = nextP(p)

        if #tostring(p.n) > #tostring(p.d) then
            count = count + 1
        end
    end

    return count
end

local count = run()
print(count)
