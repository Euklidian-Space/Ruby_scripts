def square_nums(max)
  count = 0
  curr = 1
  loop do 
    if curr * curr < max
      count += 1
      curr += 1
    else
      return count
    end
  end 
end 