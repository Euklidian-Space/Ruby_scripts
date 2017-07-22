require_relative "Node.rb"

def minimal_tree(arr)
  return nil if arr.empty?
  return Node.new(arr[0]) if arr.length <= 1
  mid = arr.length / 2
  Node.new(arr[mid], [minimal_tree(arr[0..mid - 1]), minimal_tree(arr[mid + 1..arr.length])])
end