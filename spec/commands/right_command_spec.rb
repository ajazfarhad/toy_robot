require 'spec_helper'

RSpec.describe 'RIGHT command' do
  let(:table) { Table.new }
  let(:robot) { Robot.new(table) }
  let(:command_processor) { CommandProcessor.new(robot) }

  context 'when facing NORTH' do
    before { command_processor.process('PLACE 0,0,NORTH') }

    it 'rotates the robot to the right, changing direction to EAST' do
      command_processor.process('RIGHT')
      expect(robot.report).to eq('0,0,EAST')
    end
  end

  context 'when facing EAST' do
    before { command_processor.process('PLACE 0,0,EAST') }

    it 'rotates the robot to the right, changing direction to SOUTH' do
      command_processor.process('RIGHT')
      expect(robot.report).to eq('0,0,SOUTH')
    end
  end

  context 'when facing SOUTH' do
    before { command_processor.process('PLACE 0,0,SOUTH') }

    it 'rotates the robot to the right, changing direction to WEST' do
      command_processor.process('RIGHT')
      expect(robot.report).to eq('0,0,WEST')
    end
  end

  context 'when facing WEST' do
    before { command_processor.process('PLACE 0,0,WEST') }

    it 'rotates the robot to the right, changing direction to NORTH' do
      command_processor.process('RIGHT')
      expect(robot.report).to eq('0,0,NORTH')
    end
  end
end
