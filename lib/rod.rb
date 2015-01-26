require_relative 'piece'

class Rod < Piece
  
  def initialize(board)
    @board = board
    i = 3
    @squares = []
    4.times do
      @squares << Square.new([0,i])
      i += 1
    end
    @squares.each do |square|
      @board.place(square)
    end
  end
end