require_relative 'loader'

class Menu
  attr_reader :items

  def initialize(opts_hash)
    @items = []

    opts_hash.each do |item, price|
      @items << MenuItem.new(item, price)
    end
  end
end
