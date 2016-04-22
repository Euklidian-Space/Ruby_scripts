require "pry"

# Given a hash of letters and the number of times they occur, recreate all of the possible anagram combinations that could be created using all of the letters, sorted alphabetically.

# The inputs will never include numbers, spaces or any special characters, only lowercase letters a-z.

# E.g. get_words({2=>["a"], 1=>["b", "c"]}) => ["aabc", "aacb", "abac", "abca", "acab", "acba", "baac", "baca", "bcaa", "caab", "caba", "cbaa"]

def get_words(hash)
  arr = []
  hash.keys.each do |key|
    key.times do
    	arr << hash[key] 
    end
  end
  permute_n = hash.keys.map {|key| key * hash[key].length}.reduce(:+)
  arr.flatten.permutation(permute_n).map(&:join).uniq.sort.to_a
end


def perm(arr)
#  result = []
  return [arr] if arr.length < 2
  arr.flat_map do |e|
  # byebug
  perm((arr - [e])).map { |p| ([e] + p) }
  end
  #result
end
