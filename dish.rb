require_relative 'loader'

class Dish
  attr_reader :item, :price

  def initialize(item, price)
    @item = item
    @price = price
  end
end
