class ListNode
  attr_accessor :val, :next
  def initialize(val)
    @val = val
    @next = nil
  end
end

def add_two_numbers(l1, l2, carry = 0)
  return nil if l2.nil? && l1.nil? && carry == 0
  return l1 if l2.nil? && carry == 0
  return l2 if l1.nil? && carry == 0
  digit = (l1.nil? ? 0 : l1.val) + (l2.nil? ? 0 : l2.val) + carry
  if digit > 9
    puts carry
    head = ListNode.new(digit % 10)
    head.next = add_two_numbers(l1.next, l2.next, carry + 1)
  else
    head = ListNode.new digit 
    head.next = add_two_numbers(l1.next, l2.next, 0)
  end
  head
end
    
def length_of_lst(node)
  return nil if node.nil?
  inner = lambda do |n, count|
    return count if n.next.nil?
    inner.call(n.next, count + 1)
  end 
  inner.call(node, 1)
end


