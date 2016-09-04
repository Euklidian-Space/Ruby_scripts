require "pry"

class Node
  attr_accessor :next 
  attr_reader :data
  
  def initialize data 
    @data = data
    @next = nil
  end
  
  def append data 
    n = self
    while !n.next.nil?
      n = n.next   
    end
    n.next = Node.new data
    self
  end
    
end



def delete_node(head, data)
  return head.next if head.data == data
  n = head
  until n.next.nil? do 
    if n.next.data == data
      n.next = n.next.next
      return head
    else
      n = n.next
    end
  end
  head
end

def make_int_list(args)
  head = Node.new args.shift
  args.each do |arg|
    head.append arg  
  end
  head
end