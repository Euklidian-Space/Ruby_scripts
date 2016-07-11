require "pry"
def off_line_min(strArr)
  result = []
  arr_so_far = []
  strArr.each do |elem|
    if elem == "E"
      result << arr_so_far.min unless arr_so_far.empty?
      arr_so_far = []
    else
      arr_so_far << elem
    end
  end
  result
end