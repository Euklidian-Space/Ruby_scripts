class ListNode
  attr_accessor :val, :next
  def initialize(val)
    @val = val
    @next = nil
  end
end

def get_nth_to_last node, n 
  p1 = node 
  p2 = node 
  while n > 1
    return nil if p2.nil?
    p2 = p2.next 
    n -= 1
  end
  return nil if p2.nil?
  while p2.next 
    p1 = p1.next 
    p2 = p2.next
  end
  p1
end

def remove_nth_from_end(head, n)
  p1 = get_nth_to_last(head, n + 1)
  p1.next = p1.next.next unless p1.nil?
  head
end