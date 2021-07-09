require_relative "villain"

class MongolArcher < Villain
    def attack(enemy)
        super
        puts "#{@name} shoots an arrow at #{enemy.name} with #{@attack_damage} attack damage."
    end
end
