
def lcs(x,y)
  return '' if x.empty? || y.empty?
  x.include?(y.chr) ? (x.chr == y.chr ? y.chr + lcs(x.sub(y.chr,''), tail_string(y)) : y.chr + lcs(tail_string(x.sub(y.chr, '')), tail_string(y)))
    : lcs(x, tail_string(y))
end

def tail_string str
  str.sub(str.chr, '')
end