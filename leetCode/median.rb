# There are two sorted arrays nums1 and nums2 of size m and n respectively.

# Find the median of the two sorted arrays. The overall run time complexity should be O(log (m+n)).

# Example 1:
# nums1 = [1, 3]
# nums2 = [2]

# The median is 2.0
# Example 2:
# nums1 = [1, 2]
# nums2 = [3, 4]

# The median is (2 + 3)/2 = 2.5

def median_of_two(a1, a2)
  m1 = median_idx a1 
  m2 = median_idx a2
  if a1[m1] == a2[m2]
    a1[m1]
  elsif a1[m1] > a2[m2]
    median_of_two(a1[0..m1], a2[m2..a2.length - 1]) 
  elsif a1[m1] < a2[m2]
    median_of_two(a1[m1..a1.length - 1], a2[0..m2])
  end
end

def filter_upto(a, threshold)
  a.select { |elem| elem <= threshold }
end

def filter_after(a, threshold)
  a.select { |elem| elem >= threshold }
end

def find_median_sorted_arrays(nums1, nums2)
  a, b = [nums1, nums2].sort_by(&:size)
  m, n = a.size, b.size
  after = (m + n - 1) / 2
  i = (0...m).bsearch { |i| after-i-1 < 0 || a[i] >= b[after-i-1] } || m
  nextfew = (a[i,2] + b[after-i,2]).sort
  (nextfew[0] + nextfew[1 - (m+n)%2]) / 2.0
end


def median_idx(arr)
  ((arr.length - 1) / 2).floor
end

