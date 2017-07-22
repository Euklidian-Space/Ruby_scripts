def num_repeats(string)
  count = 0
  string.split("").inject(Hash.new 0) do |h, chr|
    h[chr] += 1
    count += 1 if h[chr] > 1
    h
  end
  count
end 