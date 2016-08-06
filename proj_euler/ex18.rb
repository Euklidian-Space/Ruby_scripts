require "pry"

def path_sums(arr, row_num = arr.length - 1, candidates = arr.last)
  return candidates.max + arr[0][0] if row_num == 1
  next_candidates = []
  for i in (0..arr[row_num - 1].length - 1) do
    next_candidates << [arr[row_num - 1][i] + candidates[i], arr[row_num - 1][i] + candidates[i + 1]].max   
  end 
  path_sums(arr, row_num - 1, next_candidates)
end

def max_path_sum
  path_sums(IO.readlines('triangle.txt').map { |elem| elem.chomp.split(' ').map { |e| e.to_i } })
end