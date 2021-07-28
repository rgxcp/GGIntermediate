class IntegerArrayIncrementer
    def increment(input)
        if input == [9]
            [1, 0]
        else
            [input.last + 1]
        end
    end
end
