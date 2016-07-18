def parallel_sums arr
  combo_range = arr.combination(arr.length/2).to_a
  sums = combo_range.map { |elem| elem.reduce(:+) }
  dup = find_dups sums
  indices = []
  sums.each_with_index { |elem, idx| indices << idx if elem == dup }
  indices.map { |elem| combo_range[elem] } 
end

def find_dups arr 
  arr.reduce(Hash.new 0) { |hash, elem| hash[elem] += 1; hash }.each do |k,v|
    return k.to_i if v > 1
  end
  nil
end