require_relative 'game'
require_relative 'piece'
require_relative 'board'

if __FILE__ == $PROGRAM_NAME
  g = Game.new(Board.new)
  
  g.play
end


