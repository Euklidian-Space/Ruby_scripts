def alph_search str 
  ('a'..'z').each { |letter| return false unless str.include? letter }
  true
end