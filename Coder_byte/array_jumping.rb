require "pry"
def array_jumping arr 
  least_jumps(arr, arr.index(arr.max))  
end

def least_jumps(arr, target, start = nil, count = 0)
  start ||= target
  left = start - arr[start]
  right = start + arr[start]
  left += arr.length until left >= 0
  right -= arr.length until right < arr.length
  
  return count if left == target || right == target #<---- the issue is with start.  It changes each recursive call
 
    
  [least_jumps(arr, target, right, count += 1), least_jumps(arr, target, left, count += 1)].min
  
end