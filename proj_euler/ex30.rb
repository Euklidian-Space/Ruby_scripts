require_relative "misc.rb"

def digit_fifth_powers
  limit = 6 * (9**5)
  result = 0
  (2..limit).each do |n|
    sum = digits(n).map { |e| e**5 }.reduce(:+)
    result += sum if sum == n
  end
  result
end