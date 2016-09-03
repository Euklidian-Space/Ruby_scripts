require "pry"
def _rotate str 
  first = str[0]  
  (str.length - 1).downto(0) do |i|
    offset = (i + 1) % str.length 
    str[offset] = str[i]
    str[1] = first if i == 0
  end
  str
end

def isRotation(strA, strB)
  strA.length.times do
    _rotate strA
    return true if strA == strB
  end
  false
end