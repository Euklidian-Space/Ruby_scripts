require "pry"

def zero mat 
  row_indices, col_indices = [], []
  _zero = [0] * mat[0].length 
  mat.each_with_index do |row, i|
    row.each_with_index do |elem, j|
      if mat[i][j] == 0
        row_indices << i
        col_indices << j
      end
    end
  end
  0.upto(row_indices.length - 1) { |r| mat[r] = _zero }
  col_indices.each { |c| mat.each { |r| r[c] = 0 } }
  mat
end