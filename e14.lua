local function collatzLength( n )
   local i = 1
   while true do
      if n == 1 then
	 return i
      end

      if n % 2 == 0 then
	 n = n/2
      else
	 n = 3*n + 1
      end
      
      i = i + 1
   end
end


local maxI = 0
local maxN = 0
for i = 1, 999999 do
   local n = collatzLength( i )
   if n > maxN then
      maxN = n
      maxI = i
   end
      
end

return maxI
