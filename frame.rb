# frozen_string_literal: true

# Esta clase es para guardar los puntos de cada tiro
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
    # este metodo te suma el contenido del array
  end

  def done?
    turn.length == 2 || strike? || spare?
  end
end
