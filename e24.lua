local function helper( n, a, ... )
   if n == 0 then return end
   return a, helper(n-1, ...)
end


local function first( k, ... )
   local n = select('#', ...)
   return helper(k, ...)
end


local function permutations( f, t )
   -- base case
   if #t == 1 then
      if not f({t[1]}) then
         return false
      else
         return true
      end
   end

   -- peel off the first element and recursively generate permutations
   for i = 1, #t do
      -- remove the i'th element
      local x = table.remove( t, i )

      -- recurse
      local g = function( u )
                   table.insert( u, 1, x )
                   local ret = f( u )
                   table.remove( u, 1 )
                   return ret
                end
      local val = permutations( g, t )

      -- put x back in
      table.insert( t, i, x )

      -- terminate if necessary
      if not val then
         return false
      end
   end
   
   return true
end


local function asString( t )
   local str = ""
   for j = 1, #t do
      str = str .. t[j]
   end
   return str
end


local t = { "0", "1", "2", "3", "4", "5", "6", "7", "8", "9" }
local i = 1
local p1m
local f = function( p )
             if i == 1000000 then
                p1m = asString( p )
                return false
             end
             i = i + 1
             return true
          end
permutations( f, t )
return p1m