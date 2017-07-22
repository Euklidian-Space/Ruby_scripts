class GraphNode
  attr_reader :name, :children
  def initialize(name, children = [])  
    @name = name
    @children = children
    @marked = false
  end
  
  def marked?
    @marked 
  end
  
  def mark
    @mark = true 
  end
  
  def unmark
    @mark = false 
  end
  
end