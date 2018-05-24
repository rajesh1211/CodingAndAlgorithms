def sudoku_solve grid
  block = find_unassigned_block(grid)
  if ! block[:row].nil? && ! block[:column].nil?
    row = block[:row]
    column = block[:column]
    for number in (1..9)
    #for number in (1..4)
      if safe_to_put?(grid, number, row, column)
        #puts "row: #{row}, column: #{column}, number: #{number}"
        grid[row][column] = number
        if sudoku_solve(grid)
          return true
        else
          grid[row][column] = 0
        end
      end
    end
    return false
  else
    return true
  end
end

def find_unassigned_block(grid)
  row = nil
  column = nil
  for i in (0..(grid.size-1))
    for j in (0..(grid[i].size-1))
      if grid[i][j] == 0
        row = i
        column = j
        return {row: row, column: column}
      end
    end
  end
  return {row: row, column: column}
end

def safe_to_put?(grid, number, row, column)
  a = number_present_in_row?(grid, row, number)
  b = number_present_in_column?(grid, column, number)
  c = number_present_in_sub_grid?(grid, row, column, number)
  #puts "row: #{row}, column: #{column}, number: #{number},    #{a} #{b} #{c}"
  return !a && !b && !c
end

def number_present_in_row?(grid, row, number)
  grid[row].include? number
end

def number_present_in_column?(grid, column, number)
  present = false
  i = 0
  while i < grid.size do
    if grid[i][column] == number
      present = true
      break
    end
    i += 1
  end
  return present
end

def number_present_in_sub_grid?(grid, row, column, number)
  i = row <= 2 ? 0 : (row <= 5 ) ? 3 : 6
  j = column <= 2 ? 0 : (column <= 5 ) ? 3 : 6
  #i = row <= 1 ? 0 : 2
  #j = column <= 1 ? 0 : 2

  for p in (i..(i+2))
    for q in (j..(j+2))
  #for p in (i..(i+1))
  #  for q in (j..(j+1))
      if grid[p][q] == number
        return true
      end
    end
  end
  return false
end

def print_board grid
  for row in (0..grid.size-1)
    for column in (0..grid.size-1)
      print "#{grid[row][column]} "
    end
    puts
  end
end

a = ["1 0 0 0 0 0 0 0 0",
"0 0 2 0 0 0 0 1 0",
"0 0 0 0 0 0 0 0 2",
"0 0 1 0 0 0 0 0 0",
"0 0 0 0 0 0 1 0 0",
"0 0 0 0 7 0 6 0 0",
"0 0 9 0 0 2 0 0 0",
"0 0 8 0 0 0 7 0 0",
"2 0 0 6 0 0 0 4 0"]

board = []
(0...9).each do |i|
    print a[i].split(" ").map {|num| num.to_i}
    puts
end
puts Time.now
(0...9).each do |i|
    board << a[i].split(" ").map {|num| num.to_i}
end
sudoku_solve board
print_board board
puts Time.now

