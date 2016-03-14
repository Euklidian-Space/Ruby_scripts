require 'minitest/autorun'
require 'MySet.rb'

class SetComplementTest < MiniTest::Test
  
  # def test_complement_operation_returns_a_set
  #   setA = build_set(4)
  #   setB = build_set(2)
  #   assert((setA - setB).class == MySet)
  # end
  
  # def test_complement_operation_on_sets_with_primitive_elements
  # setA = build_set(4)
  # setB = build_set(2)
  # assert((setA - setB).set == [3,4])
  # end
  
  # def test_complement_operation_on_equal_sets_returns_the_empty_set
  #   setA = build_set(4)
  #   setB = build_set(4)
  #   assert((setA - setB).cardinality == 0)
  # end
  
  # def test_complement_operation_on_sets_with_array_elements
  #   setA = MySet.new(3)
  #   setB = MySet.new(2)
  #   setA.place(0,[2,1])
  #   setA.place(1,[12,89])
  #   setA.place(2,[0])
  #   setB.place(0,[0])
  #   setB.place(1,1)
  #   assert((setA - setB).set == [[2,1], [12,89]])
  #   assert((setB - setA).set == [1])
  #   setB.place(0,[89,12])
  #   assert((setA - setB).set == [[2,1],[0]])
  # end
  
  # def test_complement_operation_on_sets_with_hash_elements
  #   setA = MySet.new(3)
  #   setB = MySet.new(2)
  #   setA.place(0, {one:1, two:[0,1]})
  #   setA.place(1, ['a','b'])
  #   setA.place(2, 8)
  #   setB.place(0,9)
  #   setB.place(1, {two:[1,0], one:1})
  #   assert((setA - setB).set == [['a','b'], 8])
  #   assert((setB - setA).set == [9])
  # end
  
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