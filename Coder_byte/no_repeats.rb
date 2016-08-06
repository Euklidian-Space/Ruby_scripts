def no_repeats str 
  str.gsub(' ', '').split('').reduce(Hash.new 0) { |hash, elem| hash[elem] += 1; hash }.each do |k,v|
    return k if v < 2  
  end
  nil
end