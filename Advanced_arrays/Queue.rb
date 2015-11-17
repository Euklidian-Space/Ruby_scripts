#This class is a class that simulates a queue.  Which
#is a first in-first out data structure scheme.

class Queue
  def initialize(size)
    @size = size
    @back = @size - 1
    @store = Array.new(@size)
  end

  def dequeue
    @store[@back]
  end

  def enqueue(element)
    if element.nil? or full?
      nil
    else
      @store[@back] = element
      @back = @back.pred
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
    @back == 0
  end

  def empty?
    @store[@size - 1].nil?
  end
end
