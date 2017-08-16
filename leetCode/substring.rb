# def length_of_longest_substring(str)
#   counter = lambda do |h, s, curr|
#     return curr if s.empty?
#     if h[s[0]]
#       curr = h.keys.count if h.keys.count > curr
#       counter.call({}, s[1..s.length - 1], curr)
#     else
#       h[s[0]] = true 
#       counter.call(h, s[1..s.length - 1], curr) 
#     end
#   end
  
#   iter = lambda do |s, count|
#     return count if s.empty?
#     iter.call(s[1..s.length - 1], counter.call({}, s, count))
#   end
#   iter.call(str.split(""), 0)
# end 

def length_of_longest_substring(str)
  start = max_length = 0
  inner = lambda do |h, idx|
    return max_length if idx >= str.length 
    if h[str[idx]]
      start = h[str[idx]] + 1
      puts "start: #{start}, idx: #{idx}"
    else
      max_length = [max_length, idx - start + 1].max
    end
    h[str[idx]] = idx
    inner.call(h, idx + 1)
  end
  inner.call({}, 0)
end 