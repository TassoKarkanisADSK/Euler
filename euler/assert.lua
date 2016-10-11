function assert(cond, fmt, ...)
   if not cond then
	  local msg = string.format(fmt, ...)
	  error(msg)
   end
end
