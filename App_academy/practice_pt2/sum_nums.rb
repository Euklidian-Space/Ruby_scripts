def sum_nums(n) 
  (0..n).inject(0) { |sum, num| sum + num }
end 