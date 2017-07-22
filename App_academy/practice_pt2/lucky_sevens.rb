def lucky_sevens?(arr) 
  length = 3
  inner = lambda do |a, chunk, count|
    if count < 3
      inner.call(a.slice(1..a.length - 1), chunk + a[0], count + 1)
    else
      
    end
  end
end