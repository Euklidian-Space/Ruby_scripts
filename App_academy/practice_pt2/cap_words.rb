def capitalize_words(string)
  string.split(" ").map do |word|
    word[0].upcase + word.slice(1, word.length - 1)
  end.join(" ")
end 