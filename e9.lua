

for a = 1,1000 do
   for b = a+1,1000 do
      local c = 1000 - b - a
      if c > b and a*a + b*b == c*c then
         print( "a:", a )
         print( "b:", b )
         print( "c:", c )
         print( "abc:", a*b*c )
      end
   end
end