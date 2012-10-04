#!/usr/bin/env ruby
require './tile'
require './board'
require './ship'

new_game = Board.new
new_game.ship_create
new_game.tile_create
new_game.draw

until new_game.game_over?
  print 'Select a coordinate (A1..J10): '
  coord = gets.chomp
  break if coord.downcase == "quit"

  tile = new_game.tile(coord)
  
  if tile
    if tile.called?
      puts "You've already fired there!"
    else
      new_game.fire(tile)
      print "\e[H\e[2J"
      new_game.draw
    end
  else
    puts "That's not a valid coordinate!"
  end
end

