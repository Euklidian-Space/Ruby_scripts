
def special_pythag_trip
  for n in (0..100) do 
    for m in (n + 1..100) do
      a = m**2 - n**2; b = 2*m*n; c = m**2 + n**2
      return [a,b,c].reduce(:*) if a + b + c == 1000 
    end
  end
  nil
end