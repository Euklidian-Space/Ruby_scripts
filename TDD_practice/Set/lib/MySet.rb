require 'byebug'
require_relative 'SetErrors.rb'

class MySet
  
  attr_reader :set
  
  def initialize(num)
   @set =  Array.new(num)
  end
  
  def cardinality
    @set.length
  end
  
  def empty?
    cardinality == 0
  end
  
  def place(index, elem)
    @set[index] = elem
    if index >= cardinality || index < 0
      raise OutOfBoundsError, 'index Specified is out of bounds'
    end
  end
  
  def remove(index)
    new_arr = []
    i = 0
    while i < cardinality do
      new_arr << set[i] unless i == index 
      i+=1
    end
    @set = new_arr
  end
  
  def ==(other)
    match?(self.set, other.set)
  end  
  
  private
  
  def match?(objA, objB)
    objA == objB
  end
  
  
  
end