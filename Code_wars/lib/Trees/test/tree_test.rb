
require 'minitest/autorun'
require "GraphModule.rb"

class TreeTest < MiniTest::Test
  include GraphModule
  
  def setup
    @NODE_A = GraphModule::Node.new 1
    @NODE_B = GraphModule::Node.new 2
    #TREE = GraphModule.create_tree [1,2,3]
    @TREE_B = GraphModule::Node.new 4
    @TREE_B.birth @NODE_A
    @TREE_B.birth @NODE_B
    @triplets_1 = [
      ['t','u','p'],
      ['w','h','i'],
      ['t','s','u'],
      ['a','t','s'],
      ['h','a','p'],
      ['t','i','s'],
      ['w','h','s']
    ]
    @nodeHash = GraphModule.build_node_hash @triplets_1.flatten.uniq
  end
    
  # def test_create_tree_returns_Node
  #   skip
  #   assert((GraphModule.create_tree [1,2,3]).is_a? Node)
  # end
  
  # def test_create_tree_grand_child
  #   skip
  #   assert TREE.children.first.children.first.data == 3    
  # end
  
  def test_merge_absorbs_arguments_children
    @NODE_A.merge @NODE_B
    assert @NODE_A.children.contains_all? @NODE_B.children
  end
  
  def test_merge_of_trees
    #TREE.merge @TREE_B
  end
  
  def test_build_node_hash_has_correct_amount_of_elements
    assert (@triplets_1.flatten.uniq.count == @nodeHash.count)
  end
  
  def test_build_node_hash_has_a_node_for_every_key
    @triplets_1.flatten.uniq.each{ |e| assert(@nodeHash[e].is_a? Node) }
  end
  
  def test_connect_nodes_returns_node_hash
    assert GraphModule.connect_nodes!(@nodeHash, @triplets_1) == @nodeHash
  end
  
  def test_connect_nodes_altered_children_of_non_terminal_nodes
    nodes_before_connection = @nodeHash.each.reject {|k,v| k == 'p' }.to_h
    GraphModule.connect_nodes!(@nodeHash, @triplets_1)
    nodes_before_connection.each { |k,node| refute(node.children == @nodeHash[k].children, 'Non terminal nodes should have children.' + "#{k}") }
  end
  
end

class Array

  def contains_all? other
    return true if other.empty?
    return false unless self.include? other.first
    contains_all? other.tail 
  end
  
  def tail 
    self.last(length - 1)
  end
  
end