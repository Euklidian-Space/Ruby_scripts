require "pry"

# def wave_sort arr 
#   skip_occurred = false
#   for i in (1..arr.length - 1) do 
#     byebug
#     if !skip_occurred
#       if arr[i - 1] < arr[i] 
#         skip_occurred = true        
#       else
#         arr[i - 1], arr[i] = arr[i], arr[i - 1] 
#         skip_occurred = false
#       end
#     else
#       if arr[i - 1] > arr[i] 
#         skip_occurred = true
#       else
#         arr[i - 1], arr[i] = arr[i], arr[i - 1] 
#         skip_occurred = false
#       end
#     end
#   end
#   arr
# end

def wave_sort arr 
  for i in (1..arr.length - 1) do 
    if i.even?
      arr[i - 1], arr[i] = arr[i], arr[i - 1] if arr[i - 1] > arr[i]
    else
      arr[i - 1], arr[i] = arr[i], arr[i - 1] if arr[i - 1] < arr[i]   
    end
  end
  arr
end