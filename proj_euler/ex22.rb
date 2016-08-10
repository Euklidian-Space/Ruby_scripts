require "pry"

def read_in_names
  IO.readlines('names.txt')[0].split(',').map { |elem| elem.gsub(/\W+/, '') }.sort
end

def letter_score
  count = 0
  ('a'..'z').reduce({}) { |hash, letter| hash[letter] = (count += 1); hash }
end

def name_score(name)
  score_hash = letter_score
  name.each_char.map { |char| score_hash[char.downcase] }.reduce(:+)    
end

def name_scores
  hash = {}
  read_in_names.each_with_index do |name, idx|
    hash[name] = name_score(name) * (idx + 1)
  end
  hash
end

puts name_scores.values.reduce(:+)