def crazy_sum(numbers)
  result = 0
  numbers.each_with_index do |val, idx|
    result += (val * idx) 
  end
  result
end 