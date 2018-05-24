require "byebug"

class Fibonacci
  def initialize(num)
    @num = num
  end

  def iterative
    arr = Array.new(@num+1)
    arr[0] = 0
    arr[1] = 1
    for i in(2..@num)
      arr[i] = arr[i-1] + arr[i-2]
    end
    arr[@num]
  end

  def recursive(num)
    return num if num <= 1
    return recursive(num-1) + recursive(num-2)
  end
end
