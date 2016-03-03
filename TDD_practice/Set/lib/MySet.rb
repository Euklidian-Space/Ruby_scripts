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
    #debugger
      return array_match?(objA, objB) if objA.is_a?(Array) && objB.is_a?(Array)
      objA == objB
    end

    def array_match?(arrayA, arrayB)
      debugger
      arrayA.each do |a|
        debugger
        index = arrayB.find_index {|e| match? a,e}
        return false if index.nil?
      end
      true
    end

    def hash_match?(hashA, hashB)
      #   return false if objA.keys.sort != objB.keys.sort
      #   hashA.each {|key,val| return false if val != hashB[key]}
      #   true
    end



end
