def most_common_letter(string)
  max = 0; letter = ""
  string.split("").reduce(Hash.new(0)) do |h, char|
    h[char] += 1
    if h[char] > max 
      max = h[char]; letter = char
    end 
    h
  end
  [letter, max]
end