def edit_count(strA, strB)
  hash = strA.chars.reduce(Hash.new 0) do |h, char|
    h[char] += 1
    h
  end
  strB.chars.each { |char| hash[char] -= 1 }
  [0,1].include? hash.values.reduce(:+).abs
end