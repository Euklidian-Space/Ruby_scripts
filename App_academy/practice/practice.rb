require "pry"

def lucky_sevens? (arr)
  return false if arr.length < 3
  mutable_arr = arr
  next_arr = mutable_arr.shift
  mutable_arr.shift(3).reduce(:+) == 7 ? true : lucky_sevens?(next_arr)
end

def oddball_sum (arr)
  arr.select {|num| num.odd?}.reduce(:+)
end

def disemvowel(str)
  str.split('').reject{|char| vowel? char}.join('')
end

def vowel? (char)
  'aeiou'.include? char.downcase
end

def dasherize_num (num)
  return num if str.length < 2
  str = num.to_s.split('')
  arr = str
  arr.shift + '-' + dasherize_num(arr.join(''))
end

def crazy_sum (arr)
  arr.map.each_with_index {|element, index| element * index}.reduce(:+)
end

def square_nums (max)
  num = 1
  squares = []
  while (num*num) < max
    squares << num * num
    num += 1
  end
  squares.length
end

def crazy_nums (max)
  arr = (0..max - 1).to_a
  arr.select {|elem| div_by_3_xor_5?(elem)}
end

def div_by_3_xor_5? (num)
  (num % 3 == 0) ^ (num % 5 == 0)
end


def nearest_larger (arr, index)
  current_index_pick = arr.index(arr.max)
  our_element = arr[index]
  return nil if current_index_pick == index 
  arr.each_with_index do |elem, position|
    current_index_pick = position if elem < arr[current_index_pick] && elem > our_element
  end
  current_index_pick
end



# crazy_sum

# Write a method named crazy_sum(numbers) that takes an array of numbers. crazy_sum should multiply each number in the array by its position in the array, and return the sum.

# crazy_sum([2]) == 0 # (2*0)
# crazy_sum([2, 3]) == 3 # (2*0) + (3*1)
# crazy_sum([2, 3, 5]) == 13 # (2*0) + (3*1) + (5*2)
# crazy_sum([2, 3, 5, 2]) == 19 # (2*0) + (3*1) + (5*2) + (2*3)

# Make sure your code works for arrays with repeats of the same number (like [2, 3, 5, 2]). Hint: be careful about using Array#index; why?
# square_nums

# Write a method square_nums that takes a number max and returns the number of perfect squares less than max. Do not use Math.sqrt(x) or x ** 0.5; we don't want you to calculate square roots for this problem. You will, however, want to find squares (x * x is fine).

# square_nums(5) == 2
# square_nums(10) == 3
# square_nums(25) == 4

# crazy_nums

# Write a method crazy_nums that takes a number, max, and returns an array of the integers that

#     ARE less than max
#     AND ARE divisible by either three or five
#     BUT ARE NOT divisible by _both_ three and five

#     You should return the result in increasing order.

#     You may wish to use the modulo operation: 5 % 2 returns the remainder when dividing 5 by 2: 1. If num is divisible by i, then num % i == 0.

#     crazy_nums(3) == []
#     crazy_nums(10) == [3, 5, 6, 9]
#     crazy_nums(20) == [3, 5, 6, 9, 10, 12, 18]