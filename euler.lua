local answers = {
   {"e1", "233168"},
   {"e2", "4613732"},
   {"e3", "6857"},
   {"e4", "906609"},
   {"e5", "232792560"},
   {"e6", "2640"},
   {"e7", "104743"},
   {"e8", "40824"},
   {"e9", "31875000"},
   {"e10", "142913828922"},
   {"e11", "70600674"},
   {"e12", "76576500"},
   {"e13", "5537376230"},
   {"e14", "837799"},
   {"e15", "137846528820"},
   {"e16", "1366"},
   {"e17", "21124"},
   {"e18", "1074"},
   {"e19", "171"},
   {"e20", "648"},
   {"e21", "31626"},
   {"e22", "871198282"},
   {"e23", "4179871"},
   {"e24", "2783915460"},
   {"e25", "4782"},
   {"e26", "983"},
   {"e27", "-59231"},
   {"e28", "669171001"},
   {"e29", "9183"},
   {"e30", "443839"},
   {"e31", "73682"},
   {"e32", "45228"},
   {"e33", "100"},
   {"e34", "40730"},
   {"e35", "55"},
   {"e36", "872187"},
   {"e37", "748317"},
   {"e38", "932718654"},
   {"e39", "840"},
   {"e40", "210"},
   {"e41", "7652413"},
   {"e42", "162"},
   {"e43", "16695334890"},
   {"e44", "5482660"},
   {"e45", "1533776805"},
   {"e46", "5777"},
   {"e47", "134043"},
   {"e48", "9110846700"},
   {"e49", "296962999629"},
   {"e50", "997651"},
   {"e51", "121313"},
   {"e52", "142857"},
   {"e53", "4075"},
   {"e54", "376"},
   {"e55", "249"},
   {"e56", "972"},
   {"e57", "153"},
   {"e58", "26241"},
   {"e59", "107359"},
   {"e60", "26033"},
   {"e61", "28684"},
}

local answerMap


local function usage()
   print("Usage:")
   print("  euler <problem>")
   print("    Runs the specified problem and prints the answer" )
   print("  euler test [problem]")
   print("    Run all the tests or just the specified one")
end


local function computeProblem(problem)
   local file = problem .. ".lua"
   local result, b, c = dofile(file)
   if type(result) == "table" then
	  -- run the tests, if any
	  if result.test then
		 result.test()
	  end

	  -- compute the solution
	  result = result.solve()
   end

   if result ~= nil then
	  result = tostring(result)
   end
   
   return result
end


local function testAll()
   local t0 = os.clock()
   for i = 1, #answers do
      local t = answers[i]
      local t1 = os.clock()
      local answer = computeProblem(t[1])
      local t2 = os.clock()
      if answer ~= t[2] then
         print("Test " .. t[1] .. " failed!")
         print("    result:", answer)
         print("  expected:", t[2])
         break
      else
          local msg = string.format("Test %s: %f s", tostring(i), t2 - t1)
          print(msg)
      end
   end
   local t1 = os.clock()
   print(string.format("Total time: %f s",t1 - t0))
end


local function testOne(problem)
   -- look up the expected answer
   local expected = answerMap[problem]
   if expected == nil then
	  print("Problem not found: " .. problem)
	  return
   end

   -- compute the answer
   local answer = computeProblem(problem)
   if answer ~= expected then
	  print("Test " .. problem .. " failed!")
	  print("    result:", answer)
	  print("  expected:", expected)
   end
end


local function runOne(problem)
   local result = computeProblem(problem)
   if result ~= nil then
	  print(result)
   else
	  print("No solution!  Did you implement 'solve()'?")
   end
end


local function main()
   -- compute the answer map
   answerMap = {}
   for _, item in ipairs(answers) do
	  answerMap[item[1]] = item[2]
   end
   
   if arg[1] == nil then
	  usage()
   elseif arg[1] == "test" then
	  if #arg == 1 then
		 testAll()
	  elseif #arg == 2 then
		 testOne(arg[2])
	  else
		 usage()
	  end
   else
	  runOne(arg[1])
   end
end


local ok, result = pcall(main)
if not ok then
   print("Error: " .. result)
end
