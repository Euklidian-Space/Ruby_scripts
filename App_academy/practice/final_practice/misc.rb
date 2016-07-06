require "pry"

def lucky_sevens arr 
  return false if arr.length < 3
  arr.take(3).reduce(:+) == 7 ? true
    : lucky_sevens(arr[1..arr.length - 1])
end

def oddball_sum numbers 
  odds = numbers.select { |number| number.odd? }
  odds.empty? ? 0 : odds.reduce(:+)
end

# def longest_streak(str, accum = 0, streaks = [])
#   #byebug
#   print streaks
#   puts ''
#   if str.empty?
#     streaks << accum if accum > 0
#     return streaks
#   end
#   # str[0] == 'W' ?  longest_streak(str[1..str.length - 1], accum + 1)
#   #   : longest_streak(str[1..str.length - 1], 0, streaks << accum)
    
#   if str[0] == 'W'
#     longest_streak(str[1..str.length - 1], accum + 1)
#   else
#     streaks << accum if accum > 0
#     longest_streak(str[1..str.length - 1], 0, streaks)
#   end
# end

# def longest_streak str 
#   #win_occurred = false
#   wins = 1
#   streaks = []
#   str.each_char do |char|
#     if char == 'W'
#       wins += 1 #if win_occurred
#       win_occurred = true
#     else
#       win_occurred = false
#       streaks << wins if wins > 1
#       wins = 1
#     end
#   end
#   streaks
# end

def longest_streak str 
  str.split('L').max.length
end

def nearest_larger(arr, index)
  left = index - 1
  right = index + 1
  loop do
    if left >= 0 && arr[left] > arr[index]
      return left
    elsif right < arr.length && arr[right] > arr[index]
      return right 
    elsif left < 0 && right >= arr.length
      return nil
    end
    left -= 1
    right += 1
  end
end

def digit_split num 
  return [] if num == 0
  [num % 10] + digit_split(num / 10)
end

def dasherize_num(n)
  num_array = digit_split(n).reverse
  result = ''
  odd_occurred = false 
  num_array.each_with_index do |num, idx|
    if num.odd?
      result += (!odd_occurred && idx > 0 ? '-' : '') + num.to_s + (idx < num_array.length - 1 ? '-' : '')
      odd_occurred = true
    else 
      result += num.to_s 
      odd_occurred = false
    end
  end
  result
end

def letter_count str
  str.each_char.reduce(Hash.new(0)) { |freq_hash, char| freq_hash[char] += 1; freq_hash }
end

def ordered_vowel_word? word
  vowels = 'aeiou' 
  vowels_in_word = word.each_char.select{ |char| vowels.include? char }
  vowels_in_word == vowels_in_word.sort
end

def ordered_vowel_words(str)
  str.split(' ').map { |word| ordered_vowel_word? word }.join(' ')
end