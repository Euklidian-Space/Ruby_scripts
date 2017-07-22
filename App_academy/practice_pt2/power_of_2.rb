def power2?(n)
  if n % 2 != 0 && n != 1
    false
  elsif n > 1
    power2?(n / 2.0) 
  else
    true
  end 
end 