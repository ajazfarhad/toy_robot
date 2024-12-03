require 'spec_helper'

RSpec.describe 'PLACE command' do
  let(:table) { Table.new }
  let(:robot) { Robot.new(table) }
  let(:command_processor) { CommandProcessor.new(robot) }

  context 'when valid position' do
    it 'places the robot on a valid position' do
      command_processor.process('PLACE 0,0,WEST')
      expect(robot.report).to eq('0,0,WEST')
    end
  end

  context 'when invalid position' do
    it 'ignores placement outside the table' do
      command_processor.process('PLACE 6,6,NORTH')
      expect(robot.report).to eq('Robot not placed yet!')
    end
  end
end
