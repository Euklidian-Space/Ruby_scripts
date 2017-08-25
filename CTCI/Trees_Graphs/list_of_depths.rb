require_relative "ListNode.rb"
require_relative "GraphNode.rb"
require_relative "min_tree.rb"

# bfs solution 
def list_of_depths(root)
  q, result, lvl = Queue.new, [ListNode.new(root)], 1
  q.enq root 
  until q.empty? do 
    n, head = q.deq, nil 
    next unless n
    n.children.each do |child|
      q.enq child 
      if head 
        head.next = ListNode.new child 
      else
        head = ListNode.new child 
      end
    end 
    result[lvl] = head 
    lvl += 1
  end 
  result 
end 



# dfs solution 
# def list_of_depths(root)
#   dfs = lambda do |t_node, h, count|
#     return h if t_node.nil?
#     h[count] += [t_node]
#     t_node.children.each do |child|
#       dfs.call(child, h, count + 1)  
#     end
#     h
#   end
#   dfs.call(root, Hash.new([]), 0)
# end

# def create_level_list(arr)
#   n = ListNode.new(arr[0])
#   return n if arr.length == 1
#   n.next = create_level_list(arr[1..arr.length - 1])
#   n
# end