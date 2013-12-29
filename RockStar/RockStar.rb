class RockStar
    def main
        input = gets.split(" ")

        item_price = []
        input[0].to_i.times{
            item_price << gets.to_i
        }

        item_price.sort!

        obj = SimpleSearch.new
        obj.setTarget(item_price)

        input[1].to_i.times{
            set_point = gets.to_i
            obj.setPoint(set_point)
            result = obj.getOptimumMax
            p result
        }
    end
end

class SimpleSearch
    @max
    @set_point
    @target
    @target_size

    def setPoint(set_point)
        @max = 0
        @set_point = set_point
    end

    def setTarget(target)
        @target      = target
        @target_size = target.size
    end

    def getOptimumMax()
        before_max = @target_size - 1
        # for i=0; i < @target_size - 2; i++
        (@target_size - 2).times{|i|
            if i >= (before_max - 1)
                return @max
            end

            #i, last_max
            before_max = getLocalMax(i, before_max)
            if @max == @set_point
                return @max
            end
        }
        return @max
    end

    def getLocalMax(i, before_max)
        # for j=0; j < before_max; j++  
        (before_max).times{|j|
            if i == (before_max - j)
                return before_max - j
            end

            if @target[i] + @target[before_max - j] <= @max
                return before_max - j
            end
            
            # 設定値を超えない場合
            if (@target[i] + @target[before_max - j]) <= @set_point
                @max = @target[i] + @target[before_max - j]
                return before_max - j
            end
        }
        return i + 1
    end
end

RockStar.new.main()
