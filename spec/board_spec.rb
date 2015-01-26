require 'rspec'
require 'board'
require 'piece'


describe "Board" do
  let(:board) { Board.new }
  let(:piece) { Piece.new(board) }
  let(:square){ Square.new([0,0])}
  
  it "is the correct size" do
    expect(board.grid.length).to eq(8)
    expect(board.grid[0].length).to eq(10)
  end
  
  context "#[]" do
    it "retrieves nil when space empty" do
      expect(piece.board[[0,0]]).to eq(nil)
    end
    
    it "retrieves square when space is occupied" do
      expect(piece.board[[0,4]]).to eq(piece.squares[0])
    end
  end
  
  context "#[]=" do
    before(:each) do
      board[[0,0]] = 1
    end
    
    it "sets grid position equal to a value" do
      expect(board[[0,0]]).to eq(1)
    end
  end
  
  context "#place" do
    before(:each) do
      board.place(square)
    end
    
    it "sets squares" do
      expect(piece.board[square.pos]).to eq(square)
    end
  end
  
  context "#in_board?" do
    it "returns true for positions on the board" do
      expect(board.in_board?([0,0])).to be true
    end
    
    it "returns false for pieces off the board" do
      expect(board.in_board?([0,-1])).to be false
      expect(board.in_board?([0,11])).to be false
    end
  end
  
 
  context "#bottom_filled? when not full" do
    it "returns false if the bottom is not full" do
      expect(board.bottom_filled?).to be false
    end
  end
    
  context "#bottom_filled? when full" do
    before(:each) do
      i = 0
      10.times do
        square = Square.new([7,i])
        board.place(square)
        i += 1
      end
    end
  
    it 'returns true if the bottom is full' do
      expect(board.bottom_filled?).to be true
    end
  end
end