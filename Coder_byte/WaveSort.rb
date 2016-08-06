require "pry"

def wave_sort arr
  for i in (1..arr.length - 1) do 
    if (i - 1).odd?
      arr[i - 1], arr[i] = arr[i], arr[i - 1] if arr[i - 1] > arr[i]
    else
      arr[i - 1], arr[i] = arr[i], arr[i - 1] if arr[i - 1] < arr[i]   
    end
  end
  arr
end

def wave? arr 
  up_start?(arr) || down_start?(arr)
end

def up_start? arr 
  for i in (1..arr.length - 1) do 
    if (i - 1).even?
      return false unless arr[i - 1] < arr[i]
    else
      return false unless arr[i - 1] > arr[i]
    end
  end
  true
end

def down_start? arr 
  for i in (1..arr.length - 1) do 
    if (i - 1).odd?
      return false unless arr[i - 1] < arr[i]
    else
      return false unless arr[i - 1] > arr[i]
    end
  end
  true
end