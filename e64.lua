require("euler/assert")

local function getPeriod(n, t)
   -- print("n: " .. n)
   local r = math.floor(math.sqrt(n))

   -- squares have a zero period
   if r*r == n then
	  return 0
   end

   -- let s be the subtrahend of the expression, and d be the divisor
   table.insert(t, r)
   local s = r
   local d = 1
   -- print("initial s: " .. s)
   -- print("initial d: " .. d)

   -- let p be the period
   local p = 0
   while s ~= 0 do
	  p = p + 1
	  local d1 = (n - s*s)/d
	  local a1 = math.floor((r + s)/d1)
	  local s1 = a1*d1 - s
	  table.insert(t, a1)

	  -- print(" a: " .. a1)
	  -- print(" d1: " .. d1)
	  -- print(" s1: " .. s1)

	  -- check for termination
	  if d1 == 1 and s1 == r then
		 break
	  end

	  d = d1
	  s = s1
   end

   return p
end


local function join(t)
   local str = "("
   local first = true
   for _, val in ipairs(t) do
	  local s
	  if first then
		 s = tostring(val)
		 first = false
	  else
		 s = "," .. tostring(val)
	  end
	  str = str .. s
   end
   str = str .. ")"
   return str
end


local function test()
end


local function solve()
   local oddCount = 0
   for i = 2, 10000 do
	  local t = {}
	  local p = getPeriod(i, t)
	  if p % 2 == 1 then
		 oddCount = oddCount + 1
	  end

	  -- print(string.format("n(%d) period(%d) fraction: %s", i, p, join(t)))
   end
   return oddCount
end


return {
   test = test,
   solve = solve
}
