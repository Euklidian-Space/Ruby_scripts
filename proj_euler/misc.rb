#this is a collection of methods i have had to reuse for project euler problems

def digit_count num 
  num == 0 ? 0 : 1 + digit_count(num / 10)  
end


def fib_gen 
  a, b = 0, 1
  Enumerator.new do |enum|
    loop { enum.yield b; a, b = b, a + b }
  end
end