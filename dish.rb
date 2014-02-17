require_relative 'loader'

class Dish
  attr_reader :item, :price

  def initialize(item, price)
    @item = item
    @price = format_price(price)
  end

  def format_price(price)
    @price =  price.gsub!('$', '').to_f
  end
end
