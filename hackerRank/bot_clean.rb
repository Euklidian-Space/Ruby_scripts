# def next_move(posr, posc, board)
#   return "CLEAN" if board[posr,posc] == 'd'
#   if posr - 1 > 0 #top
#     return "UP" if board[posr - 1][posc] == 'd'
#   elsif posc - 1 > 0 #left
#     return "LEFT" if board[posr][posc - 1] == 'd'
#   elsif posc + 1 < board.length #right
#     return "RIGHT" if board[posr][posc + 1] == 'd'
#   elsif posr + 1 < board.length #bottom
#     return "DOWN" if board[posr + 1][posc] == 'd'
#   end
#   "RIGHT"
# end

def get_closest_dirt(posr, posc, board)
  min_dist = board.length ** 2
  coords = []
  board.each_with_index do |row, i|
    row.each_char.with_index do |elem, j|
      if elem == 'd' && get_taxi_dist( [posr, posc], [i, j] ) < min_dist
        min_dist = get_taxi_dist( [posr, posc], [i, j] )
        coords[0], coords[1] = i,j
      end
    end
  end
  coords
end

def get_taxi_dist(p, q)
  (p[0] - q[0]).abs + (p[1] - q[1]).abs
end

def next_move(posr, posc, board)
  return "CLEAN" if board[posr][posc] == 'd'
  coords = get_closest_dirt(posr, posc, board) 
  if posr < coords[0]
    "DOWN"
  elsif posr > coords[0]
    "UP"
  elsif posc < coords[1]
    "RIGHT"
  elsif posc > coords[1]
    "LEFT"
  end
end

