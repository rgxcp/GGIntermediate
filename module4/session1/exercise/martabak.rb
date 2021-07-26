class Martabak
    attr_reader :topping

    def initialize(topping)
        @topping = topping
    end

    def taste
        "Martabak #{@topping} is delicious"
    end
end
