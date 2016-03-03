require "minitest/autorun"
#require_relative "TestSetModule"
require "MySet.rb"

class EqualityTest < MiniTest::Test
  #
  # def test_equality_between_sets_without_data_structure_elements_and_order
  #   setA = build_set(5)
  #   setB = build_set(5)
  #   assert(setA == setB, 'Sets with identical elements should be equal')
  # end
  #
  # def test_equality_between_sets_without_data_structure_elements_ignoring_order
  #   setA = MySet.new(2)
  #   setB = build_set(2)
  #   setA.place(0,1)
  #   setA.place(1,2)
  #   setB.place(0,2)
  #   setB.place(1,1)
  #   assert(setA == setB, 'Sets with identical elements should be equal')
  #   setB.place(1,3)
  #   refute(setA == setB)
  # end
  #
  # def test_equality_between_sets_with_array_elements
  #   setA = MySet.new(2)
  #   setB = MySet.new(2)
  #   setA.place(0,[2,1])
  #   setA.place(1,3)
  #   setB.place(0,3)
  #   setB.place(1,[1,2])
  #   assert(setA == setB, 'Set with identical elements shoud be equal')
  #   #debugger
  #   setB.place(1,[1,0])
  #   refute(setA == setB)
  # end

  def test_equality_between_sets_with_hash_elements
    setA = MySet.new(2)
    setB = MySet.new(2)
    setA.place(0,{one:1, two:2})
    setA.place(1,3)
    setB.place(0,3)
    setB.place(1, {two:2, one:1})
    debugger
    assert(setA == setB)
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
