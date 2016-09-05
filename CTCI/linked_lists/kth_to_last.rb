require './Node.rb'

def kth_to_last(head, k)
  length, node = 0, head 
  until node.next.nil? do 
    length += 1
    node = node.next 
  end
  node_index, node = length + 1 - k, head
  until node_index == 0 do 
    node_index -= 1
    node = node.next 
  end
  node
end