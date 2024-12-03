# frozen_string_literal: true

# Command to place the robot at a specific position and direction on the table.
#
# Initializes a new position with the provided coordinates and direction.
class PlaceCommand < Command
  def initialize(x_coord, y_coord, direction)
    @x_coord = x_coord
    @y_coord = y_coord
    @position = Position.new(x_coord, y_coord, direction)
  end

  def execute(robot)
    robot.place(@position)
  end
end
