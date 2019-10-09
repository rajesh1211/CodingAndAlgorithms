require 'byebug'
require_relative 'big_multiply.rb'

class BigFactorial
  attr_reader :num
  def initialize(num)
    @num = num
  end

  def result
    n = num
    fact = 1
    while n > 1 do
      fact = BigMultiply.new(fact, n).result
      n = n - 1
    end
    fact
  end
end