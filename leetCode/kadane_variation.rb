def kadane(arr)
  p1 = p2 = 0; max_sum = curr_sum = arr[0]
  mem = {}
  for i in (1..arr.length - 1)
    if arr[i] < 0 
      p1 = p2 = i + 1; 
      if curr_sum <= 0 
        curr_sum = 0
        next
      elsif i == arr.length - 1
        mem[curr_sum] = arr[p1..p2]
      end
    else
      curr_sum += arr[i]
      p2 = i
      mem[curr_sum] = arr[p1..p2] if i == arr.length - 1
    end
    max_sum = curr_sum if curr_sum > max_sum
  end
  mem[max_sum]
end