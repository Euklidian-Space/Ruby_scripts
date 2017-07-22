def longest_word(str)
  candidate = [0, ""]
  str.split(" ").each do |word|
    if word.length > candidate[0]
      candidate = [word.length, word]
    end
  end
  candidate[1]
end 