def three_sum arr 
  target = arr[0]
  arr = arr[1..-1]
  arr.each_with_index do |e, idx|
    new_target = target - e 
    (arr[0..idx - 1] + arr[idx + 1..arr.length - 1]).each do |j|
      return true if (arr[0..idx - 1] + arr[idx + 1..arr.length - 1]).include? new_target - j
    end
  end
  false
end

print "Enter array: "
arr = gets.split(',').map(&:to_i)
puts three_sum(arr)