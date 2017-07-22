def rev(str) 
  return "" if str.length == 0
  str[-1] + rev(str.slice(0, str.length - 1))
end