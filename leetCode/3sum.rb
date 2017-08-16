# def distribute(arrA, arrB)
#   result = []
#   for i in (0..arrA.length - 1)
#     for j in (0..arrB.length - 1)
#       result << [arrA[i], arrB[j]].flatten
#     end
#   end
#   result
# end

# def combinations(arr, choose)
#   return arr if choose == 1 
#   result = [] 
#   for i in (0..arr.length - choose)
#     result += distribute([arr[i]], combinations(arr[i + 1..arr.length - 1], choose - 1)) 
#   end
#   result
# end

# def three_sum(nums)
#   combinations(nums.sort, 3).select do |arr|
#     arr.reduce(:+) == 0
#   end
# end

def three_sum(nums)
  nums, result = nums.sort, []
  for i in (0..nums.length - 3)
    p1, p2 = i + 1, nums.length - 1 
    if i == 0 || nums[i] > nums[i - 1]
      while p1 < p2 
        s = nums[i] + nums[p1] + nums[p2]
        if s < 0 
          p1 += 1
        elsif s > 0
          p2 -= 1
        else 
          result << [nums[i], nums[p1], nums[p2]]    
          while p1 < p2 && nums[p1] == nums[p1 + 1]
            p1 += 1
          end
          while p1 < p2 && nums[p1] == nums[p2 - 1]
            p2 -= 1
          end
          p1 += 1; p2 -= 1
        end
      end
    end
  end
  result
end