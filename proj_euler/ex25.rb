require "./misc"

def fib_1000_digit
  t1 = Time.now
  f = fib_gen
  count = 0
  until digit_count(f.peek) == 1000 do 
    count += 1
    f.next
  end
  puts "#{Time.now - t1} seconds taken to compute"
  count + 1
end

puts "Fibonacci index #{fib_1000_digit} is the first index in which its fib number is 1000 digits"
