# frozen_string_literal: true

# Command to report the robot's current position and direction.
#
class ReportCommand < Command
  def execute(robot)
    puts robot.report
  end
end
