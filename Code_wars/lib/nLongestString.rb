# Implement the function longest(array,n) where you will be given an array of strings 
# and then return the nth longest string in that array. e.g. arr = ['Hello','World','Codewars','Katas'] n = 3; 
# should return 'World' because 'Codewars' length = 8 , 'Hello' length = 5, so that is the 2nd longest word and then 'World' (although also word length of 5, 
# 'World' is after 'Hello' in the array). When words have the same lengths, treat them in the order in which they exist in the array. Array will never 
# be empty and n > 0 always.

def longest(arr, n)
  sorted = arr.sort { |a, b| b.length <=> a.length }
  candidate = sorted[0]
  i = 1
  sorted.each do |elem|
    return candidate if n == i
    if elem.length < sorted.first.length 
      i += 1
      candidate = elem
    end
  end
end