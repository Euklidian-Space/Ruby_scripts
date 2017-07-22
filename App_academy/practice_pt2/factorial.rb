def factorial(n)
  n.downto(1).inject(1) { |result, num| result * num }
end 