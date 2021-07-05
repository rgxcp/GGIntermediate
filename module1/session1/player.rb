class Player
    def initialize(name:, hitpoint:, attack_damage:)
        @name = name
        @hitpoint = hitpoint
        @attack_damage = attack_damage
    end

    def to_s
        "#{@name} has #{@hitpoint} hitpoint and #{@attack_damage} attack damage."
    end

    def name
        @name
    end

    def hitpoint
        @hitpoint
    end

    def attack_damage
        @attack_damage
    end

    def set_hitpoint(hitpoint)
        @hitpoint = hitpoint
    end
end
