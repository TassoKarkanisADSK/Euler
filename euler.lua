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
   }

   for i = 1, #tests do
      local t = tests[i]
      print( "Running test " .. tostring(i) )
      local answer = dofile( t[1] .. ".lua" )
      answer = tostring( answer )
      if answer ~= t[2] then
         print( "Test " .. tostring(i) .. " failed!" )
         print( "    result:", answer )
         print( "  expected:", t[2] )
         break
      end
   end
end


if arg[1] == nil then
   usage()
elseif arg[1] == "test" then
   test()
else
   local answer = dofile( arg[1] .. ".lua" )
   print( answer )
end
   
