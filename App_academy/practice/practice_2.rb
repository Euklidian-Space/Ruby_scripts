require 'pry'
# Write a function, `no_repeats(year_start, year_end)`, which takes a
# range of years and outputs those years which do not have any
# repeated digits.
#
# You should probably write a helper function, `no_repeat?(year)` which
# returns true/false if a single year doesn't have a repeat.
#
# Difficulty: 1/5

def no_repeat?(year,mem = [])
  return true if (year % 10 == 0)
  if mem.include? year % 10
    return false
  else
    mem << (year % 10)
    return no_repeat?(year / 10, mem)
  end
end

def no_repeats(year_start, year_end)
  (year_start..year_end).select {|year| no_repeat? year}
end

# Write a function, `letter_count(str)` that takes a string and
# returns a hash mapping each letter to its frequency. Do not include
# spaces.
#
# Difficulty: 1/5

def letter_count(str)
  freequency = Hash.new(0)
  str.gsub(/\s+/, "").each_char do |char|
    freequency[char] += 1
  end
  freequency
end

# Write a method, `ordered_vowel_words(str)` that takes a string of
# lowercase words and returns a string with just the words containing
# all their vowels (excluding "y") in alphabetical order. Vowels may
# be repeated (`"afoot"` is an ordered vowel word).
#
# You will probably want a helper method, `ordered_vowel_word?(word)`
# which returns true/false if a word's vowels are ordered.
#
# Difficulty: 2/5

def vowel? (char)
  'aeiou'.include? (char)  
end

def ordered_vowel_word? (word)
  vowels = ['a', 'e', 'i', 'o', 'u']
  str = word.split('').select {|char| vowel?(char)}
  return word if str.empty?
  current_vowel = str.first
  str.each do |char|
   return false if vowels.index(char) < vowels.index(current_vowel)
   current_vowel = char
  end
  true
end

def ordered_vowel_words(str)
  str.split.select {|word| ordered_vowel_word?(word)}.join(' ')
end

# Build a function, `morse_encode(str)` that takes in a string (no
# numbers or punctuation) and outputs the morse code for it. See
# http://en.wikipedia.org/wiki/Morse_code. Put two spaces between
# words and one space between letters.
#
# You'll have to type in morse code: I'd use a hash to map letters to
# codes. Don't worry about numbers.
#
# I wrote a helper method `morse_encode_word(word)` that handled a
# single word.
#
# Difficulty: 2/5

def morse_encode_word (word)
  morse_hash = {
    "a" => ".-",
  	"b" => "-...",
  	"c" => "-.-.",
  	"d" => "-..",
  	"e" => ".",
  	"f" => "..-.",
  	"g" => "--.",
  	"h" => "....",
  	"i" => "..",
  	"j" => ".---",
  	"k" => "-.-",
  	"l" => ".-..",
  	"m" => "--",
  	"n" => "-.",
  	"o" => "---",
  	"p" => ".--.",
  	"q" => "--.-",
  	"r" => ".-.",
  	"s" => "...",
  	"t" => "-",
  	"u" => "..-",
  	"v" => "...-",
  	"w" => ".--",
  	"x" => "-..-",
  	"y" => "-.--",
  }
  word.downcase.each_char.map { |char| morse_hash[char] }.join(' ')
end

def morse_encode(str)
  str.split(' ').map { |word| morse_encode_word(word) }.join(' ')
end

# Write a function word_unscrambler that takes two inputs: a scrambled
# word and a dictionary of real words.  Your program must then output
# all words that our scrambled word can unscramble to.
#
# Hint: To see if a string `s1` is an anagram of `s2`, split both
# strings into arrays of letters. Sort the two arrays. If they are
# equal, then they are anagrams.
#
# Difficulty: 3/5

def match?(wordA, wordB)
  wordA == wordB.each_char.sort.join('') 
end

def word_unscrambler(word, dictionary)
  sorted_word = word.each_char.sort.join('')
  dictionary.select {|w| match?(sorted_word, w)}
end

# Write a function, `rec_intersection(rect1, rect2)` and returns the
# intersection of the two.
#
# Rectangles are represented as a pair of coordinate-pairs: the
# bottom-left and top-right coordinates (given in `[x, y]` notation).
#
# Hint: You can calculate the left-most x coordinate of the
# intersection by taking the maximum of the left-most x coordinate of
# each rectangle. Likewise, you can calculate the top-most y
# coordinate of the intersection by taking the minimum of the top most
# y coordinate of each rectangle.
#
# Difficulty: 4/5




# Write a function `bubble_sort(arr)` which will sort an array of
# integers using the "bubble sort"
# methodology. (http://en.wikipedia.org/wiki/Bubble_sort)
#
# Difficulty: 3/5

def bubble_sort(arr)
  i = 0 
  while i < arr.length - 1
    if arr[i] > arr[i + 1]
      arr[i], arr[i + 1] = arr[i + 1], arr[i]
    end
    i += 1
  end
  if arr.length == 1 
    return arr 
  else
    bubble_sort(arr.first(arr.length - 1)) << arr.last
  end
  
end