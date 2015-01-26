require 'rspec'
require 'tetris'
require 'piece'
require 'board'


describe "Game" do
  let(:board) {Board.new}
  let(:game) {Game.new(board)}
  let(:piece) {Piece.new(board)}
  let(:piece_new) {Piece.new(piece.board)}

  
  context "#move_to_right_corner" do
    before(:each) do
      game.move_to_right_corner(piece)
    end
    
    it "should move the piece to the right corner" do
      expect(piece.squares[0].pos).to eq([0,8])
      expect(piece.squares[-1].pos).to eq([0,9])
    end
  end
  
  context "#move_left_or_down when empty" do
    before(:each) do
      game.move_to_right_corner(piece)
      game.move_left_or_down(piece)
    end
    
    it "moves piece down when it can" do
      expect(piece.squares[0].pos).to eq([7,8])
      expect(piece.squares[1].pos).to eq([7,9])
    end
  end
  
  context "#move_left_or_down with another piece" do
    before(:each) do
      game.move_to_right_corner(piece)
      game.move_left_or_down(piece)
      game.move_to_right_corner(piece_new)
      game.move_left_or_down(piece_new)
    end
    
    it "moves piece to the left until it finds a spot" do
      expect(piece_new.squares[0].pos).to eq([7,6])
      expect(piece_new.squares[-1].pos).to eq([7,7])
    end
  end
  
  context "#play" do
    before(:each) do
      game.play
    end
    
    it "plays until bottom row is full" do
      expect(board.bottom_filled?).to be true
    end
  end
end


