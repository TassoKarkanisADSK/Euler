local function usage()
   print( "euler {<problem> | test}" )
   print( "Runs the specified problem and prints the answer or runs all the known tests" )
end


local function test()
   local tests = {
      { "e1", "233168" },
      { "e2", "4613732" },
      { "e3", "6857" },
      { "e4", "906609" },
      { "e5", "232792560" },
      { "e6", "2640" },
      { "e7", "104743" },
      { "e8", "40824" },
      { "e9", "31875000" },
      { "e10", "142913828922" },
      { "e11", "70600674" },
      { "e12", "76576500" },
      { "e13", "5537376230" },
      { "e14", "837799" },
      { "e15", "137846528820" },
      { "e16", "1366" },
      { "e17", "21124" },
      { "e18", "1074" },
      { "e19", "171" },
      { "e20", "648" },
      { "e21", "31626" },
      { "e22", "871198282" },
      { "e23", "4179871" },
      { "e24", "2783915460" },
      { "e25", "4782" },
      { "e26", "983" },
      { "e27", "-59231" },
      { "e28", "669171001" },
      { "e29", "9183" },
      { "e30", "443839" },
      { "e31", "73682" },
      { "e32", "45228" },
      { "e33", "100" },
      { "e34", "40730" },
      { "e35", "55" },
      { "e36", "872187" },
      { "e37", "748317" },
      { "e38", "932718654" },
      { "e39", "840" },
   }

   local t0 = os.clock()
   for i = 1, #tests do
      local t = tests[i]
      local t1 = os.clock()
      local answer = dofile( t[1] .. ".lua" )
      local t2 = os.clock()
      answer = tostring( answer )
      if answer ~= t[2] then
         print( "Test " .. tostring(i) .. " failed!" )
         print( "    result:", answer )
         print( "  expected:", t[2] )
         break
      else
          local msg = string.format( "Test %s: %f s", tostring(i), t2 - t1 )
          print( msg )
      end
   end
   local t1 = os.clock()
   print( string.format("Total time: %f s",t1 - t0) )
end


if arg[1] == nil then
   usage()
elseif arg[1] == "test" then
   test()
else
   local answer = dofile( arg[1] .. ".lua" )
   print( answer )
end
   
