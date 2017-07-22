def count_vowels(string, count = 0) 
  return count if string.length == 0
  if "aeiou".include?(string[0])
    count_vowels(string.slice(1..string.length - 1), count + 1)
  else
    count_vowels(string.slice(1..string.length - 1), count)
  end  
end 