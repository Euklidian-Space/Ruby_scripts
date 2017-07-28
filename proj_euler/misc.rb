#this is a collection of methods i have had to reuse for project euler problems

def digit_count num 
  num == 0 ? 0 : 1 + digit_count(num / 10)  
end

def digit_split str
  str.chars.reduce([]) { |result, char| result << char.to_i; result }
end

def digits(n)
  return [] if n == 0
  digits(n / 10) + [n % 10]
end

def int_digit_split str
  num = str.to_i
  result = []
  until num == 0 do 
    result << num % 10
    num /= 10
  end
  result.reverse 
end


def fib_gen 
  a, b = 0, 1
  Enumerator.new do |enum|
    loop { enum.yield b; a, b = b, a + b }
  end
end