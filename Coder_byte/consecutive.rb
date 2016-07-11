def consecutive arr 
  arr = arr.sort
  result = []
  for i in (0..arr.length - 1) do 
    result << arr[i]
    next if i == arr.length - 1
    until arr[i + 1] - result.last == 1 do 
      result << (result.last + 1)
    end
  end
  result
end