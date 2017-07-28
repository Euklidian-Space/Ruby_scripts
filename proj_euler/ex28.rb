require "matrix"

def spiral_diag_sum(size)
  m = number_spiral size
  trace = (0..size - 1).inject(0) { |sum, i| sum + m[i][i] } 
  off_trace = 0.upto(size - 1).zip((size - 1).downto(0)).inject(0) { |sum, coords| sum + m[coords[0]][coords[1]] }
  
  trace + off_trace - 1  
end

def number_spiral(_size)
  mat = blank_mat(_size)
  counter = count_down(_size**2)
  fn = lambda do |m, size, offset|
    return m if size < 1
    row, col = 0 + offset, m.length - (offset + 1)
    m[row][col] = counter.call if size == 1
    (size - 1).times do 
      m[row][col] = counter.call
      col -= 1
    end
    
    (size - 1).times do 
      m[row][col] = counter.call
      row += 1
    end
    
    (size - 1).times do 
      m[row][col] = counter.call 
      col += 1
    end
    
    (size - 1).times do 
      m[row][col] = counter.call 
      row -= 1
    end
    
    fn.call(mat, size - 2, offset + 1) 
  end
   
  fn.call(mat, mat.length, 0)
end

def count_down(start)
  result = start + 1
  lambda { result -= 1 }
end

def blank_mat(size)
  res = []
  size.times { res << Array.new(size) }
  res
end