require 'pry'
require './lib/conway'

def menu
  system "clear"
  puts "What size of grid do you want in NxN format?"
  grid = gets.chomp.to_i
  new_game = Game.new(grid)
  i = 0
  j = grid
  grid.times do
    puts "#{new_game.board[i..(j-1)].join(" ")}"
    i += grid
    j += grid
  end
set_live(new_game, grid)
end

def set_live(new_game, grid)
  puts "\n ##Select numbers to make them alive saparated by a space##"
  numbers = gets.chomp
  number_array = []
  numbers.split(" ").each { |number| number_array << number.to_i }
  
  new_game.switch(number_array)
  i = 0
  j = grid
  sleep(1)
  puts "\n"
  grid.times do
    puts "#{new_game.board[i..(j-1)].join(" ")}"
    i += grid
    j += grid
  end
  new_gen(new_game, grid)
end

def new_gen(new_game, grid)
  i = 0
  j = grid
  board = new_game.next_gen(new_game.board)
  sleep(1)
  puts "\n"
  grid.times do
    puts "#{ board[i..(j-1)].join(" ") }"
    i += grid
    j += grid
  end
  live_loop(new_game, board, grid)
end
def live_loop(new_game, board, grid)
  i = 0
  j = grid
  board = new_game.next_gen(board)
  sleep(1)
  puts "\n"
  grid.times do

    puts "#{ board[i..(j-1)].join(" ") }"
    i += grid
    j += grid
  end
  live_loop(new_game, board, grid)  
end
menu