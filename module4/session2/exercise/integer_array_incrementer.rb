class IntegerArrayIncrementer
    def increment(input)
        if input.last == 9
            add_one_next_number = false

            input.reverse!.map! { |number|
                if number == 9
                    add_one_next_number = true
                    0
                elsif add_one_next_number
                    add_one_next_number = false
                    number + 1
                else
                    number
                end
            }

            if input.uniq.length == 1
                input.reverse.unshift(1)
            else
                input.reverse
            end
        else
            input[-1] += 1
            input
        end

        # Old approach
        # input[-1] = input.last + 1
        # if input.last == 10 && input.one?
        #     [1, 0]
        # elsif input.last == 10
        #     input[-1] = 0
        #     input[-2] += 1
        #     input
        # else
        #     input
        # end
    end
end
