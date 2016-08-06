require "pry"
#ver 1.0 before refactor
# def array_matching strArr 
#   num_arr = strArr.map { |elem| elem.gsub(/[^\d,\.]/, '').split(',') }
#   result = []
#   str_res = ""
#   length = num_arr[0].length > num_arr[1].length ? num_arr[0].length : num_arr[1].length 
#   for i in (0..length - 1) do 
#     if num_arr[0][i].nil?
#       result << num_arr[1][i].to_i
#     elsif num_arr[1][i].nil?
#       result << num_arr[0][i].to_i
#     else
#       result << num_arr[0][i].to_i + num_arr[1][i].to_i  
#     end
#   end
#   result.each_with_index do |num, idx|
#     str_res += num.to_s + (idx < result.length - 1 ? "-" : "")
#   end
#   str_res
# end

def array_matching strArr 
  num_arr = strArr.map { |elem| elem.gsub(/[^\d,\.]/, '').split(',') }.map { |elem| elem.map { |elem| elem.to_i } }
  byebug
  dasherize add_by_element(num_arr[0], num_arr[1])
end

def dasherize arr 
  result = ""
  arr.each_with_index { |num, idx| result += num.to_s + (idx < arr.length - 1 ? "-" : "") }
  result
end

def add_by_element(arrA, arrB)
  return arrB if arrA.empty?
  return arrA if arrB.empty?
  [arrA.first + arrB.first] + add_by_element(arrA[1..arrA.length - 1], arrB[1..arrB.length - 1])   
end

