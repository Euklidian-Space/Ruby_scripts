#This class is a class that simulates a queue.  Which
#is a first in-first out data structure scheme.

class Queue
  def initialize(size)
    @size = size
    @back = @size - 1
    @front = @size - 1
    @store = Array.new(@size)
  end

  def dequeue
    if empty?
      nil
    else
      #popped = @back == 0 ? @store[@back] : @store[@back + 1]

      #@store[@back == 0 ? @back : @back + 1] = nil
      popped = @store[@front]
      @store[@front] = nil
      @front = @front.pred if @front < size - 1 and @front > 0
      popped
    end
  end

  def enqueue(element)
    if element.nil? or full?
      nil
    else
      @store[@back] = element
      @back = @back.pred if @back > 0 and @back < size
      self
    end
  end

  def size
    @store.length
  end

  def test_full?
    full?
  end

  def test_empty?
    empty?
  end


  private

  def full?
    @store.index{|elem| elem.nil?} == nil
  end

  def empty?
      @store.index{|elem| !elem.nil?} == nil
  end
end
