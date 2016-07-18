def sum_square_diff n
  first_n = (n * (n + 1))/2
  first_squares = (n*(n + 1)*(2*n + 1)) / 6
  -first_squares + first_n**2
end