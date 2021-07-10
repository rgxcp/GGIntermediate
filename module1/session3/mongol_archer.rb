require_relative "villain"

class MongolArcher < Villain
    def attack(enemy)
        puts "#{@name} shoots an arrow at #{enemy.name} with #{@attack_damage} attack damage."
        super
    end
end
