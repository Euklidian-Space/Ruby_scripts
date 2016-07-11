def changingSeq arr 
  for i in (1..arr.length - 2) do
    return i if local_max?(arr, i) || local_min?(arr, i)
  end
  -1
end

def local_max?(arr, idx)
  arr[idx - 1] < arr[idx] && arr[idx] > arr[idx + 1]
end

def local_min?(arr, idx)
  arr[idx - 1] > arr[idx] && arr[idx] < arr[idx + 1]
end