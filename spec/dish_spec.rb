require_relative 'spec_helper'

describe 'Dish' do

  before do
    @dish = Dish.new("taco", "$12.00")
  end

  context '#initialize' do
    it 'works' do
      expect(@dish).to be_true
    end

    it 'has a @price' do
      expect(@dish.price).to be_true
    end

    it 'has an @item' do
      expect(@dish.item).to be_true
    end
  end

  context '@price' do
    it 'is a float' do
      expect(@dish.price).to be_instance_of(Float)
    end
  end

  context '#format_price' do
    before do
      @dish.format_price('$129.92')
    end

    it 'returns a float' do
      expect(@dish.price).to be_instance_of(Float)
    end

    it 'works' do
      expect(@dish.price).to be(129.92)
    end
  end
end
