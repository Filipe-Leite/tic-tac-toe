require_relative 'game'
require_relative 'player'

players =[
    Player.new("Tevin", :X),
    Player.new("Sasha", :O)
]

game = Game.new(players)

puts "Welcome to tic tac toe"
winner = game.play_until_end
puts "#{winner.name} won!"