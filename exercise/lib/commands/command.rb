# frozen_string_literal: true

# Base class for all commands in the Toy Robot Simulator.
#
# This class follows the Command Pattern, where each command
# encapsulates a request or an action to be performed by the robot.
#
# Responsibilities:
# - Serves as a parent class for all specific command types
#   (e.g., PlaceCommand, MoveCommand, etc.).
# - Enforces a standard interface for executing commands.
#
# Methods:
# - #execute(robot): Abstract method that must be implemented
#   in subclasses to define specific behavior for each command.
#   Raises a NotImplementedError if not overridden.
#
class Command
  # Executes the command on the given robot.
  # @param robot [Robot] The robot instance on which the command operates.
  # @raise [NotImplementedError] If the method is not implemented in a subclass.
  def execute(robot)
    raise NotImplementedError, "#{self.class} has not implemented method '#{__method__}'"
  end
end
