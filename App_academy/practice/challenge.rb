def combine_arrays(arrA, arrB)
  result = Array.new(arrA.length + arrB.length - 1)
  i = 0 
  j = 0
  k = 0
  while i < arrA.length && j < arrB.length
    if arrA[i] <= arrB[j]
      result[k] = arrA[i]
      i += 1
    else
      result[k] = arrB[j]
      j += 1
    end
    k += 1
  end
  result 
end


def subset arr
  result = []
  for i in (0..arr.length) do
    result += arr.combination(i).to_a
  end
  result
end

def puppy arr 
  sub_arrays(arr).max_by { |elem| elem.first.reduce(:+) }.last
end

def sub_arrays arr 
  result = []
  for i in (0..arr.length - 1) do 
    for j in (i + 1.. arr.length - 1) do 
      result << [sub_array(arr, i, j), [i,j]]
    end
  end
  result
end

def sub_array(arr, start, finish)
  result = []
  for i in (start..finish) do 
    result << arr[i]    
  end
  result
end
