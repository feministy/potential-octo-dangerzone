require_relative 'spec_helper.rb'

describe 'Menu' do
  context '#initialize' do
    before do
      open_for_business
      @menu = @diner.menu
    end

    it 'has #dishes' do
      expect(@menu.dishes).to be_true
    end

    it 'has #dishes that are Dish objects' do
      dish = @menu.dishes.first
      expect(dish).to be_instance_of(Dish)
    end
  end
end

