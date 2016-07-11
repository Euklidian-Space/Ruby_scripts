def adder(str)
  str.scan(/[\d]+/).inject(0) { |sum, elem| sum += elem.to_i }
end