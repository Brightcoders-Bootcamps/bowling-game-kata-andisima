# frozen_string_literal: true

# Esta clase es para guardar los puntos de cada tiro
class Frame < Array

  def strike?
    length == 1 && spare?
  end

  def spare?
    score == 10
  end

  def score
    reduce(&:+)
    # este metodo te suma el contenido del array
  end

  def done?
    length == 2 || strike? || spare?
  end
end
