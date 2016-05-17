require 'minitest/autorun'
require "TreeModule.rb"

class NodeTest < MiniTest::Test
  include TreeModule 
  NODE_A = TreeModule::TreeNode.new 1
  NODE_B = TreeModule::TreeNode.new 2
  
  def test_initialize_children_elements_must_be_TreeNodes
    assert_raises TypeError do
      TreeModule::TreeNode.new(1,[1,'a'])
    end
  end
  
  def test_next_returns_arr
    assert(NODE_A.children.is_a? Array)     
  end
  
  def test_birth_increases_children_size
    NODE_A.birth NODE_B  
    assert(NODE_A.children.include?(NODE_B), 'birth should push argument into children')
  end
  
  def test_birth_only_accepts_TreeNodes
    assert_raises TypeError do
      NODE_A.birth 1
    end
  end
  
  
  def test_merge_returns_a_TreeNode
    result = NODE_A.merge NODE_B
    assert(result.is_a?(TreeModule::TreeNode), "should be a #{NODE_A.class}, instead got a #{result.class}")
  end
  
  def test_merge_only_accepts_TreeNodes
    assert_raises TypeError do
      NODE_A.merge 1  
    end
  end
  
end