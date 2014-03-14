class Game

  attr_reader :board


  def initialize(grid)
    @grid = grid
    @board = (1..grid*grid).to_a
  end

  def switch(live_cells)
    #live_cells 4, 5, 6]
    #@board [1, 2, 3, 4, 5, 6, 7, 8 ,9]
    #if live_cell == @board number ==> X
    #if live_cell != @board number ==> -

    live_cells.each do |cell|
      @board.map! {|number| number == cell ? "✿" : number}
    end
    live_cells.each do |cell|
      @board.map! {|number| number != "✿" ? "-" : number }
    end

    print @board
  end

end
