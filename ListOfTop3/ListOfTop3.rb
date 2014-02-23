class Mountains
    @data
    def initialize
        @data = []
        while input = gets
            @data << input.to_i
        end
    end

    def sortData
        @data.sort!.reverse!
    end

    def getData
        return @data
    end
end

class Main
    def run
        m = Mountains.new
        m.sortData
        d = m.getData
        flg = 0
        d.map{|height|
            flg += 1
            p height
            if (flg == 3) 
                break
            end
        }
    end
end

Main.new.run;
