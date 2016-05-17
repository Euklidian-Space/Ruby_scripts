require "pry"

module TreeModule
  
  class TreeNode
    attr_reader :data, :children
    
    def initialize(data, child_nodes = []) 
      unless child_nodes.empty?
        raise TypeError if child_nodes.any?{ |elem| !is_tree_node?(elem) }
      end
      @data = data
      @children = child_nodes
    end
    
    def merge other
      raise TypeError unless is_tree_node? other
      self.children + other.children
      self
    end
    
    def birth node
      raise TypeError unless is_tree_node? node
      @children << node
    end
    
    private
    
      def is_tree_node? arg
        arg.is_a? TreeNode
      end
     
  end
  
  def create_tree arr
    return [] if arr.empty?
    TreeNode.new(arr.first, create_tree(tail arr))
  end
  
  def tail arr
    
    arr.last(arr.length - 1)  
  end
  
end