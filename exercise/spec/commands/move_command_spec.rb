require 'spec_helper'

RSpec.describe 'MOVE command' do
  let(:table) { Table.new }
  let(:robot) { Robot.new(table) }
  let(:command_processor) { CommandProcessor.new(robot) }

  context 'when valid commands' do
    before { command_processor.process('PLACE 0,0,NORTH') }

    it 'moves the robot within bounds' do
      command_processor.process('MOVE')
      expect(robot.report).to eq('0,1,NORTH')
    end
  end

  context 'when invalid commands' do
    it 'ignores movement that leads off the table' do
      command_processor.process('PLACE 0,0,NORTH')

      6.times { command_processor.process('MOVE') }
      expect(robot.report).to eq('0,4,NORTH')
    end

    it 'ignores invalid commands before PLACE' do
      command_processor.process('MOVE')
      expect(robot.report).to eq('Robot not placed yet!')
    end

    it 'ignores unknown commands' do
      command_processor.process('PLACE 0,0,NORTH')
      command_processor.process('JUMP')
      expect(robot.report).to eq('0,0,NORTH')
    end
  end
end
