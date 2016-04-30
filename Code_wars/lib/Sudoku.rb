class Sudoku
  attr_reader :board, :size
  
  def initialize(mat)
    @board = mat
    @size = board.count
  end
  
  def is_valid
    return false if board.any?{ |elem| elem.length < size }
    (column_validator board) && (row_validator board) && (sub_square_validator(board, Math.sqrt(size)))
  end
  
  private
  
    def sum_first_n #thanks Gauss!
      size * (size + 1) / 2
    end
    
    def row_validator(mat)
      return true if mat.empty?
      mat.first.reduce(:+) == sum_first_n ? 
        row_validator(tail mat) : (return false)
    end
    
    def column_validator(mat)
      return true if mat.first.empty?
      mat.map{ |e| e.first }.reduce(:+) == sum_first_n ? 
        column_validator(mat.map{ |e| tail e }) : (return false)
    end
    
    def sub_square_validator(mat, col_count)
      return true if mat.first.empty?
      mat.map{ |e| e.first col_count } == sum_first_n * col_count ?
        sub_square_validator(mat.map{ |e| tail(e, col_count)}, col_count) : (return false)
    end
    
    def tail(arr, count )
      arr - arr.first(count)
    end
  
end