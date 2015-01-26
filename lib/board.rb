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
  
  def display
    @grid.each_with_index do |row, idx|
      display_grid = []
      row.each_with_index do |cell, j|
        if cell == nil
          display_grid << ' - '
        else
          display_grid << cell.display_value
        end
      end
      display_grid.each do |square|
        print square
      end
      
      print "\n"
    end
    print "\n"
    
    sleep(0.15)
  end
end