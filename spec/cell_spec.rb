require_relative '../lib/cell'

  describe Cell do

    let (:cell) {Cell.new}

    it 'should be zero by default' do
      expect(cell.value).to eq(0)
    end

    it 'should be able to have a value' do
      cell.value = 5
      expect(cell.value).to eq(5)
    end

    it 'should not be empty if it has a value' do
      cell.value = 4
      expect(cell).not_to be_empty
    end

    context 'can solve itself' do

      it 'if there is only one solution' do
        neighbours = [1,2,3,4,6,7,8,9]
        cell.solve(neighbours)
        expect(cell.value).to eq(5)
      end

      it 'if there is more than one solution' do
        neighbours = [1,2,3,4]
        cell.solve(neighbours)
        expect(cell.value).to eq(0)
      end

    end

    context 'should know possible values' do

      it 'given all neighbours but one' do
        neighbours = [1,2,3,4,6,7,8,9]
        expect(cell.possible_values(neighbours)).to eq([5])
      end

      it 'given all neighbours but two' do
        neighbours = [2,3,4,6,7,8,9]
        expect(cell.possible_values(neighbours)).to eq([1,5])
      end

    end

  end



