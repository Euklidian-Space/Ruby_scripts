class GraphNode
  attr_reader :name
  attr_accessor :children
  def initialize(name, children = [])  
    @name = name
    @children = children
    @marked = false
  end
  
  def marked?
    @marked 
  end
  
  def mark
    @marked = true 
  end
  
  def unmark
    @marked = false 
  end
  
end