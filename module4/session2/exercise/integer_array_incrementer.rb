class IntegerArrayIncrementer
    def increment(input)
        input[-1] = input.last + 1
        if input.last == 10 && input.one?
            [1, 0]
        elsif input.last == 10
            input[-1] = 0
            input[-2] += 1
            input
        else
            input
        end
    end
end
