require_relative 'piece'

class Block < Piece
  
  def initialize(board)
    @board = board
    
    first = Square.new([1,4])
    second = Square.new([0,4])
    third = Square.new([0,5])
    last = Square.new([1,5])
    @squares = [first, second, third, last]
    
    @squares.each do |square|
      @board.place(square)
    end
  end
  
  def down
    @board[@squares[0].pos] = nil 
    @board[@squares[3].pos] = nil
    @squares[0].pos[0], @squares[3].pos[0] = 7, 7
    @board[@squares[1].pos] = nil
    @board[@squares[2].pos] = nil
    @squares[1].pos[0], @squares[2].pos[0] = 6, 6
    @squares.each do |square|
      @board.place(square)
    end
  end
end