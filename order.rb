require_relative 'loader'

class Order
  attr_reader :menu

  def initialize(total, menu)
    @total = total
    @menu = menu
    @dishes = @menu.dishes
    @possibility = []
    @orders = []
  end

  def calculate_possibilities
    n = 0
    @dishes.length.times do
      dishes_clone = @dishes
      dish = dishes_clone.shift(n)
      dishes_clone << dish
      n+=1
      possibility_from(dishes_clone.flatten)
    end
    @orders
  end

  def possibility_from(dishes)
    if met_total?
      add_possibility
    else
      check_dish(dishes)
    end
  end

  def add_possibility
    @orders << @possibility
    @possibility.clear
    @orders
  end

  def check_dish(dishes)
    dish = dishes.shift
    current_total = get_total

    if current_total + dish.price <= @total
      @possibility << dish
    end

    unless dishes.empty?
      possibility_from(dishes)
    end
  end

  def get_total
    if @possibility.empty?
      return 0
    else
      prices = []
      @possibility.each do |dish|
        prices << dish.price
      end
      prices.inject(&:+)
    end
  end

  def met_total?
    get_total == @total
  end
end
