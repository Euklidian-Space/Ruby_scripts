require "pry"

def amicable_pair_sum(min, max)
  amicable_pairs(min,max).to_a.flatten.uniq.reduce(:+)
end

def factors num 
  1.upto(Math.sqrt(num)).select { |elem| (num % elem) == 0 }.inject([]) do |f,i|
    f << num / i unless i == num / i 
    f << i 
  end.sort
end

def divisor_sum(n)
  factors(n)[0..-2].reduce(:+)
end

def div_sum_hash(min, max)
  (min..max).reduce({}) do |hash, num|
    hash[num] = divisor_sum(num)    
    hash
  end
end  


def amicable_pairs(min, max) 
  ledger = div_sum_hash(min,max)
  ledger.reject{|k,v| k == v}.select do |k,v|
    ledger[v] == k
  end
end



# def amicable_pairs(min, max) 
#   ledger = div_sum_hash(min,max)
#   ledger.reduce({}) do |result, elem|
#     if ledger[elem[1]] == elem[0]
#   end
# end