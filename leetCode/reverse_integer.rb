# Reverse digits of an integer.

# Example1: x = 123, return 321
# Example2: x = -123, return -321

# click to show spoilers.

# Note:
# The input is assumed to be a 32-bit signed integer. Your function should return 0 when the reversed integer overflows.

def reverse(num)
  return 0 if num == 0 
  inner = lambda do |n, res|
    return res if n == 0
    res = res * 10 + n % 10 
    inner.call(n / 10, res)
  end
  result = inner.call(num.abs, 0) * (num < 0 ? -1 : 1)
  return 0 if result >= 2147483647 || result <= -2147483647
  result
end

# def construct(places, digits)
#   i = 0
#   j = places.length - 1
#   result = 0
#   while i <= places.length - 1 && j >= 0
#     result += (places[j] * digits[i]) 
#     j -= 1
#     i += 1
#   end 
#   result
# end