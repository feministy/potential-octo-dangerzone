require_relative 'loader'

class Order
  def initialize(total, menu)
    @total = total
    @menu = menu
  end

  def possibilities
    prices = @menu.prices
    prices
  end
end
