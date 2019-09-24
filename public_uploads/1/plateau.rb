class Plateau
  attr_accessor :width, :height

  def initialize
  end

  def rectangular_grid(r_x, r_y)
    @width = r_x.to_i
    @height = r_y.to_i
  end

  def error_check(pos_x, pos_y)
    if pos_x < 0 || pos_y < 0 || pos_x > @width || pos_y > @height
      false
    else
      [pos_x, pos_y]
    end
  end
end
