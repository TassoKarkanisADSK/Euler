local function isPalindrome( p )
   local s1 = tostring( p )
   local s2 = string.reverse( s1 )
   return s1 == s2
end


local y = 999
local n = 1
local nx = 1
local ny = 1
while y >= 1 do
   local x = 999
   while x >= y do
      local p = x * y
      if p < n then
      	 break
      end

      if isPalindrome(p) then
	 n = p
	 nx = x
	 ny = y
	 break
      end

      x = x - 1
   end

   y = y - 1
end

return n

