require_relative "villain"

class MongolSwordsman < Villain
    def attack(enemy)
        super
        puts "#{@name} slash #{enemy.name} with #{@attack_damage} attack damage."
    end
end
