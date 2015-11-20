#This class is a class that simulates a queue.  Which
#is a first in-first out data structure scheme.

class Queue
  def initialize(size)
    @size = size
    @front = @size - 1
    @store = Array.new(@size)
  end

  def dequeue
    #requeue_chk
    if empty?
      nil
    else
      popped = @store[@front]
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
      @store[@store.rindex(nil)] = element
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

  def self.reload
    #this class method is for testing purposes in irb
    load 'Queue.rb'
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

  

end
