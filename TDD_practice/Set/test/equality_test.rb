require "minitest/autorun"
#require_relative "TestSetModule"
require "MySet.rb"

class EqualityTest < MiniTest::Test
  
  def test_equality_between_sets_without_data_structure_elements_and_order
    setA = build_set(5)
    setB = build_set(5)
    assert(setA == setB, 'Sets with identical elements should be equal')
  end
  
  def test_equality_between_sets_without_data_structure_elements_ignoring_order
    setA = MySet
    
    setB = build_set(5)
    assert(setA == setB, 'Sets with identical elements should be equal')
  end
  
  
  private
  
    def build_set(num)
      set = MySet.new(num)
      i = 0
      j = 1
      while i < set.cardinality - 1 do
        set.place(i, j)
        i += 1
        j += 1
      end
      
      set
    
    end
  
end