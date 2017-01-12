require "pry"

def _three_nums str
  count = 0
  str.split(' ').each do |s|
    #byebug
    #return false if s.split(/[a-zA-Z]/).select { |elem| elem.length > 0 }.count > 1
    #count += 1 if s.scan(/[0-9]/).length > 2 
    count += 1 if s.split(/[a-zA-Z]/).length > 1
  end
  count == str.split(' ').count ? true : false
end

def three_nums str 
  str_arr = str.split ' '
  for i in (0..str_arr.length - 1) do 
    temp = str_arr[i].scan(/[0-9]/)  
    return false if temp.length <= 2 || temp.uniq.length != 3
  end
  true
end

# Input:"2a3b5 w1o2rl3d g1gg92"
# Output:"true"

# Input:"21aa3a ggg4g4g6ggg"
# Output:"false"

print "Enter string: "

puts three_nums(gets.chomp)