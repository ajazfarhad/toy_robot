# frozen_string_literal: true

# Command to rotate the robot 90 degrees to the right.
#
# This class inherits from the base Command class and implements
# the #execute method to define the specific behavior for the
# "RIGHT" command.
class RightCommand < Command
  def execute(robot)
    robot.right
  end
end
