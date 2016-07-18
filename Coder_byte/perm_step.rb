def permutationStep(num)
  arr = digit_split(num).reverse
  result = arr.permutation(arr.length).map { |elem| elem.join.to_i }.sort.find { |elem| elem > num }
  result ? result : -1
end

def digit_split num 
  return [] if num == 0
  [num % 10] + digit_split(num/10)
end