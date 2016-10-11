require("euler/assert")

local function triangle(n)
   return n*(n + 1)/2
end


local function square(n)
   return n*n
end


local function pentagon(n)
   return n*(3*n - 1)/2
end


local function hexagon(n)
   return n*(2*n - 1)
end


local function heptagon(n)
   return n*(5*n - 3)/2
end


local function octagon(n)
   return n*(3*n - 2)
end


local figurative = {}


local function precompute()
   local funcs = {
	  triangle,
	  square,
	  pentagon,
	  hexagon,
	  heptagon,
	  octagon
   }

   for k,f in ipairs(funcs) do
	  -- make a table for this cardinality
	  local num = {}
	  table.insert(figurative, num)

	  -- compute the 4-digit numbers
	  local n = 1
	  while true do
		 local q = f(n)
		 if q >= 1000 and q <= 9999 then
			table.insert(num, q)
		 end

		 if q > 9999 then
			break
		 end

		 n = n + 1
	  end
   end
end


-- compute the range [a,b) such of the next element
local function cyclicRange(n, t)
   local str = tostring(n)
   local sub = string.sub(str, 3, 4)
   local m = tonumber(sub)

   -- exclude the case where we won't get a 4-digit number
   if m < 10 then
	  return function()
		 return
	  end
   end

   -- compute the min and max values
   local a = 100*m
   local b = a + 100
   
   -- determine the first index
   local valid = false
   local index
   for i = 1, #t do
	  if t[i] >= a then
		 index = i
		 valid = true
		 break
	  end
   end

   -- forget it if we don't have a valid starting index
   if not valid then
	  return function()
		 return
	  end
   end

   -- make an iterator function
   return function()
	  -- check for the stopping condition
	  if index > #t or t[index] >= b then
		 return
	  end

	  local val = t[index]
	  index = index + 1
	  return val
   end
end


local function isCyclic(m, n)
   local a = tostring(m)
   local b = tostring(n)
   local sub1 = string.sub(a,3,4)
   local sub2 = string.sub(b,1,2)
   return sub1 == sub2
end


local function checkCyclic(n1, n, tables)
   -- check the end case
   if #tables == 0 then
	  -- check that the (n,n1) are cyclic
	  if isCyclic(n, n1) then
		 return {}
	  else
		 return nil
	  end
   end

   -- regular case
   for pos = 1, #tables do
	  -- remove the table in question
	  local t = tables[pos]
	  table.remove(tables, pos)

	  -- try for a match
	  for nn in cyclicRange(n, t) do
		 if isCyclic(n,nn) then
			local result = checkCyclic(n1, nn, tables)
			if result ~= nil then
			   table.insert(result, 1, nn)
			   return result
			end
		 end
	  end

	  -- put the current table back in
	  table.insert(tables, pos, t)
   end

   return nil
end


local function test()
   -- test the geometric functions
   assert(triangle(5) == 15, "triangle(5) should be 15: %d", triangle(5))
   assert(square(5) == 25, "square(5) should be 25: %d", square(5))
   assert(pentagon(5) == 35, "pentagon(5) should be 35: %d", pentagon(5))
   assert(hexagon(5) == 45, "hexagon(5) should be 45: %d", hexagon(5))
   assert(heptagon(5) == 55, "heptagon(5) should be 55: %d", heptagon(5))
   assert(octagon(5) == 65, "octagon(5) should be 65: %d", octagon(5))

   -- test isCyclic
   assert(isCyclic(8128,2882), "isCyclic failed 1")
   assert(not isCyclic(1111,2222), "isCyclic failed 2")
end


local function solve()
   precompute()

   -- try starting at each table in turn
   local values
   for pos = 1, #figurative do
	  -- remove the table
	  local t = figurative[pos]
	  table.remove(figurative, pos)
	  
	  -- iterate over the triangle numbers and try to find a cycle
	  for _,n1 in ipairs(t) do
		 values = checkCyclic(n1,n1,figurative)
		 if values ~= nil then
			table.insert(values, 1, n1)
			break
		 end
	  end

	  if values ~= nil then
		 break
	  end

	  -- put the table back in
	  table.insert(figurative, pos, t)
   end
   
   -- print("values:")
   -- print("  " .. tostring(values[1]))
   -- print("  " .. tostring(values[2]))
   -- print("  " .. tostring(values[3]))
   -- print("  " .. tostring(values[4]))
   -- print("  " .. tostring(values[5]))
   -- print("  " .. tostring(values[6]))

   local sum = 0
   for _,v in ipairs(values) do
	  sum = sum + v
   end
   return sum
end


return {
   test = test,
   solve = solve
}
