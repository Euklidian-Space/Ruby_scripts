def compress str
  result = ""
  i = 0
  while i < str.length 
    cand = str[i]  
    count = 0
    until cand != str[i] do i += 1; count += 1 end
    result << "#{cand}#{count}"
  end
  result 
end