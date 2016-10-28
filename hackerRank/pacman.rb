
def dfs(r, c, pacman_r, pacman_c, food_r, food_c, grid)
  
end


def _dfs(r, c, pacman_r, pacman_c, food_r, food_c, grid)
  node = Struct.new(:coords)
  node.new([pacman_c, pacman_r])
  stack = expand(node, grid, r, c)  
  return "#{stack.food[0]} #{stack.food[1]}" if stack.responds_to? :food 
  until stack.empty? do 
    temp = stack.pop
    puts "#{temp[0]} #{temp[1}"
    dfs(r, c, temp[0], temp[1], food_c, food_r, grid)
  end
end


def expand(node, grid, r, c)
  result = MyStack.new
  if node.coords[0] - 1 >= 0
    return { :food => [node.coords[0] - 1, node.coords[1]] } if grid[node.coords[0] - 1][node.coords[1]] == '.'
    result.push([node.coords[0] - 1, node.coords[1]]) if grid[node.coords[0] - 1][node.coords[1]] == '-' #UP
  elsif node.coords[1] - 1 >= 0
    return { :food => [node.coords[0], node.coords[1] - 1] } if grid[node.coords[0]][node.coords[1] - 1] == '.'
    result.push([node.coords[0], node.coords[1] - 1]) if grid[node.coords[0]][node.coords[1] - 1] == '-' #LEFT
  elsif node.coords[1] + 1 <= c 
    return { :food => [node.coords[0], node.coords[1] + 1] } if grid[node.coords[0]][node.coords[1] + 1] == '.'
    result.push([node.coords[0], node.coords[1] + 1]) if grid[node.coords[0]][node.coords[1] + 1] == '-' #RIGHT
  elsif node.coords[0] + 1 <= r
    return { :food => [node.coords[0] + 1, node.coords[1]] } if grid[node.coords[0] + 1][node.coords[1]] == '.'
    result.push([node.coords[0] + 1, node.coords[1]] if grid[node.coords[0] + 1][node.coords[1]] == '-' #DOWN
  end
  result
end




class MyStack 
  attr_reader :top
  
  class StackNode
    attr_accessor :next
    attr_reader :data
    def initialize data 
      @data = data  
    end
  end
  
  def pop
    raise 'EmptyStackError' if self.empty?
    item = top.data
    @top = @top.next 
    item
  end
  
  def push data 
    old = top
    @top = StackNode.new data 
    @top.next = old
    self
  end
  
  def peek
    top.data  
  end
  
  def empty?
    top.nil?  
  end
  
end