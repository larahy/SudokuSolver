class Cell

def initialize(value = 0)
  @value = value 
end

  attr_accessor :value

  def empty?
    @value == 0
  end

  def possible_values(neighbours)
    (1..9).to_a - neighbours
  end

  def solve(neighbours)
    values = possible_values(neighbours)
    if possible_values(neighbours).length == 1
      self.value = values.first
    end
  end
  
end
