def balanced?(root)
  chk_height = lambda do |node|
    return -1 if node.nil?
    left_path = chk_height.call(node.left)
    return :height_error if left_path == :height_error
    right_path = chk_height.call(node.right) 
    return :height_error if right_path == :height_error
    height_diff = left_path - right_path
    if height_diff.abs <= 1
      [left_path, right_path].max + 1  
    else
      :height_error  
    end
  end
  chk_height.call(root) != :height_error
end