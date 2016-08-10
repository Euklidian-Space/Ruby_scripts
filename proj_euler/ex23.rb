require "pry"

def factors num 
  result = 1.upto(Math.sqrt(num)).select { |elem| (num % elem) == 0 }.inject([]) do |f,i|
    f << num / i unless i == num / i 
    f << i 
  end.sort
  result
end

def abundant_nums_upto num 
  t1 = Time.now
  result = (12..num).select { |n| factors(n)[0..-2].reduce(:+) > n }
  puts "abundant_nums_upto took: #{Time.now - t1} s"
  result
end

# def get_abundant_pair_sums_under n
#   abundant_nums_upto(n).combination(2).map { |elem| elem.reduce(:+) }.select { |elem| elem <= 28123 }  
# end

def get_abundant_pair_sums_under n 
  t1 = Time.now
  result = []
  limit = n
  abundants = abundant_nums_upto n 
  for i in (0..abundants.length - 1) do 
    for j in (i..abundants.length - 1) do 
      if abundants[i] + abundants[j] <= limit
        result << abundants[i] + abundants[j]
      else
        break  
      end
    end
  end
  puts "get_abundant_pair_sums_under took: #{Time.now - t1} s"
  result
end

def non_abundant_sums n 
  t1 = Time.now
  result = (1..n).to_a - get_abundant_pair_sums_under(n)
  puts "non_abundant_sums took: #{Time.now - t1} s"
  result
end

puts non_abundant_sums(28123).reduce(:+)