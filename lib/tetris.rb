require 'piece'
class Game
  
  attr_accessor :board
  
  def initialize(board)
    @board = board
  end
    
  def play
    piece = Piece.new(@board)
    until piece.board.bottom_filled?
      move_to_right_corner(piece)
      move_left_or_down(piece)
      piece = Piece.new(board)
      p @board.grid
    end
  end
  
  def move_to_right_corner(piece)
    pos = [piece.squares[1].pos[0], piece.squares[1].pos[1] + 1]
    while @board.in_board?(pos)
      piece.right
      pos = [piece.squares[1].pos[0], piece.squares[1].pos[1] + 1]
    end
    @board = piece.board
  end
  
  def move_left_or_down(piece)
    left_pos = piece.squares[0].pos
    while piece.squares[1].pos[0] != 7 && piece.board.in_board?(left_pos)
      bot_pos = [7, piece.squares[1].pos[1]]
      unless @board[bot_pos]
        piece.down
      else
        piece.left
        left_pos = piece.squares[0].pos
      end
    end
    @board = piece.board
  end
end


