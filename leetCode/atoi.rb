def atoi(str)
  ns = str.strip  
  regex = /[0-9]/
  ns = ns.scan(regex)
  if ns[0] == "-" 
    -1 * ns.join.to_i
  else
    ns.join.to_i    
  end
end 