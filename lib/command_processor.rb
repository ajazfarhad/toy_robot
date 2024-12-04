# frozen_string_literal: true

#
# require all commands
Dir[File.join(__dir__, 'commands', '*.rb')].sort.each { |file| require_relative file }
#
# Acting as an invoker object
# Parses input strings into commands.
class CommandProcessor
  def initialize(robot)
    @robot = robot
  end

  def process(command_str)
    command = parse_command(command_str)
    command&.execute(@robot)
  end

  private

  def parse_command(command_str)
    command_str.strip!

    return parse_place_command(command_str) if command_str.start_with?('PLACE')

    parse_simple_command(command_str)
  end

  def parse_place_command(command_str)
    match = command_str.match(/^PLACE (\d+),(\d+),(NORTH|SOUTH|EAST|WEST)$/)
    return unless match

    x, y, direction = match.captures
    PlaceCommand.new(x.to_i, y.to_i, direction)
  end

  def parse_simple_command(command_str)
    case command_str
    when 'MOVE'  then MoveCommand.new
    when 'LEFT'  then LeftCommand.new
    when 'RIGHT' then RightCommand.new
    when 'REPORT'then ReportCommand.new
    end
  end
end
