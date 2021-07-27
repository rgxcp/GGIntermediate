class WLI
    attr_writer :names

    def initialize
        @names = []
    end

    def likes
        case @names.length
        when 0
            "No one likes this"
        when 1
            "#{@names.first} likes this"
        when 2
            "#{@names.first} and #{@names.last} like this"
        when 3
            "#{@names.first}, #{@names[1]}, and #{@names[2]} like this"
        else
            "#{@names.first}, #{@names[1]}, and #{@names.length - 2} others like this"
        end
    end
end
