require_relative '../lib/grid'

describe Grid do 

  let (:puzzle) {'015003002000100906270068430490002017501040380003905000900081040860070025037204600'}
  let (:grid) {Grid.new(puzzle)}
  
  context 'Basic grid format' do 

    it 'should should have 9 rows' do
      expect(grid.grid.length).to eq(9)
    end

    it 'each row should have 9 cells' do
      expect(grid.grid[0].length).to eq(9)
    end

    it 'should contain 81 cells' do
      expect(grid.grid.flatten.count).to eq(81)
    end

    it 'should be able to read the value of a cell' do
      expect(grid.grid[0][0].value).to eq(0)
    end

  end

  context 'Neighbours' do

    it 'should know other values in the row' do
      expect(grid.row_neighbours_to(0, 0)).to eq([0, 1, 5, 0, 0, 3, 0, 0, 2])
    end

    it 'should know other values in the column' do
      expect(grid.column_neighbours_to(0, 0)).to eq([0, 0, 2, 4, 5, 0, 9, 8, 0])
    end

    it 'should know the other values in the box' do
      expect(grid.box_neighbours_to(0,0)).to eq([0, 1, 5, 0, 0, 0, 2, 7, 0])
    end 

    it 'should sort and shorten neighbour values' do
      expect(grid.all_neighbours_to(0,0)).to eq([1,2,3,4,5,7,8,9])
    end

  end
  
end