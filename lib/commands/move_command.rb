# frozen_string_literal: true

# Command to move the robot one step forward in its current direction.
#
#  Invokes the #move method on the robot to update its position.
class MoveCommand < Command
  def execute(robot)
    robot.move
  end
end
