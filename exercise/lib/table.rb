# frozen_string_literal: true

# Validates boundaries.
class Table
  def initialize(width = 5, height = 5)
    @width = width
    @height = height
  end

  def valid_position?(position)
    position.x_coord.between?(0, @width - 1) && position.y_coord.between?(0, @height - 1)
  end
end
