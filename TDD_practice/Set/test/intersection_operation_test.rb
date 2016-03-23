require 'minitest/autorun'
require 'MySet.rb'

class IntersectionOperationTest < MiniTest::Test

  def test_intersection_operation_returns_a_new_set
    setA = MySet.new
    setB = MySet.new
    assert((setA.intersection setB).class == MySet)
    refute((setA.intersection setB).object_id == setB.object_id || (setA.intersection setB).object_id == setA.object_id)
  end


  def test_intersection_of_equal_sets
    setA = build_set(3)
    setB = build_set(3)
    assert((setA.intersection setB) == setA)
  end

  

  def test_intersection_of_a_set_with_its_subset_is_equal_to_the_subset
    setA = build_set(3)
    setB = build_set(2)
    assert((setA.intersection setB) == setB)
  end

  def test_intersection_of_sets_with_array_elements
   
    setA = MySet.new(3)
    setB = MySet.new(2)
    setC = MySet.new(4)
    i = 0
    4.downto(1) do |t|
      setC.place(i, t)
      i+=1
    end
    setA.place(0, [1,2])
    setA.place(1, [4,3,2,1])
    setA.place(2, 4)
    setB.place(0, [4,3,2,1])
    setB.place(1, 1)
   
    assert((setA.intersection setB) == setC)
  end

  def test_intersection_of_sets_with_hash_elements
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
