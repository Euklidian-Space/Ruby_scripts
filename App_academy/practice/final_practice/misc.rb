def lucky_sevens arr 
  return false if arr.length < 3
  arr.take(3).reduce(:+) == 7 ? true
    : lucky_sevens(arr[1..arr.length - 1])
end

def oddball_sum numbers 
  odds = numbers.select { |number| number.odd? }
  odds.empty? ? 0 : odds.reduce(:+)
end