require("euler/assert")

local function test()
end


-- local function solveX(D)
-- 	local x = 2
-- 	local rD = math.sqrt(D)
-- 	while true do
-- 		if x == 10000000 then
-- 			return 0
-- 		end
-- 		
-- 		local y = math.floor(x/rD) - 1
-- 		local x2 = x*x
-- 		if x2 - D*y*y == 1 then
-- 			return x
-- 		end
-- 
-- 		local y1 = y + 1
-- 		if x2 - D*y1*y1 == 1 then
-- 			return x
-- 		end
-- 		
-- 		x = x + 1
-- 	end
-- end

local function solveX(D)
	local y = 1
	while true do
		local x2 = D*y*y + 1
		local x = math.floor(math.sqrt(x2))
		local x1 = x + 1
		if x*x == x2 or x1*x1 == x2 then
			return x
		end
		
		y = y + 1
	end
end


local function solve()
	local maxD
	local maxX = 0
	local failCount = 0
	for D = 2, 1000 do
		-- ignore square D
		local r = math.floor(math.sqrt(D))
		local r1 = r + 1
		local square = r*r == D or r1*r1 == D

		if square then
			print("D: " .. D .. " .. is square")
		end

		if not square then
			local x = solveX(D)
			if x == 0 then
				failCount = failCount + 1
			end
			
			if x > maxX then
				maxX = x
				maxD = D
				print("maxX: " .. maxX)
				print("maxD: " .. maxD)
			end
		end
	end

	print("maxD: " .. maxD)
	print("failCount: " .. failCount)
	return maxD
end


return {
   test = test,
   solve = solve
}
