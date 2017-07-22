require_relative "GraphNode.rb"
require_relative "Graph.rb"

def route?(nodeA, cand)
  return true if nodeA.name == cand.name 
  nodeA.mark
  nodeA.children.each do |child|
    unless child.marked? 
      route?(child, cand)  
    end
  end
end 

def traverse(nodes, cand)
  
end

# def leaf?(node) 
#   node.children.nil?
# end