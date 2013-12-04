require_relative 'cell'

class Grid

  attr_reader :grid

  def initialize(puzzle)
    @grid = puzzle.chars.map {|x| Cell.new(x.to_i)}.each_slice(9).to_a
  end







end 