require 'minitest/autorun'
require "GraphModule.rb"

class NodeTest < MiniTest::Test
  include GraphModule 
  def setup
    @NODE_A = GraphModule::Node.new 1
    @NODE_B = GraphModule::Node.new 2
  end
  
  def test_initialize_children_elements_must_be_Nodes
    skip
    assert_raises TypeError do
      GraphModule::Node.new(1,[1,'a'])
    end
  end
  
  def test_next_returns_arr
    assert(@NODE_A.children.is_a? Array)     
  end
  
  def test_birth_increases_children_size
    @NODE_A.birth @NODE_B
    assert(@NODE_A.children.include?(@NODE_B), 'birth should push argument into children')
  end
  
  def test_birth_only_accepts_Nodes
    assert_raises TypeError do
      @NODE_A.birth 1
    end
  end
  
  def test_birth_does_not_push_duplicates_to_children_attribute
    2.times { @NODE_A.birth @NODE_B }
    assert(@NODE_A.children.length == 1, "there should be 1 node in children, instead there were #{@NODE_A.children.count}")
  end
  
  def test_birth_updates_parent_attribute_of_child
    @NODE_A.birth @NODE_B
    assert @NODE_B.parents.include? @NODE_A
  end
  
  
  def test_merge_returns_a_Node
    result = @NODE_A.merge @NODE_B
    assert(result.is_a?(GraphModule::Node), "should be a #{@NODE_A.class}, instead got a #{result.class}")
  end
  
  def test_merge_only_accepts_Nodes
    assert_raises TypeError do
      @NODE_A.merge 1  
    end
  end
  
end