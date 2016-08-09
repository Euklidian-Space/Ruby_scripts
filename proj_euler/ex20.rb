def factorial(n, product = 1)
  return product if n == 1 || n == 0
  factorial(n - 1, n * product)
end

def digit_sum(num, sum = 0)
  return sum if num == 0
  sum += num % 10
  digit_sum(num / 10, sum)
end

def digit_sum_100!
  digit_sum(factorial(100))
end