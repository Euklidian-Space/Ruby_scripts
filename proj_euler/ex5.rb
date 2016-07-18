def div_by_first_20?(min, max, num)
  (min..max).each { |n| return false if num % n != 0 }
  true 
end

def smallest_div
  num = 21
  num += 1 until div_by_first_20?(1,20,num)
  num
end