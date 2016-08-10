require "pry"

def factors num 
  1.upto(Math.sqrt(num)).select { |elem| (num % elem) == 0 }.inject([]) do |f,i|
    f << num / i unless i == num / i 
    f << i 
  end.sort
end

def abundant_nums_upto num 
  (12..num).select { |n| factors(n)[0..-2].reduce(:+) > n }
end

def get_abundant_pair_sums n
  abundant_nums_upto(n).combination(2).map { |elem| elem.reduce(:+) }
end

def non_abundant_sums n 
  (1..n).to_a - get_abundant_pair_sums(n).select { |elem| elem <= 28123 }  
end

puts non_abundant_sums(28123).reduce(:+)