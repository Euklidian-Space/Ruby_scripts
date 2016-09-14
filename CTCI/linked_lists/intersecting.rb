require "./Node.rb"

class Node 
  def == other 
    self.object_id == other.object_id 
  end
end

def intersecting?(listA, listB)
  return false if listA.nil? || listB.nil?
  return true if listA == listB
  intersecting?(listA.next, listB.next)
end