# Let me illustrate with 1/7.  First calculation of the remainder of 1/7 gives us 1.

# Second calculation to analyse the remainder on the first decimal place we multiply by 10,  and divide by 7. The remainder of 10/7 is 3.

# In the third calculation we get 30/7 which gives us a remainder of 2.

# In the fourth calculation we get 20/7 which gives us a remainder of 6.

# In the fifth calculation we get 60/7 which gives us a remainder of 4.

# In the sixth calculation we get 40/7 which gives us a remainder of 5.

# In the seventh calculation we get 50/7 which gives us a remainder of 1.

# We already have had a remainder of 1 on the first calculation which means that we continue the calculations we will see the same pattern emerge again, since 10/7 gives us 3 and so on.  Thus we have found the longest recurring cycle in 1/7. Or rather we have found the length of the recurring cycle in 1/7 which is 7-1 = 6 digits long.

# This is a pretty simple solution approach, where all we need to do is to keep calculating the remainder and keep track of the already found remainders.

# One more thing to note is that the maximum recurring cycle length of 1/d is d-1, as it is pretty obvious from the example. We can get d-1 different possible remainders from the number, since if the result is equal to or greater than d, then it is not a remainder.

# What that means is that we are more likely to find a large recurring cycle when d is large, and we can stop the search once d becomes lower than the longest recurring cycle we have found.
require "prime"
def longest_cycle_num(limit)
  max = 0
  cand = 0
  Prime.each do |n|
    break if n >= limit
    length = cycle_length n 
    if length > max 
      max, cand = length, n
    end 
  end
  cand
end

def cycle_length num 
  return 0 if num % 2 == 0 or num % 5 == 0
  
  1.upto(num - 1).each do |k|
    return k if (10**k) % num == 1
  end
end





#puts recip_cycles


