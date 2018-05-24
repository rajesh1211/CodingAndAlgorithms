def rat_in_maze(matrix, row, col)
    positions = get_next_positions(matrix, row, col)

    for position in (0..positions.size - 1)
        row = positions[position][:row]
        col = positions[position][:col]

        if row == matrix.size - 1 && col == matrix.size - 1
            matrix[row][col] = 5
            return true
        else
            matrix[row][col] = 5
            if rat_in_maze(matrix, row, col)
                return true
            end
        end
    end

    return false
end

def get_next_positions(matrix, i, j)
    positions = []
    if j < matrix.size-1 && matrix[i][j+1] != 0 && matrix[i][j+1] != 5
        positions << {row: i, col: j+1}
    end

    if i < matrix.size-1 && matrix[i+1][j] != 0 && matrix[i+1][j] != 5
        positions << {row: i+1, col: j}
    end

    if i >= 1 && matrix[i-1][j] != 0 && matrix[i-1][j] != 5
        positions << {row: i-1, col: j}
    end

    if j >= 1 && matrix[i][j-1] != 0 && matrix[i][j-1] != 5
        positions << {row: i, col: j-1}
    end

    positions
end


in_martix = [
"1 0 1 1 0 1 0 0 1 0",
"1 1 1 1 0 1 0 0 1 0",
"1 0 1 1 1 1 1 0 1 1",
"1 0 0 0 0 1 1 1 0 0",
"0 0 0 1 1 0 1 1 1 0",
"0 0 0 1 1 1 1 0 0 1",
"0 0 1 0 0 0 1 1 0 1",
"1 0 1 0 1 0 1 0 0 0",
"1 0 1 0 1 1 1 1 1 0",
"1 1 1 0 0 1 1 0 1 1"
]

matrix_size = 10
matrix = Array.new(matrix_size)
for i in (0..matrix_size-1)
    matrix[i] = in_martix[i].split(" ").map(&:to_i)
end

for i in (0..matrix_size-1)
    print matrix[i]
    puts
end

if rat_in_maze(matrix, 0, 0)
  puts  "POSSIBLE"
else
  puts  "NOT POSSIBLE"
end

for i in (0..matrix_size-1)
    print matrix[i]
    puts
end
