# def max_area(heights)
#   fn = lambda do |hs, result|
#     return result if hs.length == 1
#     if hs.first >= hs.last
#       area = hs.last * (hs.length - 1)
#       result = result >= area ? result : area
#       fn.call(hs.slice(0..hs.length - 2), result)
#     else
#       area = hs.first * hs.length 
#       result = result >= area ? result : area
#       fn.call(hs.slice(1..hs.length - 1), result)
#     end
#   end
#   fn.call(heights, 0)
# end

def max_area(heights)
  result = 0
  hs = heights.slice(0..heights.length - 1)
  until hs.length <= 1 do 
    if hs.first >= hs.last
      area = hs.last * (hs.length - 1)
      result = result >= area ? result : area
      hs = hs.slice(0..hs.length - 2)
    else
      area = hs.first * (hs.length - 1)
      result = result >= area ? result : area
      hs = hs.slice(1..hs.length - 1)
    end
  end
  result
end