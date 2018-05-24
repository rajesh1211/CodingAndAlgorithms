require "byebug"

class ShortestPallindrome
  attr_accessor :arr
  def initialize(str)
    # aabaabaaa
    @str = str
    @arr = Array.new(@str.size)
    @arr[0] = 0
  end

  def kmp_partial(p , q)
    while q < @str.size do
      if @str[p] == @str[q]
        @arr[q] = p + 1
        p = p+1
        q = q+1
      else
        if p == 0
          @arr[q] = 0
          q = q + 1
        else
          p = @arr[p - 1]
        end
      end
    end
  end
end
