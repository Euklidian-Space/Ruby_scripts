def palin_perm? str
  s = str.gsub(' ', '').downcase  
  s.chars.reduce(Hash.new 0) do |hash, char|
    hash[char] += 1
    hash
  end.values.select { |elem| elem.odd? }.count == (s.length.odd? ? 1 : 0)
end