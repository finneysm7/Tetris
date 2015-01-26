require 'rspec'
require 'piece'
require 'board'

describe "Piece" do 
  let(:board) { Board.new }
  let(:piece) { Piece.new(board) }
  
  it "should have a board" do
    expect(piece.board).to eq(board)
    expect(board[[piece.squares[0].pos[0],piece.squares[0].pos[1]]]).to eq(piece.squares[0])
  end
  
  it "should have the correct number of squares" do
    expect(piece.squares.length).to eq(2)
  end
  
  it "should start in the middle of the board" do
    expect(piece.squares[0].pos).to eq([0, 4])
    expect(piece.squares[1].pos).to eq([0, 5])
  end
  
  it "should exist on the board" do
    expect(piece.board[[0,4]]).to eq(piece.squares[0])
    expect(piece.board[[0,5]]).to eq(piece.squares[1])
  end
  
  context "#left" do
    before(:each) do
      piece.left
    end
    
    it "should move the piece to the left" do
      expect(piece.squares[0].pos).to eq([0, 3])
      expect(piece.squares[1].pos).to eq([0, 4])
    end
    
    it "should take the square off the board" do
      expect(piece.board[[0,5]]).to eq(nil)
    end
  end
  
  context "#right" do
    before(:each) do
      piece.right
    end
    
    it "should move the piece to the right" do
      expect(piece.squares[0].pos).to eq([0, 5])
      expect(piece.squares[1].pos).to eq([0, 6])
    end
    
    it "should take the square off the board" do
      expect(piece.board[[0,4]]).to eq(nil)
      expect(piece.board[[0,5]]).to eq(piece.squares[0])
    end
  end
  
  context "#down" do
    before(:each) do
      piece.down
    end
    
    it "should move the piece down" do
      expect(piece.squares[0].pos).to eq([7, 4])
      expect(piece.squares[1].pos).to eq([7, 5])
    end
    
    it "should take the square off the board" do
      expect(piece.board[[0,4]]).to eq(nil)
      expect(piece.board[[0,5]]).to eq(nil)
    end
  end
end

describe "Square" do
  let(:square) {Square.new([0,0])}
  
  context "#display_value" do
    it "displays a value" do
      expect(square.display_value).to eq("[ ]")
    end
  end
end