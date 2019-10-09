require 'byebug'
require_relative 'big_sum.rb'

class BigMultiply
  attr_reader :a, :b
  def initialize(a, b)
    @a = a
    @b = b
  end

  def result
    multiply(@a, @b)
  end

  private

  def multiply(a, b)
    a_str = a.to_s.split('')
    b_str = b.to_s.split('')
    strings_arr = []
    b_str.reverse.each_with_index do |b_num, b_index|
      strings_arr[b_index] = ""
      carry = 0
      a_str.reverse.each_with_index do |a_num, a_index|
        mul = (b_num.to_i * a_num.to_i) + carry
        if (mul > 9)
          if (a_index == a_str.size - 1)
            strings_arr[b_index] << mul.to_s.reverse
            carry = 0
          else
            strings_arr[b_index] << (mul % 10).to_s
            carry = mul / 10
          end
        else
          strings_arr[b_index] << mul.to_s
          carry = 0
        end
      end 
  
      strings_arr[b_index] = strings_arr[b_index].reverse << ("0" * b_index)
    end
    t_sum = strings_arr[0]
    (1..strings_arr.size-1).each do |index|
      t_sum = BigSum.new(t_sum,strings_arr[index]).result
    end
    t_sum
  end
end  
