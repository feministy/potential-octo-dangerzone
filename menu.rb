require_relative 'loader'

class Menu
  attr_reader :dishes

  def initialize(opts_hash)
    @dishes = []

    opts_hash.each do |item, price|
      @dishes << Dish.new(item, price)
    end
  end
end
