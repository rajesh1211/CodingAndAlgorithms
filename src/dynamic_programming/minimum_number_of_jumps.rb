require 'byebug'
# https://www.youtube.com/watch?v=cETfFsSTGJI
class MinimumNumberOfJumps
  def initialize
    # array = [2, 3, 1, 1, 2, 4, 2, 0, 1, 1]
    array = [1, 3, 5, 8, 9, 2, 6, 7, 6, 8, 9]
    solve(array)
  end

  def solve(array)
    min_jump_arr = Array.new(array.length)

    i = 1
    j = 0
    min_jump_arr[0] = 0
    while i < array.length do
      j = 0
      while j < i do
        if j + array[j] >= i && (min_jump_arr[i].nil? || min_jump_arr[i] >= min_jump_arr[j] + 1)
          min_jump_arr[i] = min_jump_arr[j] + 1
        end
        j = j+1
      end
      i = i + 1
    end
    puts min_jump_arr[array.length-1]
  end
end

MinimumNumberOfJumps.new
