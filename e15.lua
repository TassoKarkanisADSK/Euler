local paths = {}

local function latticePaths( i, j )
   if i == 1 then 
      return j + 1
   elseif j == 1 then
      return i + 1
   else
      -- check if we have this one already
      local key = tostring(i) .. "/" .. tostring(j)
      if paths[key] ~= nil then
	 return paths[key]
      else
	 local n = latticePaths( i - 1, j ) + latticePaths( i, j - 1 )
	 paths[key] = n
	 return n
      end
   end
end

return latticePaths(20, 20)
