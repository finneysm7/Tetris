require 'rspec'
require 'block'
require 'board'

describe "Block" do
  let(:board) {Board.new}
  let(:block) {Block.new(board)}
  
  it "should have a board" do
    expect(block.board).to eq(board)
    expect(board[[block.squares[0].pos[0],block.squares[0].pos[1]]]).to eq(block.squares[0])
  end
  
  it "should have the correct number of squares" do
    expect(block.squares.length).to eq(4)
  end
  
  it "should start in the middle of the board" do
    expect(block.squares[0].pos).to eq([1, 4])
    expect(block.squares[1].pos).to eq([0, 4])
    expect(block.squares[2].pos).to eq([0, 5])
    expect(block.squares[3].pos).to eq([1, 5])
  end
  
  it "should exist on the board" do
    expect(block.board[[1,4]]).to eq(block.squares[0])
    expect(block.board[[0,4]]).to eq(block.squares[1])
    expect(block.board[[0,5]]).to eq(block.squares[2])
    expect(block.board[[1,5]]).to eq(block.squares[3])
  end
  
  context "#down" do
    before(:each) do
      block.down
    end
    
    it "should move the piece down" do
      expect(block.squares[0].pos).to eq([7, 4])
      expect(block.squares[1].pos).to eq([6, 4])
      expect(block.squares[2].pos).to eq([6, 5])
      expect(block.squares[3].pos).to eq([7, 5])
    end
    
    it "should take the square off the board" do
      expect(block.board[[1,4]]).to eq(nil)
      expect(block.board[[1,5]]).to eq(nil)
      expect(block.board[[0,4]]).to eq(nil)
      expect(block.board[[0,5]]).to eq(nil)
    end
  end
end