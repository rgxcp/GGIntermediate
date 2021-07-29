class IntegerArrayIncrementer
    def increment(input)
        input[-1] = input.last + 1
        if input.last == 10
            if input.one?
                [1, 0]
            else
                input[-1] = 0
                input[-2] += 1
                input
            end
        else
            input
        end
    end
end
