require 'pry'
# Implement the function longest(array,n) where you will be given an array of strings 
# and then return the nth longest string in that array. e.g. arr = ['Hello','World','Codewars','Katas'] n = 3; 
# should return 'World' because 'Codewars' length = 8 , 'Hello' length = 5, so that is the 2nd longest word and then 'World' (although also word length of 5, 
# 'World' is after 'Hello' in the array). When words have the same lengths, treat them in the order in which they exist in the array. Array will never 
# be empty and n > 0 always.

def longest(arr, n)
  byebug
  max = arr.max_by {|elem| elem.length}
  return max if n == 1
  new_arr = arr.reject {|elem| elem == max}
  longest(new_arr, n - 1)
end

