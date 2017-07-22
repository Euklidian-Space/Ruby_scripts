def sort(arr) 
  inner = lambda do |a, q|
    return q if a.empty?
    if a[0] > q.last
      inner.call(a.slice(1..a.length - 1), [a[0]] + q)
    else 
      inner.call(a.slice(1..a.length - 1), sort(q + [a[0]]))
    end
  end 
  inner.call(arr.slice(1..arr.length - 1), [arr[0]])
end 

def third_greatest(arr)
  arr.sort.reverse[2]
end 