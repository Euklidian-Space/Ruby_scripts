require "pry"

def combine_arrays(arrA, arrB)
  return arrA + arrB if arrA.empty?
  return arrB + arrA if arrB.empty?
  arrA.first <= arrB.first ? 
    [arrA.first] + combine_arrays(arrA[1..arrA.length - 1], arrB)
    :
    [arrB.first] + combine_arrays(arrA, arrB[1..arrB.length - 1])
end

def sub_arrays arr 
  return [] if arr.empty?
  result = []
  for i in (1..arr.length - 1) do
    result << arr[0..i]
  end
  result + sub_arrays(arr[1..arr.length - 1])
end

def puppy arr 
  index_of_greatest_era = (sub_arrays arr).map { |e| e.reduce(:+) }.each_with_index.max.last
  ranges = sub_arrays (0..arr.length - 1).to_a
  [ranges[index_of_greatest_era].first, ranges[index_of_greatest_era].last]
end

# def insertion_sort arr 
#   for i in (1..arr.length - 1) do
#     j = i - 1
#     key = arr[i]
#     while j >= 0 && arr[j] > key
#       arr[j + 1] = arr[j]
#       j -= 1
#     end
#     arr[j + 1] = key
#   end
#   arr
# end


def longest_winning_streak str 
  win_ocurred = false
  current_streak = 0
  streaks = []
  str.each_char do |c|
    if c == 'W' && win_ocurred
      current_streak += 1
    elsif c == 'W' && !win_ocurred
      win_ocurred = true
    elsif c == 'L'
      win_ocurred = false
      streaks << current_streak if current_streak >= 1
      current_streak = 0
    end  
  end
  streaks << current_streak if current_streak >= 1
  streaks.max ? (streaks.max + 1) : nil
end


def insertion_sort array 
  arr = array
  for i in (1..arr.length - 1) do 
    key = arr[i]
    j = i - 1
    while j >= 0
      if arr[j] > key
        arr[j + 1] = arr[j]
      end 
      print arr
      puts ' '
      j -= 1
    end
    arr[j + 1] = key
  end
  arr 
end

def reverse arr 
  arr.empty? ? [] : [arr.last] + reverse(arr.take(arr.length - 1))
end

def length arr 
  arr.empty? ? 0 : 1 + length(arr.drop 1)
end

def adjacent_sum arr 
  adjacent_arr = []
  for i in (1..arr.length - 1) do 
    adjacent_arr << arr[i - 1] + arr[i]  
  end
  adjacent_arr
end

def bubble_sort(arr)
  # byebug
	result = arr
	swapped = true
	until !swapped do
		swapped = false
		for i in (1..result.length - 1) do
			if result[i - 1] > result[i]
				result[i - 1], result[i] = result[i], result[i - 1]
				swapped = true
			end
		end
	end
	result 
end