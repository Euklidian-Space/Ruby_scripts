require 'minitest/autorun'
require 'MySet.rb'

class UnionOperationTest < MiniTest::Test
  
  def test_union_operation_returns_a_new_set
    setA = MySet.new
    setB = MySet.new
    assert((setA.union setB).class == MySet)
  end
  
  def test_union_of_equal_sets
    setA = build_set(3)
    setB = build_set(3)
    assert((setA.union setB) == setA)
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