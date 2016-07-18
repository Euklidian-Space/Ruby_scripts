def pattern_chaser(str)
  substrings = contiguous_substrings str 
  freq_hash = substrings.reduce(Hash.new 0) { |hash, elem| hash[elem] += 1; hash }
  result = freq_hash.select { |key, val| val > 1 }.max_by { |k, v| k.length }
  result ? "yes #{result[0]}" : "no null"
end

def contiguous_substrings(str)
  result = []
  for i in (0..str.length - 1) do
    for j in (i + 1..str.length - 1) do
      result << str[i..j]
    end
  end
  result 
end