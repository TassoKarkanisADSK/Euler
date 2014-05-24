-- start with 1
local n = 1
local sum = n

for j = 2, 501 do
   local k = 2*(j - 1)
   for i = 1, 4 do
      n = n + k
      sum = sum + n
   end
end

return sum
