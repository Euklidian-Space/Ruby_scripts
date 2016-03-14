require 'minitest/autorun'
#require_relative "TestSetModule"
require 'MySet.rb'

class TestSetCardinality < MiniTest::Test
  
  def test_every_set_has_cardinality
    set = set_MySet(0)
    assert_respond_to(set, :cardinality, 'every set should have cardinality')
  end
  
  def test_for_empty_set
    set = set_MySet(0)
    assert(set.empty?)
  end

  def test_for_non_empty
    set = set_MySet(1)
    refute(set.empty?)
  end
  
  def test_cardinality_should_always_equal_number_of_elements
    set = set_MySet(2)
    assert(set.cardinality == 2)
  end
  
  def test_should_not_be_able_to_set_cardinality
    set = set_MySet(3)
    
    assert_raises NoMethodError do
      set.cardinality = 1
    end
  end
  
  private
  
    def set_MySet(num)
      MySet.new(num)
    end
  
    
 
end