def letter_combinations(digits)
  dict = {
    "1" => [],
    "2" => %w(a b c),
    "3" => %w(d e f),
    "4" => %w(g h i),
    "5" => %w(j k l),
    "6" => %w(m n o),
    "7" => %w(p q r s),
    "8" => %w(t u v),
    "9" => %w(w x y z)
  }  
  digits.split("").reverse.map do |digit| 
    dict[digit]
  end.reduce([]) do |result, arr|
    cartesian_product(arr, result)  
  end
end

def cartesian_product(arrA, arrB)
  return arrB if arrA.length == 0 
  return arrA if arrB.length == 0
  result = []
  for i in (0..arrA.length - 1)
    for j in (0..arrB.length - 1)
      result += [arrA[i] + arrB[j]]
    end 
  end
  result
end
