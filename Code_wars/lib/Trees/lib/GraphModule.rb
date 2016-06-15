require "pry"

module GraphModule
  
  class Node
    attr_reader :data, :children
    attr_accessor :parents
    
    def initialize data
      @data = data
      @children = []
      @parents = []
    end
    
    def merge other
      raise TypeError unless is_node? other
      self.children + other.children
      self
    end
    
    def birth node
      raise TypeError unless is_node? node
      @children << node unless self.children.include? node
      node.parents << self  
    end
    
    private
    
      def is_node? arg
        arg.is_a? Node
      end
      
  end
  
  # def self.create_tree arr
  #   return [] if arr.empty?
  #   Node.new(arr.first, [create_tree(tail arr)])
  # end
  
  def self.build_node_hash(arr)
    hash = {} 
    arr.each { |e| hash[e] = Node.new(e) }
    hash
  end
  
  def self.connect_nodes!(nodeHash, scheme)
    return nodeHash if scheme.empty?
    for i in (1..scheme.first.length - 1) do
      nodeHash[scheme.first[i - 1]].birth nodeHash[scheme.first[i]]
    end
    connect_nodes!(nodeHash, tail(scheme))
  end
  
  def self.tail arr
    arr.last(arr.length - 1)  
  end
  
end