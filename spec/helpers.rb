module Helpers
  def filename
    File.expand_path('./lib/menu.txt')
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
end
