# Description:

# The drawing shows 6 squares the sides of which have a length of 1, 1, 2, 3, 5, 8. It's easy to see that the sum of the perimeters of these squares is : 4 * (1 + 1 + 2 + 3 + 5 + 8) = 4 * 20 = 80

# Say that S(n) is the nth term of the above sum. So

# S(0) = 1, S(1) = 1, S(2) = 2, ... , S(5) = 8

# Could you give the sum S of the perimeters of all the squares in a rectangle when there are n + 1 squares disposed in the same manner as in the drawing:

def fib_generator
  Enumerator.new do |enum|
    a = b = 1
    while true
      enum.yield a 
      a, b = b, a + b
    end
  end
end

def perimeter(n)
  4 * fib_generator.take(n + 1).reduce(:+)
end

def productFib(prod, generator = nil)
  generator.nil? ? gen = fib_generator : gen = generator
  first = gen.next
  second = gen.peek
  first * second < prod ? 
    productFib(prod, gen) : (first * second == prod ? [first, second, true] : [first,second,false])
end