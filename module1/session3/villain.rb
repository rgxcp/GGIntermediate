require_relative "player"

class Villain < Player
    def initialize(name:, hitpoint:, attack_damage:)
        super
        @flee = false
    end

    def flee
        @flee = true
        puts "#{@name} has fled the battlefield with #{@hitpoint} hitpoint left."
    end

    def flee?
        @flee
    end

    def take_damage(attack_damage)
        super
        flee if !die? && @hitpoint <= 50 && rand(100) < 50
    end
end
