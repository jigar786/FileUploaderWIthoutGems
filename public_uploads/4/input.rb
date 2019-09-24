require_relative "plateau"
require_relative "rover"
require_relative "commander"

class Input
  attr_accessor :plateau, :grid_coords, :rover, :init_pos, :input_dir

  def take_coords
    @grid_coords = gets.chomp.split(" ")
  end

  def create_plateau_instance
    @plateau = Plateau.new
  end

  def create_rect_plat
    @plateau.rectangular_grid(@grid_coords[0], @grid_coords[1])
  end

  def take_initial_pos
    @init_pos = gets.chomp.split(" ")
  end

  def create_rover
    @rover = Rover.new(@init_pos[0], @init_pos[1], @init_pos[2])
  end

  def directions
    @input_dir = gets.chomp.split("")
  end

  def create_commander
    @commander = Commander.new(@input_dir, @rover, @plateau)
  end

  def print_res
    if @commander.msg
      puts @commander.coords
    end
  end

  def run
    take_coords
    create_plateau_instance
    create_rect_plat
    take_initial_pos
    create_rover
    directions
    create_commander
    print_res
  end
end

input = Input.new
input.run
