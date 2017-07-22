def crazy_nums(max)
  3.upto(max - 1).select do |n|
    (n % 5 == 0) ^ (n % 3 == 0)
  end
end 