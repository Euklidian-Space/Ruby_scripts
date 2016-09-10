require "./Node.rb"
require "pry"

def sum_lists(headA, headB, result = nil, carry = 0)
  return _sum_lists(headA, headB, result, carry) if headA.nil? || headB.nil?
  sum = headA.data + headB.data
  if result.nil?
    result = Node.new(sum > 10 ? sum % 10 : sum)  
    carry = sum / 10
  else
    result.append(sum + carry > 10 ? (sum + carry) % 10 : sum + carry) 
    carry = (sum + carry) / 10
  end
  sum_lists(headA.next, headB.next, result, carry)
end

def _sum_lists(headA, headB, result)
  if !headA && headB
    result.append(headB.data + carry)
    _sum_lists(headA, headB.next, result)
  elsif headA && !headB
    result.append(headA.data + carry)
    _sum_lists(headA.next, headB, result)
  else 
    result  
  end
end