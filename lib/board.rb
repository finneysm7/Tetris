class Board
  
  attr_accessor :grid
  
  def initialize
    @grid = Array.new(8) { Array.new(10) { nil }}
  end
  
  def [](pos)
    @grid[pos[0]][pos[1]]
  end
  
  def []=(pos, val)
    @grid[pos[0]][pos[1]] = val
  end
  
  def place(square)
    @grid[square.pos[0]][square.pos[1]] = square
  end
  
  def in_board?(pos)
    pos[0] < 8 && pos[0] > -1 && pos[1] < 10 && pos[1] > -1
  end
  
  def bottom_filled?
    @grid[7].each do |cell|
      if !cell
        return false
      end
    end
    return true
  end
end