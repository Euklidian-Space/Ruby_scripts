require_relative "GraphNode.rb"
#require_relative "Graph.rb"
require "pry"

def route?(nodeA, cand)
  byebug
  return true if nodeA == cand
  nodeA.mark
  nodeA.children.each do |child|
    if !child.marked? && route?(child, cand) 
      return true 
    end
  end
  false
end 
