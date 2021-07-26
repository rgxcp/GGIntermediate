class WLI
    attr_accessor :names

    def initialize
        @names = []
    end

    def likes
        case @names.length
        when 0
            return "No one likes this"
        when 1
            return "#{@names.first} likes this"
        when 2
            return "#{@names.first} and #{@names.last} like this"
        when 3
            return "#{@names.first}, #{@names[1]}, and #{@names[2]} like this"
        else
            return "#{@names.first}, #{@names[1]}, and #{@names.length - 2} others like this"
        end
    end
end
