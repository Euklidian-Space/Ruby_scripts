require 'pry'

def getPrincessLocation(grid)
  if grid[0][0] == 'P'
    return [0,0]
  elsif grid[0][grid.length - 1] == 'P'
    return [0, grid.length - 1]
  elsif grid[grid.length - 1][0] == 'P'
    return [grid.length - 1, 0]
  elsif grid[grid.length - 1][grid.length - 1] == 'P'
    return [grid.length - 1, grid.length - 1]
  end
  nil
end

def displayPathtoPrincess(n,grid)
  result = ""
  _p = getPrincessLocation(grid)
  m = [(n / 2), (n / 2)]
  path = [m[0] - _p[0], m[1] - _p[1]]
  if path[0] < 0
    (-1 * path[0]).times do 
      result << "DOWN" + "\n"
    end
  else
    path[0].times do 
      result << "UP" + "\n"
    end
  end
  
  if path[1] < 0
    (-1 * path[1]).times do
      result << "RIGHT" + "\n"
    end
  else
    path[1].times do
      result << "LEFT" + "\n" 
    end
  end
  result
end

m = gets.to_i

grid = Array.new(m)

(0...m).each do |i|
  grid[i] = gets.strip
end

puts displayPathtoPrincess(m, grid)