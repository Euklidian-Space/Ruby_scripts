
require 'minitest/autorun'
require "TreeModule.rb"

class TreeTest < MiniTest::Test
  include TreeModule
    
  def test_create_tree_returns_TreeNode
    assert((TreeModule::create_tree [1,2,3]).is_a? TreeNode)
  end
  
end