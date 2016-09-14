require "./Node.rb"

def palindrome? list 
  data, node = [], list  
  until node.nil? do 
    data << node.data
    node = node.next
  end
  data == data.reverse
end