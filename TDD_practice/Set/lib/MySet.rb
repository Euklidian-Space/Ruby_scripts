require 'byebug'

class MySet
  attr_reader :cardinality
  attr_reader :set
  
  def initialize(num)
   @set =  Array.new(num)
   @cardinality = num
  end
  
  def empty?
    cardinality == 0
  end
end