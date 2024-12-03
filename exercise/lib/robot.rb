# frozen_string_literal: true

# Manages state and delegates movement/rotation logic.
class Robot
  attr_reader :position

  def initialize(table)
    @table = table
    @position = nil
  end

  def place(position)
    @position = position if @table.valid_position?(position)
  end

  def move
    with_placed_check do
      new_position = @position.next_coordt_position
      @position = new_position if @table.valid_position?(new_position)
    end
  end

  def left
    with_placed_check do
      @position = @position.rotate_left
    end
  end

  def right
    with_placed_check do
      @position = @position.rotate_right
    end
  end

  def report
    with_placed_check { @position.to_s }
  end

  private

  def placed?
    !@position.nil?
  end

  def with_placed_check
    return 'Robot not placed yet!' unless placed?

    yield
  end
end
