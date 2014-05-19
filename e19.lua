-- Jan 01/1901 was a Tuesday
-- compute through 12*100 months

local daysPerMonth = {
   31,
   0,
   31,
   30,
   31,
   30,
   31,
   31,
   30,
   31,
   30,
   31 }

local function isLeapYear( year )
   local ret = false
   if year % 4 == 0 then
      ret = true
      if year % 100 == 0 then
         ret = false
         if year % 400 == 0 then
            ret = true
         end
      end
   end

   return ret
end

local function daysInMonth( month, year )
   local days = daysPerMonth[month]
   if i == 2 then
      if isLeapYear(year) then
         days = 29
      else
         days = 28
      end
   end
   return days
end

-- start at Jan 01, 1901
local day = 2
local month = 1
local year = 1901

local sundays = 0
for i = 1, 12*100 do
   if day % 7 == 0 then
      sundays = sundays + 1
   end

   -- advance to the first of the next month
   day = day + daysInMonth(month,year)

   -- increment the month/year
   month = month + 1
   if month == 13 then
      year = year + 1
      month = 1
   end
end

for i=1901, 2000 do
   print( i, isLeapYear(i) )
end

print( "sundays:", sundays )


