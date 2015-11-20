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
    #requeue_chk
    if empty?
      nil
    else
      popped = @store[@front]
      if @back >= 0 and @back < size
        @back = @back.succ
      else
        @back = @back.pred
      end
      @store[@front] = nil
      queue_shift
      popped
    end
  end

  def enqueue(element)
    #requeue_chk
    if element.nil? or full?
      nil
    else
      #@store[@back] = element
      #@back = @back.pred if @back > 0 and @back < size
      #requeue_chk
      @store[@back] = element
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

  def queue_shift
    @store = @store.rotate(-1)
  end

  def requeue_chk
    if (@back == 0) or empty?
      @back = @front
      #@front = @size - 1
    end
  end

end
