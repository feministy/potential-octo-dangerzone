require_relative 'spec_helper'

describe 'Restaurant' do

  context '#initialize' do
    before do
      @diner = Restaurant.new(filename)
    end

    it 'requires an argument' do
      expect { Restaurant.new }.to raise_error(ArgumentError)
    end

    it 'succeeds with one argument' do
      expect { Restaurant.initialize(filename) }.to be_true
    end

    it 'has not set @menu' do
      expect(@menu).to be_nil
    end

    it 'has no @inventory' do
      inventory = @diner.instance_variable_get(:@inventory)
      expect(inventory).to eq([])
    end

    it 'has no @minimum_price' do
      expect(@minimum_price).to be_nil
    end
  end

  context '#process_inventory' do
    before do
      process_inventory
      @result = @diner.instance_variable_get(:@inventory)
    end

    it 'returns an array' do
      expect(@result).to be_instance_of(Array)
    end

    it 'creates an array for each in the menu file' do
      expect(line_count).to eql(@result.length)
    end

    it 'splits items and prices by commas' do
      expect(first_item_line.split(',')).to eq(@result[1])
    end

    it 'does nothing to the minimum price line' do
      expect(total_line).to eq(@result[0])
    end

    it 'should only process once' do
      original = @result
      duplicate = @diner.process_inventory
      expect(original).to equal(duplicate)
    end
  end

  context '#open_for_business' do
    before do
      open_for_business
    end

    it 'sets @menu' do
      expect(@diner.menu).to be_true
    end

    it 'sets @minimum_order' do
      expect(@diner.minimum_order).to be_true
    end

    describe '@inventory' do
      before do
        @cafe = Restaurant.new(filename)
      end

      it 'exists' do
        inventory = @cafe.instance_variable_get(:@inventory)
        expect(inventory).to eq([])
      end

      it 'is set if not present' do
        @cafe.open_for_business
        inventory = @cafe.instance_variable_get(:@inventory)
        expect(inventory.length).to be >= 1
      end
    end
  end

  context '#create_menu_from_inventory' do
    before do
      open_for_business
    end

    it 'should only process once' do
      original = @menu
      @diner.create_menu_from_inventory
      duplicate = @menu
      expect(original).to equal(duplicate)
    end

    it 'should create @menu' do
      expect(@diner.menu).to be_true
    end

    it 'should create @menu as an instance of Menu' do
      expect(@diner.menu).to be_instance_of(Menu)
    end
  end

  context '#set_minimum_order' do
    before do
      open_for_business
    end

    it 'should create @minimum_order' do
      expect(@diner.minimum_order).to be_true
    end

    it 'should only process once' do
      original = @diner.minimum_order
      @diner.set_minimum_order
      duplicate = @diner.minimum_order
      expect(original).to eql(duplicate)
    end

    describe 'with currencies' do
      before do
        process_inventory
      end

      it 'works with US currency' do
        @diner.instance_variable_set(:@inventory, [['$12.29']])
        @diner.open_for_business
        expect(@diner.minimum_order).to eq(12.29)
      end

      it 'does not work with other currencies' do
        @diner.instance_variable_set(:@inventory, [['£12.29']])
        @diner.open_for_business
        expect(@diner.minimum_order).to eq(0.0)
      end
    end
  end

  context '#order_options' do
    before do
      open_for_business
      @diner.order_options
    end
  end

  context '#unprocessed?' do
    before do
      @diner = Restaurant.new(filename)
    end

    it 'works for arrays with content' do
      result = @diner.send(:unprocessed?, [1, 2])
      expect(result).to be_false
    end

    it 'works with empty arrays' do
      result = @diner.send(:unprocessed?, [])
      expect(result).to be_true
    end

    it 'works for nil objects' do
      result = @diner.send(:unprocessed?, nil)
      expect(result).to be_true
    end

    it 'raises an error for anything else' do
      expect { @diner.send(:unprocessed?, 123) }.to raise_error
    end
  end
end
