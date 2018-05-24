require 'csv'
require 'byebug'
class RestuarantProblem
  def initialize
    @restuarant_list = []
    CSV.foreach("/Users/rajesh/learning/programming/CodingAndAlgorithms/src/tests/restuarant.csv", quote_char: '"', col_sep: ',', row_sep: :auto, headers: false) do |row|
      rest =  row.first.split(",").map(&:strip)

      id = rest[0].to_i
      restuarant = @restuarant_list.detect { |rest| rest.id == id}
      if restuarant.nil?
        restuarant = Restuarant.new(id)
        @restuarant_list << restuarant
      end
      price = rest[1].to_i
      restuarant.add_menu_item(price, rest[2, rest.size-1])
    end
  end

  def return_restuarant_price(items)

  end
end



class Restuarant
  attr_accessor :id, :menu_list
  def initialize(id)
    @id = id
    @menu_list = []
  end

  def add_menu_item(price, items)
    @menu_list << MenuItem.new(price, items)
  end

  def has_items(items)

  end
end

class MenuItem
  attr_accessor :price, :items
  def initialize(price, items)
    @price = price
    @items = items
  end
end

RestuarantProblem.new

