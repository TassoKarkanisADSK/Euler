Num = {}
local meta

local function alloc( N )
   if N == nil then
      N = {}
   elseif type(N) == "string" then
      local str = string.reverse( N )
      N = {}
      for i = 1, #str do
         local val = string.sub( str, i, i )
         table.insert( N, tonumber(val) )
      end
   elseif type(N) == "number" then
      local num = N
      N = {}
      while num > 0 do
         local d = num % 10
         table.insert( N, d )
         num = (num - d) / 10
      end
   end
   
   setmetatable( N, meta )
   return N
end


local function shift( a, count )
   local b = Num.alloc()
   for i = 1, count do
      table.insert( b, 0 )
   end

   for i = 1, #a do
      table.insert( b, a[i] )
   end

   return b
end


local function smult( a, b )
   local c = Num.alloc()
   local carry = 0
   local i = 1
   while true do
      -- check for termination
      if a[i] == nil and carry == 0 then
         break
      end

      -- compute current product
      local prod = carry
      if a[i] ~= nil then
         prod = prod + a[i]*b
      end

      -- update c and carry
      local d = prod % 10
      table.insert( c, d )
      carry = (prod - d) / 10

      -- increment the column
      i = i + 1
   end
      
   return c
end


meta = {
   __tostring =
      function( t )
         if #t == 0 then
            return "0"
         end
         
         local str = ""
         for i = 1, #t do
            str = str .. tostring(t[i])
         end
         return string.reverse( str )
      end,

   __add = function( a, b )
              local c = Num.alloc()
              
              local carry = 0
              local i = 1
              while true do
                 -- check for termination
                 if a[i] == nil and b[i] == nil and carry == 0 then
                    break
                 end
                 
                 -- compute the current sum
                 local sum = carry
                 if a[i] ~= nil then
                    sum = sum + a[i]
                 end
                 if b[i] ~= nil then
                    sum = sum + b[i]
                 end
                 
                 -- update c and carry
                 local d = sum % 10
                 table.insert( c, d )
                 carry = (sum - d) / 10
                 
                 -- increment the column
                 i = i + 1
              end
              
              return c
           end,
   
   __mul = function( a, b )
              local p = Num.alloc()
              
              for i = 1, #b do
                 if b[i] ~= 0 then
                    local a1 = shift( a, i - 1 )
                    local c = smult( a1, b[i] )
                    p = p + c
                 end
              end
              
              return p
           end,
}

Num.alloc = alloc
