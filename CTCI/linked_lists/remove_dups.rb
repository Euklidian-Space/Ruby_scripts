require "./Node.rb"
require "pry"

# def remove_dups list 
#   #byebug
#   ledger = {}
#   node = list 
#   until node.nil? do 
#     ledger[node.data] = node
#     node = node.next 
#   end
#   
#   1.upto(ledger.values.length) do |i|
#     ledger.values[i - 1].next = ledger.values[i]
#   end
#   list
# end

def remove_dups list 
	p1 = list
	until p1.nil? do 
		p2 = p1
		until p2.next.nil? { p2.next.data == p1.data ? p2.next = p2.next.next : p2 = p2.next }
		p1 = p1.next
	end
end

