require "pry"

class Array

  def contains_all? other
    return true if other.empty?
    return false unless self.include? other.first
    contains_all? other.tail 
  end
  
  def tail 
    self.last(length - 1)
  end
  
  
end