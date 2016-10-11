require("euler/primes")

local concatPrimeMap = {}

-- assuming a and b are prime, are both of their concatenations prime?
local function concatPrime(a, b)
   -- normalize
   if a > b then
	  local tmp = a
	  a = b
	  b = tmp
   end
   
   -- check for it in our map
   local a1 = tostring(a)
   local a2 = tostring(b)
   local code = a1 .. ":" .. a2

   local c = concatPrimeMap[code]
   if c ~= nil then
	  return c
   end

   -- compute the result and store it
   c = isPrime(tonumber(a1 .. a2)) and isPrime(tonumber(a2 .. a1))
   concatPrimeMap[code] = c
   return c
end


-- is p concat prime with all elements of set s?
local function allConcatPrime(p, s)
   for _, q in ipairs(s) do
	  if not concatPrime(p,q) then
		 return false
	  end
   end
   return true
end


-- extend the closure element c2 with p
local function extend(p, c1, c2)
   for _, s in ipairs(c1) do
	  if allConcatPrime(p,s) then
		 local t = {unpack(s)}
		 table.insert(t, p)
		 table.insert(c2, t)
	  end
   end
end


-- closure[1] is concatPrime relation
-- closure[2] is the 3-relation that is the "distributive closure" of concatPrime
-- closure[3] is the 4-relation ...
local closure = {{}, {}, {}}

-- iterate over the primes, skipping 2
local function run()
   local i = 2
   while true do
	  local p = ithPrime(i)
	  
	  -- extend closure[1]
	  for j = 2, i - 1 do
		 local q = ithPrime(j)
		 if concatPrime(p,q) then
			table.insert(closure[1], {q,p})
		 end
	  end
	  
	  -- extend closure[2]
	  extend(p, closure[1], closure[2])
	  
	  -- extend closure[3]
	  extend(p, closure[2], closure[3])
	  
	  -- see if we have a 5-relation element yet
	  local c1 = closure[3]
	  for _, s in ipairs(c1) do
		 if allConcatPrime(p,s) then
			local t = {unpack(s)}
			table.insert(t, p)
			-- print(unpack(t))
			
			-- compute the sum
			local sum = 0
			for _, q in ipairs(t) do
			   sum = sum + q
			end
			
			-- print("sum: " .. tostring(sum))
			return sum
		 end
	  end
	  
	  -- increment
	  i = i + 1
   end
end


return run()
