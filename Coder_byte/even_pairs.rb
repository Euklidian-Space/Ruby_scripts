require "pry"

# def even_pairs str
#   i = 0
#   until i >= str.length - 1 do
#     even_count = 0
#     if str[i] =~ /[0-9]/
#       even_count += 1 if str[i].to_i.even?
#       i += 1
#       until (str[i] =~ /[a-zA-Z]/) || (i == str.length - 1) do
#         even_count += 1 if str[i].to_i.even?
#         i += 1
#       end
#       return true if even_count >= 2
#     end
#     i += 1
#   end
#   false
# end

# def even_pairs str
#   str.chars.each_with_index do |char, idx|
#     byebug
#     i = idx
#     next unless char =~ /[0-9]/
#     i += 1 until str[i] =~ /[a-zA-Z]/
#     return true if str[idx..i - 1].chars.select { |elem| elem.to_i.even? }.count >= 2
#   end
#   false
# end

def even_pairs str
  i = 0
  until i >= str.length - 1 do
    byebug
    idx = i
    unless str[i] =~ /[0-9]/
      i += 1
      next
    end
    idx += 1 until (str[idx] =~ /[a-zA-Z]/) || idx > str.length - 1
    return true if str[i..idx - 1].chars.select { |elem| elem.to_i.even? }.count >= 2
    i = idx if idx > i
  end
  false
end


print "Enter string: "
str = gets.strip

puts even_pairs(str)


# def group_evens num_str 
#   result = []
#   start = 0
#   num_str.chars.with_index do |char, idx|
#     if char.to_i.even? && idx != 0 && idx != num_str.length - 1  
#       result << num_str[start..idx]  
#     end
#   end
#   result
# end

# def even_pairs num_str 
#   groups, result = group_evens(num_str), []
#   for i in (0..groups.length - 2) do
#     temp = groups[i]
#     until temp.empty? do
#       result << [temp, groups[i + 1]]
#       temp = temp[1..-1]
#     end
#   end
#   result 
# end