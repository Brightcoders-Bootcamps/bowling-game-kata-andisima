# frozen_string_literal: true
load 'frame.rb'
# This class will define the Game rules
class Bowling
  def initialize
    @total_pins = 0
    @frames = []
    @current_frame = Frame.new
  end

  def roll(pins_down)
    @current_frame.turn << pins_down

    (unless (@current_frame.done? && frames_length <= 9) || (frames_length == 10 &&
      (frames_last.spare? || frames_last.strike?))
       return end)
    @frames << @current_frame
    @current_frame = Frame.new
  end

  def score
    @total_pins = frame_points
    puts @total_pins
  end

  def frame_points
    @frames.each.with_index do |actual_frame, index|
      @total_pins += actual_frame.score
      frame_bonus(actual_frame, index)
      puts @total_pins
    end
    @total_pins
  end

  def strike_frame(index)
    next_position = frames_next_position(index + 1)
    @total_pins += if next_position.strike?
                     @frames[index + 2].turn.first
                   else
                     next_position.turn.last
                   end

    @total_pins += next_position.turn.first
  end

  def last_frame?
    @frames.count >= 10
  end

  private

  def frames_length
    @frames.length
  end

  def frame_bonus(actual_frame, index)
    if actual_frame.strike?
      strike_frame(index)
    elsif actual_frame.spare? && index != 9
      @total_pins += @frames[index + 1].first
    end
  end

  def frames_last
    @frames.last
  end

  def frames_next_position(next_position)
    @frames[next_position]
  end
end

bowling = Bowling.new
rolls = [8, 1, 10, 10, 10, 1, 6, 4, 5, 5, 10, 0, 0, 0, 0, 0, 10]
rolls.each { |pins_down| bowling.roll(pins_down) }
puts bowling.score
