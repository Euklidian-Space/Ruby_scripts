def longest_common_prefix(strs)
  return [] if strs.empty?
  fns = strs.map { |str| string_feeder(str) }
  result = ""
  loop do 
    chr = fns.inject("") do |c, fn|
      t = fn.call 
      return result if t == ""
      if c == "" || t == c
        c = t 
      else
        c = false 
      end
    end
    return result unless chr 
    result += chr
  end
end

def string_feeder(str)
  lambda do 
    temp = str[0]  
    return "" if temp == ""
    str = str[1..str.length]
    temp
  end
end