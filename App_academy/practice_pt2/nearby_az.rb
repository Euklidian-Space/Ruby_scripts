def nearby(str)
  (0..str.length - 1).each do |idx|
    return true if chk(str, idx) 
  end 
  false
end 

def chk(str, idx, offset = 1)
  left = idx - offset <= 0 ? 0 : idx - offset
  right = idx + offset >= str.length - 1 ? str.length - 1 : idx + offset
  if left == 0 && right == str.length - 1
    false
  elsif str[left] == "z" || str[right] == "z"
    true
  else
    chk(str, idx, offset + 1)
  end
end 