class SimpleEncoder
    MAX_ORD = "z".ord
    MIN_ORD = "a".ord
    VOWEL_CHARS = ["a", "i", "u", "e", "o"]

    def encode(input)
        output = ""
        input.each_char do |char|
            if VOWEL_CHARS.include? char
                ord = char.ord
                new_ord = ord - 5
                if new_ord < MIN_ORD
                    diff = MIN_ORD - new_ord
                    new_ord = MAX_ORD - diff + 1
                end
                output << new_ord.chr
            elsif char != ""
                ord = char.ord
                new_ord = ord + 9
                if new_ord > MAX_ORD
                    diff = new_ord - MAX_ORD
                    new_ord = MIN_ORD + diff - 1
                end
                output << new_ord.chr
            else
                output << ""
            end
        end
        output
    end
end
