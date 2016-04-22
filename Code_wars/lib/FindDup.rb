# Spin-off of this kata, here you will have to figure out an efficient strategy to solve the problem of finding the sole duplicate number among an unsorted array/list of numbers starting from 1 up to n.

# Hints: a solution in linear time can be found; using the most intuitive ones to search for duplicates that can run in O(n²) time won't work.

require 'pry'

def find_dup(arr)
 # byebug
  hash = Hash.new(0)
  arr.each {|elem| hash[elem] += 1}
  hash.each {|k,v| return k if v > 1 }
end
