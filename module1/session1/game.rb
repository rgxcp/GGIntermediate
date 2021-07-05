class Game
    def initialize(player1:, player2:)
        @player1 = player1
        @player2 = player2
    end

    def play
        attack(@player1, @player2)
        attack(@player2, @player1)
    end

    def attack(attacker, defender)
        if defender.name == "Jin Sakai" && deflect?
            puts "#{defender.name} deflects the attack."
            puts "#{defender.name} has #{defender.hitpoint} hitpoint and #{defender.attack_damage} attack damage."
        else
            defender.set_hitpoint(defender.hitpoint - attacker.attack_damage)
            puts "#{attacker.name} attacks #{defender.name} with #{attacker.attack_damage} attack damage."
        end
    end

    def deflect?
        rand(100) > 80 ? true : false
    end

    def finished?
        @player1.hitpoint <= 0 || @player2.hitpoint <= 0
    end

    def result
        @player1.hitpoint <= 0 ? "#{@player1.name} dies." : "#{@player2.name} dies."
    end
end
