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

class EmptyStackError < RuntimeError
end