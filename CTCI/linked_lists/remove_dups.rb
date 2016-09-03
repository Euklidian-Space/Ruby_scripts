require "./Node.rb"
require "pry"
def remove_dups list 
  #byebug
  ledger = {}
  node = list 
  until node.nil? do 
    ledger[node.data] = node
    node = node.next 
  end
  
  1.upto(ledger.values.length) do |i|
    ledger.values[i - 1].next = ledger.values[i]
  end
  list
end