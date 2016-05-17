require "pry"
require 'prime'
def nearest_largest(arr,idx)
  byebug
  indices = {}
  arr.each_with_index{ |item, i| indices[i] = item if item > arr[idx] }
  return nil if indices.empty?
  indices.min_by{ |k,v| v }.first
end

def no_repeat? year
	year = year.to_s if year.is_a?(Fixnum)
	return true if year.empty?
	str_year = year.split('')
	str_year.include?(str_year.shift) ? (return false) : no_repeat?(str_year.join(''))
end

def no_repeats(year_start, year_end)
  (year_start..year_end).to_a.select{|year| no_repeat? year }
end

def is_vowel? char
  'aeiou'.include? char
end

def ordered_vowel_word? str
  vowels = str.each_char.select{ |c| is_vowel? c }
  vowels.sort == vowels
end

def ordered_vowel_words str 
  str.split(' ').select{ |word| ordered_vowel_word? word }.join(' ')
end


def dasherize_number(num)
	arr = num.to_s.split('')
	result = []
	even_occurred = false
	arr.each_with_index do |e, idx|
		if e.to_i.odd?	
			result << '-' if even_occurred
			result << e + (idx == arr.length - 1 ? '' : '-')
		else
			result << e
			even_occurred = true
		end
	end
	result.join('')
end

def scramble_string(string, positions)
	str_arr = string.split('')
	result = []
	positions.each do |position|
		result << str_arr[position] 
	end
	result.join('')
end

def nth_prime(nth)
	p = 2
	loop do
		byebug
		nth -= 1 if Prime.prime? p
		p += 1
		return p if nth == 0
	end
end

def palindrome?(string)
  i = 0
  while i < string.length
    if string[i] != string[(string.length - 1) - i]
      return false
    end

    i += 1
  end

  return true
end

def longest_palindrome(string)
	return string if palindrome? string
	substrings = []
	for i in (0..string.length - 1) do
		for j in ((i + 2)..string.length - 1) do
			substrings << string.slice(i, j)
		end
	end
	
	substrings.select{ |sub_string| palindrome? sub_string }.max_by{ |palindrome| palindrome.length }
end



def bubble_sort(arr)
	swapped = true
	n = arr.length
	while swapped
		swapped = false
		i = 1
		while i < n do
      byebug
			if arr[i - 1] > arr[i]
				arr[i - 1], arr[i] = arr[i], arr[i - 1]
				swapped = true
			end
			i += 1
		end
	end
	arr
end
