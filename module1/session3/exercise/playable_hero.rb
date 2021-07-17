require_relative "player"

class PlayableHero < Player
    def attack(enemy)
        puts "#{@name} attacks #{enemy.name} with #{@attack_damage} attack damage."
        super
    end

    def deflect?
        rand(100) < 80 ? true : false
    end

    def heals(ally)
        ally.add_hitpoint(20)
    end

    def pick_turn_action(heroes, villains)
        puts "As #{@name}, what do you want to do this turn?"
        puts "1) Attack an enemy"
        puts "2) Heal an ally"
        choice = gets.chomp.to_i
        if choice == 1
            puts "Which enemy you want to attack?"
            villains.each_with_index do |villain, index|
                puts "#{index + 1}) #{villain.name}"
            end
            enemy = gets.chomp.to_i - 1
            attack(villains[enemy])
        else
            puts "Which ally you want to heal?"
            heroes[1..-1].each_with_index do |hero, index|
                puts "#{index + 1}) #{hero.name}"
            end
            ally = gets.chomp.to_i
            heals(heroes[ally])
        end
    end

    def playable_hero?
        true
    end

    def take_damage(attack_damage)
        if deflect?
            puts "#{@name} deflects the attack."
            puts "#{@name} has #{@hitpoint} hitpoint and #{@attack_damage} attack damage."
        else
            super
        end
    end
end
