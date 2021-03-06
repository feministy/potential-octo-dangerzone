require_relative 'loader'

class Restaurant

  attr_reader :menu, :minimum_order

  def initialize (menu_file)
    @menu_file = menu_file
    @inventory = []
  end

  def process_inventory
    if unprocessed?(@inventory)
      IO.readlines(@menu_file).map do |line|
        @inventory << line.strip.split(',')
      end
    end
    @inventory
  end

  def open_for_business
    if unprocessed?(@inventory)
      process_inventory
    end
    create_menu_from_inventory
    set_minimum_order
  end

  def create_menu_from_inventory
    if !@menu
      menu = @inventory.select { |i| i.length == 2 }
      @menu = Menu.new(menu)
    end
    @menu
  end

  def set_minimum_order
    if !@minimum_order
      @minimum_order = @inventory.select { |i| i.length == 1 }.flatten.first
      @minimum_order = @minimum_order.gsub!('$', '').to_f
    end
    @minimum_order
  end

  def order_options
    order = Order.new(@minimum_order, @menu)
    order.possibilities
  end

  protected
  def unprocessed?(object)
    object.nil? || object.empty?
  end

end
