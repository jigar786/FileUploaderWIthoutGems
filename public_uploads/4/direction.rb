

class Direction
  attr_accessor :position

  Left_dir = {
    N: "W",
    S: "E",
    E: "N",
    W: "S",
  }.freeze

  Right_dir = {
    N: "E",
    S: "W",
    E: "S",
    W: "N",
  }.freeze

  dir_array = [%w[W E], %w[E W], %w[N S], %w[S N]]

  # Error_checking = {
  #   N: @@plat_inst.error_check(@@rv_inst.init_x, @@rv_inst.init_y + 1),
  #   S: @@plat_inst.error_check(@@rv_inst.init_x, @@rv_inst.init_y - 1),
  #   E: @@plat_inst.error_check(@@rv_inst.init_x + 1, @@rv_inst.init_y),
  #   W: @@plat_inst.error_check(@@rv_inst.init_x - 1, @@rv_inst.init_y),
  # }.freeze

  def initialize(rv_inst, plat_inst)
    @@rv_inst = rv_inst
    @@plat_inst = plat_inst
    @position = rv_inst.dir_face
  end

  def error_check(pos)
    case pos
    when "N"
      @@plat_inst.error_check(@@rv_inst.init_x, @@rv_inst.init_y + 1)
    when "S"
      @@plat_inst.error_check(@@rv_inst.init_x, @@rv_inst.init_y - 1)
    when "W"
      @@plat_inst.error_check(@@rv_inst.init_x + 1, @@rv_inst.init_y)
    else
      @@plat_inst.error_check(@@rv_inst.init_x - 1, @@rv_inst.init_y)
    end
  end

  def turn(dir)
    case dir
    when "L"
      @@rv_inst.dir_face = Left_dir[@@rv_inst.dir_face.to_sym]
    when "R"
      @@rv_inst.dir_face = Right_dir[@@rv_inst.dir_face.to_sym]
    else
      if error_check(@@rv_inst.dir_face)
        @@rv_inst.move(error_check(@@rv_inst.dir_face))
      else
        false
      end
    end
  end
end
