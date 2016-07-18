def mult(max)
  (0..max - 1).select { |elem| elem % 5 == 0 || elem % 3 == 0 }.reduce(:+)
end