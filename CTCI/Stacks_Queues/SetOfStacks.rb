require './Stack.rb' 

class SetOfStacks
  attr_reader :stacks
  
  def initialize threshold
    @stacks = []
    @threshold = threshold
    @count = 0
  end
  
  def push data
    if stacks.empty?
      @stacks << MyStack.new
      @count += 1
    elsif @count == @threshold
      @stacks << MyStack.new
      @count = 0
    else
      @count += 1
    end
    stacks.last.push data
    nil
  end
  
  def pop 
    raise 'No Stacks Left' if stacks.empty?
    begin
      @count -= 1
      return stacks.last.pop
    rescue EmptyStackError
      @count += 1
      @stacks = stacks[0..-2]
      return self.pop
    end
  end
   
end

