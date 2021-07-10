require_relative "villain"

class MongolSwordsman < Villain
    def attack(enemy)
        puts "#{@name} slash #{enemy.name} with #{@attack_damage} attack damage."
        super
    end
end
