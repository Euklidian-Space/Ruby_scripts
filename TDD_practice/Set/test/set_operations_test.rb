require 'minitest/autorun'
require 'MySet.rb'

class SetOperationsTest < MiniTest::Test
  
  def test_complement_operation_returns_a_set
    setA = build_set(4)
    setB = build_set(2)
    assert((setA - setB).class == MySet)
  end
  
  def test_complement_operation_on_sets_with_primitive_elements
   setA = build_set(4)
   setB = build_set(2)
   assert((setA - setB).set == [3,4])
  end
  
  def test_complement_operation_on_sets_with_array_elements
    skip()
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