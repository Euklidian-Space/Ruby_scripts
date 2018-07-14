#!/bin/ruby

def maximumSum(a, m)
	a.reduce(0) do |curr_max, elem|
		
  end
end

q = gets.strip.to_i
for a0 in (0..q-1)
    n, m = gets.strip.split(' ')
    n = n.to_i
    m = m.to_i
    a = gets.strip
    a = a.split(' ').map(&:to_i)
    result = maximumSum(a, m)
    puts result
end
