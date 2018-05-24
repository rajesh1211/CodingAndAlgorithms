require 'byebug'

class Permutation
  attr_accessor :arr
  def initialize
    @arr = Set.new
  end

  def permute(str, i, j)
    if i == j
      @arr << str
    else
      for p in (i..j)
        str = swap(str, i , p)
        permute(str, i + 1, j)
        str = swap(str, i , p)
      end
    end
  end

  def swap(str, i, j)
    temp = str[i]
    str[i] = str[j]
    str[j] = temp
    str
  end
end
