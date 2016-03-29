# Linked Lists - Push & BuildOneTwoThree

# Write push() and buildOneTwoThree() functions to easily update and initialize linked lists. Try to use the push() function within your buildOneTwoThree() function.

# Here's an example of push() usage:

# var chained = null
# chained = push(chained, 3)
# chained = push(chained, 2)
# chained = push(chained, 1)
# push(chained, 8) === 8 -> 1 -> 2 -> 3 -> null

# The push function accepts head and data parameters, where head is either a node object or null/None/nil. Your push implementation should be able to create a new linked list/node when head is null/None/nil.

# The buildOneTwoThree function should create and return a linked list with three nodes: 1 -> 2 -> 3 -> null

class Node
  attr_accessor :data, :next
  def initialize(data)
    @data = data
    @next = nil
  end
end

def push(node, data)
  next_node = Node.new(data)
  return next_node unless node
  next_node.next = node
  next_node
end

def build_one_two_three
	# Good Luck!
	generate_linked_list(3,2,1)
end

def generate_linked_list(tail_data, *data)
  head = push(nil,tail_data)
  data.each do |d|
    head = push(head, d)
  end
  head 
end

def length(list)
  list.nil? ? 0 : 1 + length(list.next)
end

def count(node, data)
  
  node ? 
    (node.data == data ? 1 : 0) + count(node.next, data) : 0
  
end

def get_nth(list, index)
  raise 'Index out of range' unless (0..length(list) - 1).include? index || list
  index == 0 ? list : get_nth(list.next, index - 1)
end

def insert_nth(head, index, data)
  raise 'Index out of range' unless (0..length(list) - 1).include? index || list 
  getNth(head, index).data = data
  head
end



