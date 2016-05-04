require "set"

def lcs(x,y)
  Set.new(x.split('')).intersection(Set.new(y.split(''))).to_a.join('')
end