class Player
    def initialize(name:, hitpoint:, attack_damage:)
        @name = name
        @hitpoint = hitpoint
        @attack_damage = attack_damage
    end

    def name
        @name
    end

    def to_s
        "#{@name} has #{@hitpoint} hitpoint and #{@attack_damage} attack damage."
    end

    def attack(enemy)
        enemy.take_damage(@attack_damage)
    end

    def take_damage(attack_damage)
        @hitpoint -= attack_damage
        puts "#{@name} dies." if die?
    end

    def add_hitpoint(hitpoint)
        @hitpoint += hitpoint
    end

    def die?
        @hitpoint.zero? || @hitpoint.negative?
    end
end
