require 'byebug'
require_relative 'SetErrors.rb'

class MySet

  attr_reader :set

  def initialize(num = 0)
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

  # def stack(obj) <----may or may not implement this method.  At the moment it seems superfluous
  #   @set << obj
  # end

  def ==(other)
    return false if self.cardinality != other.cardinality
    match?(self.set, other.set)
  end

  def <=(other)
    return true if self.empty? #the empty set is a subset of any set

    match?(self.set, other.set)
  end

  
  def -(other) 
    op_method('none?', self, other)
  end

  def intersection(other)
    op_method('any?', self, other)
  end

  private

    def op_method(method, self_obj, other_obj)
      resultant_set = MySet.new
      i = 0
      self_obj.set.each do |a|
        elem = other_obj.set.public_send(method) {|e| 
          debugger
          match?(a,e)
        }
        if elem
          resultant_set.place(i, a)
          i += 1
        end
      end
      resultant_set
    end

    def match?(objA, objB)
      return array_match?(objA, objB) if objA.is_a?(Array) && objB.is_a?(Array)
      return hash_match?(objA, objB) if objA.is_a?(Hash) && objB.is_a?(Hash)
      objA == objB
    end

    def array_match?(arrayA, arrayB)
      arrayA.each do |a|

        index = arrayB.find_index {|e| match? a,e}
        return false if index.nil?
        #yield index if block_given? && index
      end
      true
    end

    def hash_match?(hashA, hashB)
      return false if hashA.keys.sort != hashB.keys.sort
      hashA.each {|key,val| return false unless match? val, hashB[key]}
      true
    end



end
