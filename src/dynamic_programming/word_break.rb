require "byebug"

class WordBreak
  def initialize(dictionary)
    @dictionary = dictionary
  end

  def is_string_present?(str)
    length = str.size
    matrix = Array.new(length+1) {Array.new(length+1) { |i| "F" }}
    print_matrix(matrix, str)
    for comb in (1..length) do
      for _i in (1..length-1) do
        j_index = _i + comb - 1
        if check_if_parts_present?(str, matrix, _i-1, j_index-1)
          matrix[_i][j_index] = "T"
        end
      end
    end
    puts
    print_matrix(matrix, str)
    return matrix[1][length] == "T"
  end

  def check_if_parts_present?(str, matrix, i, j)
    return true if @dictionary.include?(str[i..j])
    if i == j
      return @dictionary.include?(str[i..j])
    end
    return true if (matrix[i+1+1][j+1] == "T" && matrix[i+1][j-1+1] == "T")
    for p in (0..str[i..j-1].size-1) do
      if check_if_parts_present?(str, matrix, i, i+p) && check_if_parts_present?(str, matrix, i+p+1, j)
        return true
      end
    end
    return false
  end

  def print_matrix(matrix, str)
    length = matrix.size
    for i in (0..length-1) do
      for j in (0..length-1) do
        if i == 0
          if j == 0
            print "  "
          else
            print " #{str[j-1]}"
          end
        elsif j == 0
          if i == 0
            print " "
          else
            print " #{str[i-1]}"
          end

        else
          print " #{matrix[i][j]}"
        end
      end
      puts
    end
  end
end

