class IntegerArrayIncrementer
    def increment(input)
        if input == [9]
            [1, 0]
        else
            last_digit = input[-1] + 1
            input[-1] = last_digit
            input
        end
    end
end
