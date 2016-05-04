require 'minitest/autorun'
require 'Sudoku.rb'
require "pry"

class SudokuTests < MiniTest::Test
  def test_row_yielder
    valid_sudoku = Sudoku.new([
      [7,8,4, 1,5,9, 3,2,6],
      [5,3,9, 6,7,2, 8,4,1],
      [6,1,2, 4,3,8, 7,5,9],
    
      [9,2,8, 7,1,5, 4,6,3],
      [3,5,7, 8,4,6, 1,9,2],
      [4,6,1, 9,2,3, 5,8,7],
      
      [8,7,6, 3,9,4, 2,1,5],
      [2,4,3, 5,6,1, 9,7,8],
      [1,9,5, 2,8,7, 6,3,4]
    ])  
    gen = valid_sudoku.send(:row_yielder, valid_sudoku.board, valid_sudoku.sub_size)
    assert(gen.next == valid_sudoku.board.first(valid_sudoku.sub_size))
    2.times { gen.next }
    assert(gen.peek.empty?, 'Last iteration of row_yielder should be an empty array') 
  end
 
  def test_valid_sudoku
    valid_sudoku = Sudoku.new([
      [7,8,4, 1,5,9, 3,2,6],
      [5,3,9, 6,7,2, 8,4,1],
      [6,1,2, 4,3,8, 7,5,9],
    
      [9,2,8, 7,1,5, 4,6,3],
      [3,5,7, 8,4,6, 1,9,2],
      [4,6,1, 9,2,3, 5,8,7],
      
      [8,7,6, 3,9,4, 2,1,5],
      [2,4,3, 5,6,1, 9,7,8],
      [1,9,5, 2,8,7, 6,3,4]
    ])  
    assert(valid_sudoku.is_valid)
  end
  
  def test_non_standard_valid_sudoku
    goodSudoku2 = Sudoku.new([
      [1,4, 2,3],
      [3,2, 4,1],
    
      [4,1, 3,2],
      [2,3, 1,4]
    ])  
    assert(goodSudoku2.is_valid)
  end
  
  def test_invalid_sudoku
    badSudoku1 = Sudoku.new([
      [0,2,3, 4,5,6, 7,8,9],
      [1,2,3, 4,5,6, 7,8,9],
      [1,2,3, 4,5,6, 7,8,9],
      
      [1,2,3, 4,5,6, 7,8,9],
      [1,2,3, 4,5,6, 7,8,9],
      [1,2,3, 4,5,6, 7,8,9],
      
      [1,2,3, 4,5,6, 7,8,9],
      [1,2,3, 4,5,6, 7,8,9],
      [1,2,3, 4,5,6, 7,8,9]
    ]) 
    refute(badSudoku1.is_valid)
  end
  
  def test_invalid_non_standard_sudoku
    badSudoku2 = Sudoku.new([
      [1,2,3,4,5],
      [1,2,3,4],
      [1,2,3,4],  
      [1]
    ]) 
    refute(badSudoku2.is_valid)
  end
  
end