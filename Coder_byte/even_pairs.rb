require "pry"

def group_evens num_str 
  result = []
  start = 0
  num_str.chars.with_index do |char, idx|
    if char.to_i.even? && idx != 0 && idx != num_str.length - 1  
      result << num_str[start..idx]  
    end
  end
  result
end

def even_pairs num_str 
  groups, result = group_evens(num_str), []
  for i in (0..groups.length - 2) do
    temp = groups[i]
    until temp.empty? do
      result << [temp, groups[i + 1]]
      temp = temp[1..-1]
    end
  end
  result 
end