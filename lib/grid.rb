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
    boxes = grid.flatten.map {|cell| cell.value}.each_slice(3).to_a
    if row_index <=2 && column_index <=2
      box1 = boxes[0]+boxes[3]+boxes[6]
      box1
    elsif row_index <= 2 && 3 <= column_index && column_index <= 5
      box2 = boxes[1]+boxes[4]+boxes[7]
      box2
    elsif row_index <=2 && column_index >=6
      box3 = boxes[2]+boxes[5]+boxes[8]
      box3
    elsif 3<= row_index && row_index <=5 && column_index <=2
      box4 = boxes[9]+boxes[12]+boxes[15]
      box4
    elsif 3<= row_index && row_index <=5 && 3 <= column_index && column_index <= 5
      box5 = boxes[10]+boxes[13]+boxes[16]
      box5
    elsif 3<= row_index && row_index <=5 && column_index >=6
      box6 = boxes[11]+boxes[14]+boxes[17]
      box6
    elsif row_index >=6 && column_index <=2
      box7 = boxes[18]+boxes[21]+boxes[24]
      box7
    elsif row_index >=6 && 3 <= column_index && column_index <= 5
      box8 = boxes[19]+boxes[22]+boxes[25]
      box8
    elsif row_index >=6 && column_index >=6
      box9 = boxes[20]+boxes[23]+boxes[26]
      box9
    end
  end

  def all_neighbours_to(row_index, column_index)
    neighbours = box_neighbours_to(row_index, column_index) + column_neighbours_to(row_index, column_index) + row_neighbours_to(row_index, column_index) 
    no_duplicates = neighbours.uniq
    no_duplicates.delete(0)
    no_duplicates.sort  
  end

  def unsolved_cells
    unsolved = []
    grid.each_with_index do |row,row_index|
      row.each_with_index do |cell,column_index|
        if cell.value == 0
          unsolved << cell
        end
      end
    end
    unsolved
  end

  def solve
    outstanding_before = unsolved_cells.count #starting no of unsolved cells
    looping = false
    while !solved? && !looping
      grid.each_with_index do |row,row_index|
        row.each_with_index do |cell,column_index|
          if cell.value == 0
            solve_cell(cell,row_index,column_index)
          end
        end
      end
      outstanding = unsolved_cells.count
      looping = outstanding_before == outstanding       
      outstanding_before = outstanding
      puts "solved? #{solved?}"
      puts "looping? #{looping}"     
    end 
    inspect
  end

  def solve_cell(cell, row_index, column_index)
      neighbours = all_neighbours_to(row_index, column_index)
      cell.solve(neighbours) 
  end

  def solved?
   !grid.flatten.map {|cell| cell.value}.include?(0)
  end

  def inspect
    grid.each do |r|
      puts r.map { |cell| cell.value }.join(" ")
    end 
  end

end 