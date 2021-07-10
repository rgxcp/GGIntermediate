require_relative "player"

class NonPlayableHero < Player
    def add_hitpoint(hitpoint)
        @hitpoint += hitpoint
        puts "#{@name} restoring +20 hitpoint."
    end

    def attack(enemy)
        puts "#{@name} attacks #{enemy.name} with #{@attack_damage} attack damage."
        super
    end

    def playable_hero?
        false
    end
end
