# Using the Ruby language, have the function LargestPair(num) 
# take the num parameter being passed and determine the largest 
# double digit number within the whole number. For example: if num is 4759472 
# then your program should return 94 because that is the largest double digit number. 
# The input will always contain at least two positive digits. 


def largest_pair(num, mem = [])
  return mem if num == 0
  mem << num % 100
  largest_pair((num / 10), mem)
end

print "Enter number: "
n = gets.strip.to_i

puts largest_pair(n)