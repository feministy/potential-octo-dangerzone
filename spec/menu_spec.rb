require_relative 'spec_helper.rb'

describe 'Menu' do
  before do
    open_for_business
    @menu = @diner.menu
  end

  context '#initialize' do
    it 'has #dishes' do
      expect(@menu.dishes).to be_true
    end

    it 'has #dishes that are Dish objects' do
      dish = @menu.dishes.first
      expect(dish).to be_instance_of(Dish)
    end
  end

  context '#number_of_items' do
    it 'works' do
      expect(@menu.number_of_items).to be(6)
    end
  end

  context '#total' do
    it 'works' do
      expect(@menu.total).to be(21.8)
    end
  end

  context '#dishes' do
    it 'sorts from highest to lowest' do
      expect(@menu.dishes[0].price).to be(5.8)
    end
  end
end

