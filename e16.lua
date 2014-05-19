local function multByTwo( N )
   local carry = 0
   for i = 1, #N do
      local n = 2*N[i] + carry
      local d = n % 10
      N[i] = d
      carry = (n - d) / 10
   end

   if carry > 0 then
      table.insert( N, carry )
   end
end

local function digitSum( N )
   local sum = 0
   for i = 1, #N do
      sum = sum + N[i]
   end
   return sum
end

local function asString( N )
   local s = ""
   for i = 1, #N do
      s = s .. tostring(N[i])
   end
   return string.reverse( s )
end


local N = { 1 }
for i = 1,1000 do
   multByTwo( N )
end

return digitSum(N)
