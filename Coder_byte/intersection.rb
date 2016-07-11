def intersection(setA, setB)
  hash_A = setA.reduce(Hash.new) { |hash, elem| hash[elem] = true; hash }
  setB.select { |elem| hash_A[elem] }
end