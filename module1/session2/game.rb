class Game
    def initialize(heroes:, villains:)
        @heroes = heroes
        @villains = villains
    end

    def play
        @heroes.each do |hero|
            if hero.die?
                @heroes.delete(hero)
            else
                if hero.name == "Jin Sakai"
                    puts "As Jin Sakai, what do you want to do this turn?"
                    puts "1) Attack an enemy"
                    puts "2) Heal an ally"
                    choice = gets.chomp.to_i
                    puts ""
                    if choice == 1
                        puts "Which enemy you want to attack?"
                        @villains.each_with_index do |villain, index|
                            puts "#{index + 1}) #{villain.name}"
                        end
                        enemy = gets.chomp.to_i - 1
                        puts ""
                        hero.attack(@villains[enemy])
                    else
                        puts "Which ally you want to heal?"
                        @heroes[1..-1].each_with_index do |hero, index|
                            puts "#{index + 1}) #{hero.name}"
                        end
                        ally = gets.chomp.to_i
                        puts ""
                        hero.heals(@heroes[ally])
                    end
                else
                    hero.attack(@villains[rand(@villains.size)])
                end
            end
        end

        @villains.each do |villain|
            if villain.die? || villain.flee?
                @villains.delete(villain)
            else
                villain.attack(@heroes[rand(@heroes.size)])
            end
        end
    end

    def finished?
        @heroes.empty? || @villains.empty?
    end

    def result
        @heroes.empty? ? "Villains won the battle." : "Heroes won the battle."
    end
end
