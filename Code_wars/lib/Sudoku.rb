require "pry"
class Sudoku
  attr_reader :board, :size, :sub_size
  
  def initialize(mat)
    @board = mat
    @size = board.count
    @sub_size = Math.sqrt(size)
  end
  
  def is_valid
    return false if board.any?{ |elem| elem.length < size }
    (columns_valid? board) && (rows_valid? board) && (valid_sub_squares?)
  end
  
  private
  
    def sum_first_n #thanks Gauss!
      size * (size + 1) / 2
    end
    
    def rows_valid?(mat)
      return true if mat.empty?
      mat.first.reduce(:+) == sum_first_n ? 
        rows_valid?(tail mat) : (return false)
    end
    
    def columns_valid?(mat)
      return true if mat.first.empty?
      mat.map{ |e| e.first }.reduce(:+) == sum_first_n ? 
        columns_valid?(mat.map{ |e| tail e }) : (return false)
    end
    
    def sub_square_valid?(arr)
      return true if arr.first.empty?
      return false if arr.map{ |e| e.first sub_size }.flatten.reduce(:+) != sum_first_n
      sub_square_valid?(arr.map{ |e| tail(e,sub_size)})
    end
    
    def valid_sub_squares?(gen = nil)
      gen ||= row_yielder(board, sub_size)  
      return true if gen.peek.empty?
      sub_square_valid?(gen.next) ? valid_sub_squares?(gen) : (return false)
    end
     
    def tail(arr, count = 1)
      arr - arr.first(count)
    end
    
    def row_yielder(mat, count)
      arr = mat
      Enumerator.new do |enum|
        while arr.length >= 0
          enum.yield arr.first(count)
          arr = tail(arr, count)
        end
      end
    end

end