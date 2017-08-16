# Given a string s, find the longest palindromic substring in s. You may assume that the maximum length of s is 1000.

# Example:

# Input: "babad"

# Output: "bab"

# Note: "aba" is also a valid answer.
# Example:

# Input: "cbbd"

# Output: "bb"

def longest_palindrome(str)
  result = [0, ""]
  for i in (0..str.length - 1)
    p1 = expand(str, i, i) 
    result = result[0] > p1.length ? result : [p1.length, p1]
    p2 = expand(str, i, i + 1) 
    result = result[0] > p2.length ? result : [p2.length, p2]
  end
  result[1]
end

def expand(s, l, r)
  while l >= 0 && r <= s.length - 1 && s[l] == s[r]
    l -= 1
    r += 1
  end
  s[l + 1..r - 1]
end