require_relative "player"

class Hero < Player
    def attack(enemy)
        super
        puts "#{@name} attacks #{enemy.name} with #{@attack_damage} attack damage."
    end

    def take_damage(attack_damage)
        if @name == "Jin Sakai" && deflect?
            puts "#{@name} deflects the attack."
            puts "#{@name} has #{@hitpoint} hitpoint and #{@attack_damage} attack damage."
        else
            super
        end
    end

    def deflect?
        rand(100) < 80 ? true : false
    end

    def heals(ally)
        ally.add_hitpoint(20)
        puts "#{ally.name} restoring +20 hitpoint."
    end
end
