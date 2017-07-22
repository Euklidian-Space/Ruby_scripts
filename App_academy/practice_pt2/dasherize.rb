def dasherize_number(num)
  inner = lambda do |arr, idx, res|
    return res if idx == arr.length 
    if arr[idx].odd? && !previous_odd?(arr, idx)
      inner.call(arr, idx + 1, res + "-" + arr[idx].to_s + (idx == arr.length - 1 ? "" : "-"))
    elsif arr[idx].odd? && previous_odd?(arr, idx)
      inner.call(arr, idx + 1, res + arr[idx].to_s + (idx == arr.length - 1 ? "" : "-"))
    else
      inner.call(arr, idx + 1, res + arr[idx].to_s)
    end
  end
  inner.call(digits(num), 0, "")
end 

def previous_odd?(arr, idx)
  arr[idx - 1].odd?# || str[idx + 1].to_i.odd?
end

def dash_insert(n, idx, length)
   
end

def digits(n)
  return [] if n == 0
  digits(n / 10) + [n % 10]
end