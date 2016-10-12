require("euler/assert")

local function digitCount(n)
   local count = 0
   while n > 0 do
	  count = count + 1
	  local d = n % 10
	  n = (n - d)/10
   end
   return count
end


local function test()
   assert(digitCount(1) == 1, "digit count 1")
   assert(digitCount(32) == 2, "digit count 2")
   assert(digitCount(1023) == 4, "digit count 3")
   assert(digitCount(102011349) == 9, "digit count 4")
end


local function solve()
   local count = 0
   
   for i = 1, 9 do
	  local j = 1
	  while true do
		 -- compute the power
		 local n = i ^ j

		 -- compute the digit count
		 local c = digitCount(n)

		 -- check if they are the same
		 if c == j then
			count = count + 1
		 end

		 -- The digit count grows slower than the power for bases less
		 -- than 10.
		 if j > 1 and c < j then
			break
		 end

		 j = j + 1
	  end
   end

   return count
end


return {
   test = test,
   solve = solve
}
