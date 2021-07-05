require_relative "game"
require_relative "player"

player1 = Player.new(
    name: "Jin Sakai",
    hitpoint: 100,
    attack_damage: 50
)
puts player1

player2 = Player.new(
    name: "Khotun Khan",
    hitpoint: 500,
    attack_damage: 50
)
puts player2

game = Game.new(
    player1: player1,
    player2: player2
)
game.play until game.finished?
puts game.result
