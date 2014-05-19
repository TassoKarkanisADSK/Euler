local function sumOfSquares( n )
   local sum = 0
   for i = 1, n do
      sum = sum + i*i
   end
   return sum
end


local function squareOfSum( n )
   local sum = (n*n + n)/2
   return sum * sum
end


local n = 10
print( "difference:", squareOfSum(n) - sumOfSquares(n) )

