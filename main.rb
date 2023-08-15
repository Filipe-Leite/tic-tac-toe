require_relative 'game'
require_relative 'player'

players =[
    Player.new("Tevin", :X),
    Player.new("Sasha", :O)
]

game = Game.new(players)

puts "Welcome to tic tac toe"
puts "It is player one's turn"
puts game.display_board
puts "Player one, pick a move"
p game.play_turn(players[0])
puts game.display_board