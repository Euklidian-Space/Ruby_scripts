def largest_prime_factor num
  prime_factors(num).max    
end

def prime_factors num 
  result = []
  while num % 2 == 0 
    result << 2
    num /= 2
  end
  i = 3
  while i < Math.sqrt(num)
    while num % i == 0
      result << i 
      num /= i
    end
    i += 2 
  end
  result << num if num > 2
end