require("euler/assert")


local function digitSum(n)
   local sum = 0
   while n > 0 do
	  local m = n % 10
	  sum = sum + m
	  n = n - m
	  n = n / 10
   end
   return sum
end


local function digitCount(n)
   local count = 0
   while n > 0 do
	  count = count + 1
	  local d = n % 10
	  n = (n - d)/10
   end
   return count
end


local function digitEncode(n)
   -- an array of digit multiplicities
   local mult = {}
   for i = 1, 10 do
	  mult[i] = 0
   end
   
   while n > 0 do
	  -- compute the digit
	  local d = n % 10

	  -- update the multiplicity array
	  mult[d + 1] = mult[d + 1] + 1

	  -- update n
	  n = n - d
	  n = n / 10
   end

   -- make a string defining the multiplicities
   local str = ""
   for i = 1, 10 do
	  str = str .. string.format("%d:", mult[i])
   end
   return str
end


local function test()
   assert(digitSum(10) == 1, "sum 10: %d", digitSum(10))
   assert(digitSum(263) == 11, "sum 263: %d", digitSum(263))
   
   assert(digitCount(1) == 1, "digit count 1")
   assert(digitCount(32) == 2, "digit count 2")
   assert(digitCount(1023) == 4, "digit count 3")
   assert(digitCount(102011349) == 9, "digit count 4")
end


local function solve()
   -- make a map of digit-permuted cubes
   local count
   local map = {}
   local n = 1
   while true do
   	  -- compute the cube
   	  local c = n * n * n
	  -- print("n: " .. n .. "  c: " .. c)

	  -- stopping condition
	  if count ~= nil and digitCount(c) > count then
		 break
	  end
	  
	  -- map it under an order-preserving encoding of the digit
	  local s = digitEncode(c)
	  if map[s] == nil then
		 map[s] = {}
	  end
	  
	  local t = map[s]
	  table.insert(t, n)
	  
	  if #t == 5 then
		 if count == nil then
			count = digitCount(t[1]*t[1]*t[1])
		 end
	  end

	  n = n + 1
   end

   -- find the smallest cube
   local smallest
   for _,t in pairs(map) do
	  if #t == 5 then
		 local c = t[1]*t[1]*t[1]
		 if smallest == nil or c < smallest then
			smallest = c
		 end
	  end
   end

   return smallest
end


return {
   test = test,
   solve = solve
}
