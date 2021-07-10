require_relative "game"
require_relative "mongol_archer"
require_relative "mongol_spearman"
require_relative "mongol_swordsman"
require_relative "non_playable_hero"
require_relative "playable_hero"

jin_sakai = PlayableHero.new(
    name: "Jin Sakai",
    hitpoint: 100,
    attack_damage: 50
)
yuna = NonPlayableHero.new(
    name: "Yuna",
    hitpoint: 90,
    attack_damage: 45
)
sensei_ishikawa = NonPlayableHero.new(
    name: "Sensei Ishikawa",
    hitpoint: 80,
    attack_damage: 60
)

mongol_archer = MongolArcher.new(
    name: "Mongol Archer",
    hitpoint: 80,
    attack_damage: 40
)
mongol_spearman = MongolSpearman.new(
    name: "Mongol Spearman",
    hitpoint: 120,
    attack_damage: 60
)
mongol_swordsman = MongolSwordsman.new(
    name: "Mongol Swordsman",
    hitpoint: 100,
    attack_damage: 50
)

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
game.play
