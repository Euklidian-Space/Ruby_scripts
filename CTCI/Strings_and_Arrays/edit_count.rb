def edit_count(strA, strB)
  [0,1].include? (strA.chars - strB.chars).count 
end

def _edit_count(strA, strB)
  hash_A = strA.chars.reduce(Hash.new 0) { |hash, char| hash[char] += 1; hash }
  strB.chars.each { |char| hash_A[char] -= 1 }
  [0,1].include? hash_A.values.select { |count| count > 0 }.length  
end