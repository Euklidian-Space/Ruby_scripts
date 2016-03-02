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
    
  end
  
  private
  
  def arrays_match?(objA, objB)
    setA = self.set 
    setB = other.set
    setA.each do |a|
      index = setB.find_index { |e| match? a,e }
      return false if index.nil?
      setB.delete_at(index)
    end
    setB.length == 0
  end
  
  def hashes_match?(objA, objB)
    return false unless objA.keys.sort == objB.keys.sort
    objA.each { |key,val| return false unless match? val, objB[key] }
    true
  end
  
end