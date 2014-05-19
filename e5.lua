local function divisible( n )
   for i = 2, 20 do
      if n % i ~= 0 then
	 return false
      end
   end
   return true
end

local n = 20
while true do
   if divisible(n) then
      break
   end
   n = n + 20
end

return n
