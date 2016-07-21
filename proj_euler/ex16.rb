def power_digit_sum num
  return 0 if num == 0
  num % 10 + power_digit_sum(num / 10) 
end

