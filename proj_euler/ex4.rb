def palindrome? num
  digit_split(num) == digit_split(num).reverse
end

def digit_split num
  return [] if num == 0
  [num % 10] + digit_split(num / 10)  
end

def max_palindrome(min, max)
  curr_max = -1
  for a in (min..max) do 
    for b in (a + 1..max) do 
      if palindrome?(a*b)
        curr_max = a*b > curr_max ? a*b : curr_max
      end
    end
  end
  curr_max
end