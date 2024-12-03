# frozen_string_literal: true

# Command to rotate the robot 90 degrees to the left.
#
# This class inherits from the base Command class and implements
# the #execute method to define the specific behavior for the
# "LEFT" command.
class LeftCommand < Command
  def execute(robot)
    robot.left
  end
end
