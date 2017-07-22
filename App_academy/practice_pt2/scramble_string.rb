def scramble_string(string, positions)
  inner = lambda do |_positions, res|
    return res if _positions.length == 0 
    inner.call(_positions.slice(1, _positions.length - 1), res + string[_positions[0]])
  end 
  inner.call(positions, "")
end 