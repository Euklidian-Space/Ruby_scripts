
require 'pry'
class Stack
  def initialize(size)
    @store = Array.new(size)
    @top = -1
  end

  def pop
    #binding.pry
    return nil if empty?
    popped = @store[@top]
    @store[@top] = nil
    @top = @top.pred
    popped
  end

  def push(element)
    if full? or element.nil?
      nil
    else
      #binding.pry
      @store[@store.index {|elem| elem.nil?}] = element
      @top = @top.succ
      self
    end
  end

  def size
    @store.length
  end

  def look
    @store[@top]
  end

  private

  def full?
    return false if look.nil?
    return true
  end

  def empty?
    return true if !full?
  end
end

#stack = Stack.new(4)
#stack.push(1)
