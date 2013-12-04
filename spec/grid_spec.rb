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

  
end