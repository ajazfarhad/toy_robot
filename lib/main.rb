# frozen_string_literal: true

require_relative 'table'
require_relative 'position'
require_relative 'robot'
require_relative 'command_processor'

class ToyRobotSimulator
  def initialize
    @table = Table.new(5, 5)
    @robot = Robot.new(@table)
    @command_processor = CommandProcessor.new(@robot)
  end

  def run
    if ARGV[0]
      process_file(ARGV[0])
    else
      process_interactive
    end
  end

  private

  def process_file(file_path)
    File.foreach(file_path) { |line| @command_processor.process(line) }
  rescue StandardError => e
    puts "An unexpected error occurred while reading the file: #{e.message}"
  end

  def process_interactive
    puts "Enter commands (type 'EXIT' to quit):"
    loop do
      print '> '
      line = gets.strip
      break if line == 'EXIT'

      @command_processor.process(line)
    end
  end
end

simulator = ToyRobotSimulator.new
simulator.run
