require_relative "ListNode.rb"

def list_of_depths(root)
  dfs = lambda do |t_node, h, count|
    return h if t_node.nil?
    h[count] += [t_node]
    t_node.children.each do |child|
      dfs.call(child, h, count + 1)  
    end
    h
  end
  dfs.call(root, Hash.new([]), 0)
end

def create_level_list(arr)
  n = ListNode.new(arr[0])
  return n if arr.length == 1
  n.next = create_level_list(arr[1..arr.length - 1])
  n
end