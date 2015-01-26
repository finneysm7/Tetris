require 'rspec'
require 'piece'
require 'board'
require 'rod'


describe "rod" do
  let(:board) {Board.new}
  let(:rod) {Rod.new(board)}
  
  it "should have a board" do
    expect(rod.board).to eq(board)
    expect(board[[rod.squares[0].pos[0],rod.squares[0].pos[1]]]).to eq(rod.squares[0])
  end
  
  it "should have the correct number of squares" do
    expect(rod.squares.length).to eq(4)
  end
  
  it "should start in the middle of the board" do
    expect(rod.squares[0].pos).to eq([0, 3])
    expect(rod.squares[1].pos).to eq([0, 4])
    expect(rod.squares[2].pos).to eq([0, 5])
    expect(rod.squares[3].pos).to eq([0, 6])
  end
  
  it "should exist on the board" do
    expect(rod.board[[0,3]]).to eq(rod.squares[0])
    expect(rod.board[[0,4]]).to eq(rod.squares[1])
    expect(rod.board[[0,5]]).to eq(rod.squares[2])
    expect(rod.board[[0,6]]).to eq(rod.squares[3])
  end
end