
class Node
  include Enumerable
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
  
  def each 
    temp = self
    until temp.nil? do 
      yield temp
      temp = temp.next
    end
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

def delete_node!(head, data)
  #return head.next if head.data == data
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

#make_int_list is for testing purposes

def make_int_list(args)
  head = Node.new args[0]
  args[1..args.length - 1].each { |arg| head.append arg }
  head
end


def make_circular_list 
  list = make_int_list([1,2,3,4,5])
  bad_node = Node.new 'x' 
  start = list.next.next
  list.append bad_node
  bad_node.append start
  list
end
















