#This class is a class that simulates a stack.  Which
#is a first in-last out data structure scheme.
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

  def test_full?
    return full?
  end

  def test_empty?
    return empty?
  end

  private

  def full?
    look == nil
  end

  def empty?
    !full?
  end
end

#stack = Stack.new(4)
#stack.push(1)
