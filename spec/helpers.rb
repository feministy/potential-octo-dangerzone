module Helpers
  def filename
    File.expand_path('./spec/menu.txt')
  end

  def line_count
    File.new(filename).readlines.size
  end

  def lines
    IO.readlines(filename).map(&:strip)
  end

  def total_line
    [lines.first]
  end

  def first_item_line
    lines[1]
  end

  def process_inventory
    @diner = Restaurant.new(filename)
    @diner.process_inventory
    @diner
  end

  def open_for_business
    process_inventory
    @diner.open_for_business
    @diner
  end
end
