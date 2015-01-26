class Piece
  
  attr_accessor :squares, :board
  
  def initialize(board)
    # original initialize function
    @board = board
    first = Square.new([0,4])
    last = Square.new([0,5])
    @squares = [first, last]
    @squares.each do |square|
      @board.place(square)
    end
  end
  
  def left
    @squares.each do |square|
      square.pos[1] -= 1
      @board.place(square)
    end
  end
  
  def right
    @squares.each do |square|
      square.pos[1] += 1
      @board.place(square)
    end
  end
  
  def down
    @squares.each do |square|
      square.pos[0] = 7
      @board.place(square)
    end
  end
  
end

class Square
  
  attr_accessor :pos
  
  def initialize(pos)
    @pos = pos
  end
  
end