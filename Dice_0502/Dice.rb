class Main
    @dice
    @sum
    @first_flag
    @end_flag
    def main
        @sum        = 1
        @end_flag   = 0
        @first_flag = 1
        while input = gets
            input.chomp!

            if @end_flag == 0
                if @first_flag == 1
                    @sum = 1
                    @dice = Dice.new
                    @first_flag = 0
                else
                    puts @sum
                    @sum = 1
                    @dice = Dice.new
                end
            end

            @end_flag -= 1

            if input == "North"
                @dice.moveNorth
                @sum += @dice.getUpside
                next
            end

            if input == "South"
                @dice.moveSouth
                @sum += @dice.getUpside
                next
            end

            if input == "East"
                @dice.moveEast
                @sum += @dice.getUpside
                next
            end

            if input == "West"
                @dice.moveWest
                @sum += @dice.getUpside
                next
            end

            if input == "Right"
                @dice.moveRight
                @sum += @dice.getUpside
                next
            end

            if input == "Left"
                @dice.moveLeft
                @sum += @dice.getUpside
                next
            end

            if input.to_i === 0
                exit
            end

            @end_flag = input.to_i
        end
    end
end

class Dice
    @upside
    @downside
    @east
    @west
    @north
    @south

    def initialize
        @upside   = 1
        @downside = 6
        @east     = 3
        @west     = 4
        @north    = 5
        @south    = 2
    end

    def moveRight
        temp      = @north
        @north    = @west
        @west     = @south
        @south    = @east
        @east     = temp
    end

    def moveLeft
        temp      = @north
        @north    = @east
        @east     = @south
        @south    = @west
        @west     = temp
    end

    def moveWest
        temp      = @upside
        @upside   = @east
        @east     = @downside
        @downside = @west
        @west     = temp
    end

    def moveEast
        temp      = @upside
        @upside   = @west
        @west     = @downside
        @downside = @east
        @east     = temp
    end

    def moveSouth
        temp      = @upside
        @upside   = @north
        @north    = @downside
        @downside = @south
        @south    = temp
    end

    def moveNorth
        temp      = @upside
        @upside   = @south
        @south    = @downside
        @downside = @north
        @north    = temp
    end

    def getUpside
        return @upside
    end
end

Main.new.main
