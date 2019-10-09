require 'byebug'

class BigSum
  attr_reader :a, :b
  def initialize(a, b)
    @a = a
    @b = b
  end

  def result
    sum(@a, @b)
  end
  
  private

  def sum(a, b)
    a = a.to_s
    b = b.to_s
    max = [a.size, b.size].max
    str1 = a.rjust(max, "0")
    str2 = b.rjust(max, "0")
    final_sum = ""
  
    carry = 0
    (max - 1).downto(0) do |index|
      sum = str1[index].to_i + str2[index].to_i + carry
      # p sum
      if (sum > 9)
        if (index == 0)
          final_sum << sum.to_s.reverse
          carry = 0
        else  
          final_sum << (sum % 10).to_s
          carry = sum / 10
        end  
      else
        final_sum << sum.to_s
        carry = 0
      end  
    end 
    final_sum.reverse
  end
end  