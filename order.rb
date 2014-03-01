require_relative 'loader'

class Order
  attr_reader :menu

  def initialize(total, menu)
    @total = total
    @menu = menu 
    @possibility = []
    @orders = []
  end
  
  def calculate_possibilities
    n = 0
    @menu.length.times do
      menu_clone = @menu
      dish = menu_clone.shift(n)
      menu_clone << dish
      n+=1
      possibility_from(menu_clone.flatten)
    end
    @orders
  end

  def possibility_from(menu)
    if met_total?
      add_possibility
    else
      check_dish(menu)
    end
  end
  
  def add_possibility
    @orders << @possibility
    @possibility.clear
    @orders
  end
  
  def check_dish(menu)
    dish = menu.shift
    current_total = get_total
    
    if current_total + dish[:price] <= @total
      @possibility << dish
    end
    
    possibility_from(menu)
  end
  
  def get_total
    @possibility.values.inject(&:+)
  end
  
  def met_total?
    @possibility.values.inject(&:+) == @total
  end
end
