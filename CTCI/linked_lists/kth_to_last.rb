require './Node.rb'
require "pry"

def kth_to_last_iter(head, k)
  p1, p2 = head, head
  k.times do 
    p2 = p2.next  
  end
  until p2.nil? do 
    p1, p2 = p1.next, p2.next  
  end
  p1
end

def _kth_to_last(head, k, counter)
  return nil if head.nil?
  node = _kth_to_last(head.next, k, counter)
  return head if counter.next == k
  node 
end


def kth_to_last(head, k)
  counter = int_gen(1)
  _kth_to_last(head, k, counter)
end

def int_gen start
  Enumerator.new do |enum|
    loop do 
      enum.yield start
      start += 1
    end
  end
end




