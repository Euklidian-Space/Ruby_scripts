require "pry"
#this solution was taking hours for a 20x20 grid
# def lattice_paths(dim, i = 0, j = 0)
#   puts [i,j]
#   return 1 if i == dim - 1 && j == dim - 1
#   if j == dim - 1
#     lattice_paths(dim, i + 1, j)
#   elsif i == dim - 1
#     lattice_paths(dim, i, j + 1)  
#   else
#     lattice_paths(dim, i, j + 1) + lattice_paths(dim, i + 1, j)
#   end
# end

def lattice_paths(dim)
  grid = []
  (dim + 1).times { grid << Array.new(dim + 1) }
  for i in (0..dim) do
    grid[dim][i] = 1
    grid[i][dim] = 1
  end
  (dim - 1).downto(0) do |i|
    (dim - 1).downto(0) do |j|
      grid[i][j] = grid[i + 1][j] + grid[i][j + 1]
    end
  end
  grid[0][0]
end