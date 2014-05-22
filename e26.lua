-- 1/n has a recurring decimal if n has prime factors other than 2 and 5.
-- The length of the recurring decimal is the lowest m such that:
--    (10^m - 1)
-- is divisible by n.

local function divideOut2And5( n )
   -- repeatedly divide by 2 and 5
   while n % 2 == 0 do
      n = n / 2
   end

   while n % 5 == 0 do
      n = n / 5
   end

   return n
end


local function hasRecurringDecimal( n )
   n = divideOut2And5( n )
   return n > 1
end


local function cycleLength( n )
   n = divideOut2And5( n )
   local r = 1
   local i = 1
   while true do
      r = (10*r) % n
      if r == 1 then
         break
      end
      i = i + 1
   end
   return i
end


local maxCycle = 0
local d
for i = 3, 999 do
   if hasRecurringDecimal(i) then
      local len = cycleLength( i )
      if len > maxCycle then
         maxCycle = len
         d = i
      end
   end
end

return d