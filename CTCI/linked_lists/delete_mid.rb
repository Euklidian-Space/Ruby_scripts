require "./Node.rb"

def delete_mid head 
  node_arr, node = [], head  
  until node.nil? do 
    node_arr << node 
    node = node.next
  end
  mid_idx = (node_arr.length / 2.0)
  mid_idx.send(:ceil) if node_arr.length.even?
  node_arr[mid_idx - 1].next = node_arr[mid_idx + 1]
  head
end