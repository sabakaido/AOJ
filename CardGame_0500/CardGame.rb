class Person
    @points
    def initialize
        @points = 0
    end

    def addpoint(point)
        @points = @points + point
    end

    def getpoint
        return @points
    end
end

class CardGame
    @Asan
    @Bsan
    @gyou_num
    @output
    def main
        @Asan = Person.new
        @Bsan = Person.new
        while input = gets
            input_array = input.split
            if ! input_array[1]
                init(input_array[0])
                next
            end

            vs(input_array[0].to_i, input_array[1].to_i)

            @gyou_num = @gyou_num - 1
            if @gyou_num == 0
                writeData
                @Asan = Person.new
                @Bsan = Person.new
            end
        end
    end

    def vs(pointA, pointB)
        if pointA > pointB
            @Asan.addpoint(pointA + pointB)
        elsif pointA == pointB
            @Asan.addpoint(pointA)
            @Bsan.addpoint(pointB)
        else
            @Bsan.addpoint(pointA + pointB)
        end
    end

    def writeData
        puts @Asan.getpoint.to_s + " " + @Bsan.getpoint.to_s
    end

    def init(input)
        @gyou_num = input.to_i
        if input.to_i == 0
            return 0
        end
        return TRUE
    end
end

CardGame.new.main
