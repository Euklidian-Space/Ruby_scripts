require "prime"

def sum_primes_up_to n
  (1..n).select { |num| Prime.prime? num }.reduce(:+)  
end