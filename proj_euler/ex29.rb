

def f(n, arr)
  arr.inject([]) { |a, elem| a + [n**elem] }
end

def distinct_powers(start, fin)
  as = (start..fin)  
  bs = (start..fin)
  as.inject([]) do |arr, a|
    arr + f(a, bs)
  end.uniq.count
end 