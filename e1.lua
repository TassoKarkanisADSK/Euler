require("euler/assert")

local function test()
   assert(1 == 1, "Basic arithmetic doesn't work!  Unbelievable!")
end

local function solve()
   local sum = 0
   for i = 1,999 do
	  if i % 3 == 0 or i % 5 == 0 then
		 sum = sum + i
	  end
   end
   return sum
end


return {
   test = test,
   solve = solve
}
