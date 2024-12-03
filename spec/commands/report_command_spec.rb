require 'spec_helper'

RSpec.describe 'REPORT command' do
  let(:table) { Table.new }
  let(:robot) { Robot.new(table) }
  let(:command_processor) { CommandProcessor.new(robot) }

  it 'reports the current position and direction' do
    command_processor.process('PLACE 1,2,EAST')
    command_processor.process('MOVE')
    command_processor.process('MOVE')
    command_processor.process('LEFT')
    command_processor.process('MOVE')
    expect(robot.report).to eq('3,3,NORTH')
  end
end
