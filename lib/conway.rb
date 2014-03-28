require 'pry'

class Game

  attr_reader :board, :grid


  def initialize(grid)
    @grid = grid
    
    @board = (1..grid*grid).to_a
  end
  
  def self.all
    @board
  end

  def switch(live_cells)
    #live_cells 4, 5, 6]
    #@board [1, 2, 3, 4, 5, 6, 7, 8 ,9]
    #if live_cell == @board number ==> X
    #if live_cell != @board number ==> -

    live_cells.each do |cell|
      @board.map! {|number| number == cell ? "O" : number}
    end
    live_cells.each do |cell|
      @board.map! {|number| number != "O" ? "-" : number }
    end      
  end
  
  def next_gen(board_array)
    new_board = []
    board_array.each_with_index do |cell, i|
      array = []
     
      live_neighbors = 0
      x = i + 1
      if (i % @grid) != (@grid - 1) && (x >= 0) && (x <= ((@grid * @grid) -1))
        array << board_array[x]
      end
      x = i - 1
      if ((i % @grid) != 0) && (x >= 0) && (x <= ((@grid * @grid) -1))
        array << board_array[x]
      end
      x = i + @grid
      if x >= 0 && x <= ((@grid * @grid) -1)
        array << board_array[x]
      end  
      x = (i + @grid) + 1
      if (i % @grid) != (@grid - 1) && (x >= 0) && (x <= ((@grid * @grid) -1))
        array << board_array[x]
      end  
      x = (i + @grid) - 1
      if ((i % @grid) != 0) && (x >= 0) && (x <= ((@grid * @grid) -1))
        array << board_array[x]
      end 
          
      x = i - @grid
      if x >= 0 && x <= ((@grid * @grid) -1)
        array << board_array[x]
      end  
      x = (i - @grid) + 1
      if x >= 0 && x <= ((@grid * @grid) -1) && (i % @grid) != (@grid - 1)
        array << board_array[x]
      end  
      x = (i - @grid) - 1
      if x >= 0 && x <= ((@grid * @grid) -1) && ((i % @grid) != 0)
        array << board_array[x]
      end 
      
      array.each do |cell|
        if cell == "O"
          live_neighbors += 1
        end
      end
    
      if cell == "O" && live_neighbors == 2
        new_board << "O"
      elsif cell == "O" && live_neighbors == 3
        new_board << "O"
      elsif
        cell == "-" && live_neighbors == 3
        new_board << "O"
      else
        new_board << "-"
      end
    end
    new_board
  end
  
  
    
end

