require_relative 'loader'

class MenuItem
  attr_reader :item, :price

  def initialize(item, price)
    @item = item
    @price = price
  end
end
