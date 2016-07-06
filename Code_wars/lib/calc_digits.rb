def calc n 
  n == 0 ? 0 : ((n % 10) ** 2) + calc(n / 10)
end

def cumulate n 
  sum = 1
  while n >= 0 
    sum += calc(n) 
    n -= 1
  end
  sum
end

# def cumulate(n, accum = 1)
#   n <= 1 ? accum : cumulate(n - 1, accum + calc(n))  
# end



(1..100).each { |e| puts calc(e) }