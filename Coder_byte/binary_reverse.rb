def binary_reversal str 
  str.to_i.to_s(2).reverse.to_i(2).to_s  
end

def digit_split num 
  return [] if num == 0
  [num % 10] + digit_split(num / 10)  
end