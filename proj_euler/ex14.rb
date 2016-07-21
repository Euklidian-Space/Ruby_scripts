require "pry"

def collatz num 
  result = []
  loop do
    result << num
    num = num.odd? ? (3*num + 1) : (num/2)
    if num == 1
      result << num
      break
    end
  end
  result
end

def longest_collatz
  (1..1_000_000 - 1).reduce([1, 1]) do |champ, elem| #initial reduce ob [num, collatz(num).length]
    elem_collatz = collatz(elem).length
    champ = [elem, elem_collatz] if champ[1] <= elem_collatz 
    champ
  end
end