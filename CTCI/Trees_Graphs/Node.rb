class Node
  attr_reader :data, :children
  
  def initialize(data, children = []) 
    @data = data
    @children = children
  end
  
  def left
    @children[0]  
  end
  
  def right
    @children[1] 
  end
  
  def append child 
    raise 'Children Full' if @children.length == 2
    @children << Node.new(child)
  end
end

def create_bin_tree(arr, root = nil)
  return root if arr.empty?
  temp = arr[0..2]
  root ||= Node.new temp[0]
  temp[1..-1].each { |e| root.append e }
  create_bin_tree(arr[3..-1], root)
end



