require_relative "villain"

class MongolSpearman < Villain
    def attack(enemy)
        puts "#{@name} thrusts #{enemy.name} with #{@attack_damage} attack damage."
        super
    end
end
