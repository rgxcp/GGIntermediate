class Game
    def initialize(heroes:, villains:)
        @heroes = heroes
        @villains = villains
    end

    def finished?
        @heroes.empty? || @villains.empty?
    end

    def greet_players
        @heroes.each do |hero|
            puts hero
        end

        @villains.each do |villain|
            puts villain
        end
    end

    def play
        greet_players
        start_battle
        puts result
    end

    def result
        @heroes.empty? ? "Villains won the battle." : "Heroes won the battle."
    end

    def start_battle
        turn = 1
        until finished?
            puts "=== Turn #{turn} ==="
            @heroes.each do |hero|
                if hero.die?
                    @heroes.delete(hero)
                else
                    if hero.playable_hero?
                        hero.pick_turn_action(@heroes, @villains)
                    else
                        # TODO: After this hero attack the enemy & the enemy died,
                        #       there's a chance that the next hero can still attack this enemy.
                        #       Because this enemy isn't deleted yet until this loop finished.
                        hero.attack(@villains[rand(@villains.size)])
                    end
                end
            end

            @villains.each do |villain|
                if villain.die? || villain.flee?
                    @villains.delete(villain)
                else
                    # TODO: Same as above.
                    villain.attack(@heroes[rand(@heroes.size)])
                end
            end
            turn += 1
        end
    end
end
