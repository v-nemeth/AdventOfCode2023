class Game
  @id = 0
  @red = 0
  @green = 0
  @blue = 0

  def initialize(id)
    red = 0
    green = 0
    blue = 0
  end

  def add_color(color, amount)
    if color == 'red'
      red += amount
    elsif color == 'green'
      green += amount
    elsif color == 'blue'
      blue += amount
    end
  end

  def is_possible?
    if @red > 12 && @green > 13 && @blue > 14
      return true
    else
      return false
    end
  end

end