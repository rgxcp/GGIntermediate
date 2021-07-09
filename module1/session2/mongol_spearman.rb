require_relative "villain"

class MongolSpearman < Villain
    def attack(enemy)
        super
        puts "#{@name} thrusts #{enemy.name} with #{@attack_damage} attack damage."
    end
end
