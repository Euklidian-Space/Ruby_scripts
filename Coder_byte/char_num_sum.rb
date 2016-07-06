def adder(str)
  num_arr = []
  start_pos = (str =~ /\d/)
  end_pos = start_pos
  while start_pos < str.length
    while start_pos < str.length && str[end_pos + 1] =~ /\d/
      end_pos += 1
    end
    num_arr << str[start_pos..end_pos]
    start_pos = (str[end_pos + 1.. str.length - 1] =~ /\d/)
  end
  num_arr.reduce(:+)
end