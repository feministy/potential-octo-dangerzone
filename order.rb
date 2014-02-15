require_relative 'loader'

class Order
  def initialize(total, menu)
    @total = total
    @menu = menu
  end

  def possibilities
    # does something fancy to display all orders
  end
end
