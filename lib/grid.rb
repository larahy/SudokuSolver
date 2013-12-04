require_relative 'cell'

class Grid

  attr_reader :grid

  def initialize(puzzle)
    @grid = puzzle.chars.map {|x| Cell.new(x.to_i)}.each_slice(9).to_a
  end

  def row_neighbours_to(row_index, column_index) 
    grid[row_index].map {|cell| cell.value}
  end

  def column_neighbours_to(row_index, column_index)
    grid.transpose[column_index].map {|cell| cell.value}
  end

  def box_neighbours_to(row_index, column_index)
    if row_index <=2 && column_index <=2
      box1
    elsif row_index <=2 && 3<= column_index <=5
      box2
    elsif row_index <=2 && column_index >=6
      box3
    elsif 3<= row_index <=5 && column_index <=2
      box4
    elsif 3<= row_index <=5 && 3<= column_index <=5
      box5
    elsif 3<= row_index <=5 && column_index >=6
      box6
    elsif row_index >=6 && column_index <=2
      box7
    elsif row_index >=6 && 3<= column_index <=5
      box8
    elsif row_index >=6 && column_index >=6
      box9
    end
  end


  def box1
    boxes = grid.flatten.map {|cell| cell.value}.each_slice(3).to_a
    box1 = boxes[0]+boxes[3]+boxes[6]
    box1
  end

  # def boxes_on_grid
  #   boxes = grid.flatten.map {|x| x}.each_slice(3).to_a
  #   box1 = boxes[0]+boxes[3]+boxes[6]
  #   box2 = boxes[1]+boxes[4]+boxes[7]
  #   box3 = boxes[2]+boxes[5]+boxes[8]
  #   box4 = boxes[9]+boxes[12]+boxes[15]
  #   box5 = boxes[10]+boxes[13]+boxes[16]
  #   box6 = boxes[11]+boxes[14]+boxes[17]
  #   box7 = boxes[18]+boxes[21]+boxes[24]
  #   box8 = boxes[19]+boxes[22]+boxes[25]
  #   box9 = boxes[20]+boxes[23]+boxes[26]
  # end


  def solve
  end

  def solved?
    #if no cells = 0 or nil
  end

  def inspect
    #iterate over all cells and print the grid
  end 

  # def solve
  #   outstanding_before, looping = SIZE, false
  #   while !solved? && !looping
  #     try_to_solve # ask each cell to solve itself
  #     outstanding         = @cells.count {|c| c.solved? }
  #     looping             = outstanding_before == outstanding       
  #     outstanding_before  = outstanding     
  #   end 
  # end




end 