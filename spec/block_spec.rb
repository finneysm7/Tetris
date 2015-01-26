require 'rspec'
require 'block'
require 'board'

describe "Block" do
  let(:board) {Board.new}
  let(:block) {Block.new(board)}
  
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