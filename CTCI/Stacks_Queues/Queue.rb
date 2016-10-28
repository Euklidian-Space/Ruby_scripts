class MyQueue 
  attr_reader :top
  
  class QueueNode
    attr_reader :data
    attr_accessor :next
    def initialize data 
      @data = data  
    end
  end
  
  def add item 
    self.empty? ? @top = QueueNode.new(item) : @top.next = QueueNode.new(item)
    self
  end
  
  def remove 
    raise 'Empty Queue' if self.empty?
    item = top.data 
    @top = @top.next
    item 
  end
  
  def peek 
    top  
  end
  
  def empty?
    top.nil?  
  end
  
end