require_relative 'loader'

class Menu
  def initialize(opts_hash)
    @dishes = []

    opts_hash.each do |item, price|
      @dishes << Dish.new(item, price)
    end
  end

  def dishes
    @dishes.sort_by(&:price).reverse
  end

  def number_of_items
    @dishes.length
  end

  def total
    @dishes.map(&:price).reduce(&:+)
  end
end
