def triangle_numbers
  n = 1
  Enumerator.new do |enum|
    loop do 
      enum.yield (n * (n + 1)) / 2
      n += 1
    end
  end
end

def get_divisors num 
  result = []
  limit = Math.sqrt num
  (1..limit.floor).each do |n|
    if num % n == 0
      result << n
      if n != num/n 
        result << num/n
      end
    end
  end
  result
end

#what is the first triangle number to have over five hundred divisors?
def triangle_num
  gen = triangle_numbers
  loop do 
    return gen.peek if get_divisors(gen.peek).count > 500
    gen.next
  end
end

# def prime_factors num 
#   result = []
#   while num % 2 == 0 
#     result << 2
#     num /= 2
#   end
#   i = 3
#   while i < Math.sqrt(num)
#     while num % i == 0
#       result << i 
#       num /= i
#     end
#     i += 2 
#   end
#   result << num if num > 2
# end