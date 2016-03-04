require "minitest/autorun"
#require_relative "TestSetModule"
require "MySet.rb"

class SubsetTest < MiniTest::Test
  def test_a_set_is_a_subset_of_itself
    setA = MySet.new(3)
    
    assert(setA <= setA, 'A set is a subset of itself')
  end
  
  def test_the_empty_set_is_a_subset_of_every_set
    empty_set = MySet.new(0)
    setA = MySet.new(3)
    assert(empty_set <= setA)
    refute(setA <= empty_set, 'a non empty set cannot be a subset of the empty set')
  end
  
  def test_for_proper_subset_primitive_elements
    setA = build_set(5)
    setB = build_set(3)
   
    assert(setB <= setA)
  end
  
  def test_for_proper_subset_with_array_elements
    
  end
  
  private
  
    def build_set(num)
      set = MySet.new(num)
      i = 0
      j = 1
      while i < set.cardinality do
        set.place(i, j)
        i += 1
        j += 1
      end

      set

    end
  
end