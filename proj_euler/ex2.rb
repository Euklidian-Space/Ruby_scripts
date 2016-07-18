require "pry"

def fib_sequence
  Enumerator.new do |enum|
    a = b = 1
    loop { enum.yield a; a, b = b, b + a }
  end
end

def even_fib_sum num 
  sum = 0
  gen = fib_sequence
  fib = gen.next
  until fib >= num do 
    sum += fib if fib.even?
    fib = gen.next
  end
  sum 
end