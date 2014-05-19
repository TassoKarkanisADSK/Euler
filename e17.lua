local ones = {
   "one", "two", "three", "four", "five", "six", "seven", "eight", "nine" 
}

local teens = {
   "eleven", "twelve", "thirteen", "fourteen", "fifteen", "sixteen",
   "seventeen", "eighteen", "nineteen" }

local tens = {
   "ten", "twenty", "thirty", "forty", "fifty", "sixty", "seventy", 
   "eighty", "ninety" }

local function add( sum, str )
   print( "adding:", str )
   sum = sum + #str
   return sum
end


local function count( n )
   local sum = 0
   local d
   local large = false
   
   -- thousands
   d = math.floor( n / 1000 )
   if d > 0 then
      large = true
      sum = add( sum, ones[d] )
      sum = add( sum, "thousand" )
      n = n % 1000
   end

   -- hundreds
   d = math.floor( n / 100 )
   if d > 0 then
      large = true
      sum = add( sum, ones[d] )
      sum = add( sum, "hundred" )
      n = n % 100
   end

   -- and
   if large and n > 0 then
      sum = add( sum, "and" )
   end
   
   -- tens
   d = math.floor( n / 10 )
   if d > 0 then
      if d >= 2 then
	 sum = add( sum, tens[d] )
	 n = n % 10
      else
	 d = n - 10
	 if d == 0 then
	    sum = add( sum, "ten" )
	 else
	    sum = add( sum, teens[d] )
	 end
	 n = 0
      end
   end

   -- ones
   d = n
   if d > 0 then
      sum = add( sum, ones[d] )
   end

   return sum
end


local sum = 0
for i = 1, 1000 do
   sum = sum + count( i )
end
print( "sum:", sum )


