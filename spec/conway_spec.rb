require 'rspec'
require 'conway'
require 'pry'


describe Game do
  it "initializes the game with new board" do
    test_game = Game.new(3)
    test_game.should be_an_instance_of Game
  end

  it "creates the board" do
    test_game = Game.new(3)
    test_game.board.should eq ([1, 2, 3, 4, 5, 6, 7, 8 ,9])
  end

  describe "switch" do
    it "creates the grid" do
      test_game = Game.new(3)
      test_game.switch([4, 5, 6])
     test_game.board.should eq (["O", "O", "O", "X", "X", "X", "O", "O", "O"])
    end
  end
  describe "next_gen" do
    it 'check the surrounding cells and determine if cell is dead or alive' do
      test_game = Game.new(3)
      test_game.switch([4, 5, 6])
      test_game.next_gen(test_game.board).should eq (["O", "X", "O", "O", "X", "O", "O", "X", "O"])
    end
  end
#  describe ".loop" do
#    it 'runs an automated loop' do
#      test_game = Game.new(3)
#      test_game.switch([4, 5, 6])
#      Game.loop(test_game.next_gen).should eq (["O", "O", "O", "X", "X", "X", "O", "O", "O"])
#    end
#  end

end


