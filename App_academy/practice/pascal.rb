def vector_sum(arrA, arrB, accum = [])
  raise 'vectors must be same length' if arrA.length != arrB.length
  return accum if arrA.length == 0 && arrB.length
  vector_sum(arrA[1..arrA.length - 1], arrB[1..arrB.length - 1], accum << (arrA.first + arrB.first)) 
end

def pascals_triangle(n, accum = [])
  return accum unless n >= 0
  pascals_triangle(n - 1, vector_sum(accum + [0], [0] + accum))
end