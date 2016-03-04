require 'minitest/autorun'
#require_relative "TestSetModule"
require 'MySet.rb'

class PushPopTest < MiniTest::Test
  
  def test_place_method
    set = MySet.new(3)
    index = 1
    elem = 2
    set.place(index, elem)
    assert(set.set[1] == 2, "place method should put #{elem} at index #{index}")
  end
  
  def test_out_of_bounds
    set = MySet.new(4)
    index = 4
    elem = 2
    assert_raises OutOfBoundsError do
      set.place(index, elem)
      set.place(-1, 3)
    end
    
  end
  
  def test_element_removal_reduces_cardinality_by_one
    
    set = build_set(5)
    set.remove(1)
    
    assert(set.cardinality == 4, 'cardinality should be one less after removing a single element')
    
  end
  
  def test_removal_only_removes_one_element
    set = build_set(4)
    original_set = set.set 
    set.remove(0)
    assert(set.set.index(original_set[1]), 'the removal of one element should not affect any others')
  end
  
  def test_stacking_functionality_on_new_set
    setA = MySet.new(4)
    setA.stack(1)
    assert(setA.set[0] == 1)
    assert(setA.set[setA.cardinality - 1] == nil)
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