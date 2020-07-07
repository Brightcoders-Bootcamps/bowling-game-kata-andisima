# frozen_string_literal: true

# This class is to save the score of each turn
class Frame
  attr_reader :turn
  def initialize
    @turn = []
  end

  def strike?
    turn.length == 1 && spare?
  end

  def spare?
    score == 10
  end

  def score
    turn.reduce(&:+)
    # This method gives you the total of the Array
  end

  def done?
    turn.length == 2 || strike? || spare?
  end
end
