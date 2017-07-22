class ListNode
  attr_accessor :next
  attr_reader :data
  def initialize(data)  
    @data = data 
    @next = nil
  end
  
  def length
    _length self, 0
  end
  
  private
    def _length(list_node, count)
      return count if list_node.nil?    
      _length(list_node.next, count + 1)
    end
end