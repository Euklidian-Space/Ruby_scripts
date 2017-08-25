def balanced?(root)
  inner = lambda do |n, count|
    return count - 1 unless n 
    left_height = inner.call(n.left, count + 1)
    right_height = inner.call(n.right, count + 1)
    if left_height == :fail || right_height == :fail 
      :fail 
    elsif (left_height - right_height).abs > 1
      :fail 
    else 
      [left_height, right_height].max 
    end 
  end
  inner.call(root, 0) == :fail ? false : true
end



# def balanced?(root)
#   chk_height = lambda do |node|
#     return -1 if node.nil?
#     left_path = chk_height.call(node.left)
#     return :height_error if left_path == :height_error
#     right_path = chk_height.call(node.right) 
#     return :height_error if right_path == :height_error
#     height_diff = left_path - right_path
#     if height_diff.abs <= 1
#       [left_path, right_path].max + 1  
#     else
#       :height_error  
#     end
#   end
#   chk_height.call(root) != :height_error
# end