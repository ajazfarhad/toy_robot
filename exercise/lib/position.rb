# frozen_string_literal: true

# Handles robot coordinates and orientation
#
#
#
#      N
#      |
#      |
# W----+-----E
#      |
#      |
#      S
class Position
  attr_accessor :x_coord, :y_coord, :direction

  DIRECTIONS = %w[NORTH EAST SOUTH WEST].freeze

  def initialize(x_coord, y_coord, direction)
    @x_coord = x_coord
    @y_coord = y_coord
    @direction = direction
  end

  def next_coordt_position
    directions_map = {
      'NORTH' => [0, 1],
      'EAST' => [1, 0],
      'SOUTH' => [0, -1],
      'WEST' => [-1, 0]
    }

    dx_coord, dy_coord = directions_map[direction]
    Position.new(x_coord + dx_coord, y_coord + dy_coord, direction)
  end

  def rotate_left
    new_direction = DIRECTIONS[(DIRECTIONS.index(direction) - 1) % DIRECTIONS.size]
    Position.new(x_coord, y_coord, new_direction)
  end

  def rotate_right
    new_direction = DIRECTIONS[(DIRECTIONS.index(direction) + 1) % DIRECTIONS.size]
    Position.new(x_coord, y_coord, new_direction)
  end

  def to_s
    [x_coord, y_coord, direction].join(',')
  end
end
