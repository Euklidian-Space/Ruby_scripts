class TreeNode
  attr_accessor :left, :right
  attr_reader :value
  def initialize val
    @value = val  
  end
  
end

def nodes_with_level(node, level = 0, hash = nil)
  node ? 
    ([[level, node]] + nodes_with_level(node.left, level + 1) + nodes_with_level(node.right, level + 1)) 
      : []
end

def values_by_level node
  hash = Hash.new { |h,k| h[k] = Array.new }
  (nodes_with_level node).each { |e| hash[e.first] <<= e.last.value }
  hash
end

def tree_by_levels node
  nodes_with_level(node).sort{ |elem| elem.first }.map { |tree_node| tree_node.last.value }
end

# def tree_by_levels node
#   vals = []
#   return vals unless node
#   (values_by_level node).each_value { |val| vals << val }
#   vals.flatten
# end


