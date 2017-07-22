def two_sums(nums, idx = 0)
  inner = lambda do |cand, rest|
    if rest.length == 0 
      nil
    elsif cand + rest[0] == 0 
      nums.length - rest.length
    else
      inner.call(cand, rest.slice(1..rest.length - 1))
    end 
  end
  matched = inner.call(nums[idx], nums[idx..nums.length - 1])
  matched ? [idx, matched] : two_sums(nums, idx + 1)
end 