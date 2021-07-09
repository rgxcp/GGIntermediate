require_relative "game"
require_relative "hero"
require_relative "mongol_archer"
require_relative "mongol_spearman"
require_relative "mongol_swordsman"

jin_sakai = Hero.new(
    name: "Jin Sakai",
    hitpoint: 100,
    attack_damage: 50
)
puts jin_sakai

yuna = Hero.new(
    name: "Yuna",
    hitpoint: 90,
    attack_damage: 45
)
puts yuna

sensei_ishikawa = Hero.new(
    name: "Sensei Ishikawa",
    hitpoint: 80,
    attack_damage: 60
)
puts sensei_ishikawa

puts ""

mongol_archer = MongolArcher.new(
    name: "Mongol Archer",
    hitpoint: 80,
    attack_damage: 40
)
puts mongol_archer

mongol_spearman = MongolSpearman.new(
    name: "Mongol Spearman",
    hitpoint: 120,
    attack_damage: 60
)
puts mongol_spearman

mongol_swordsman = MongolSwordsman.new(
    name: "Mongol Swordsman",
    hitpoint: 100,
    attack_damage: 50
)
puts mongol_swordsman

game = Game.new(
    heroes: [
        jin_sakai,
        yuna,
        sensei_ishikawa
    ],
    villains: [
        mongol_archer,
        mongol_spearman,
        mongol_swordsman
    ]
)
turn = 1
until game.finished? do
    puts ""
    puts "=== Turn #{turn} ==="
    game.play
    turn += 1
end
puts game.result
