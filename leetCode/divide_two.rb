# Divide two integers without using multiplication, division and mod operator.

# If it is overflow, return MAX_INT.

def divide(dividend, divisor)
  factor = divisor 
  result = 1
  until factor >= dividend do 
    factor += divisor   
    result += 1 
  end
  # if factor == dividend
  #   result
  # else
  #   nil 
  # end
  result
end




