def digit_count num 
  num == 0 ? 0 : 1 + digit_count(num/10)
end

def square_figures(num)
  cand = 1
  loop do
    return cand if digit_count(cand**2) == num
    cand += 1
  end
end