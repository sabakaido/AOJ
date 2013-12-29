class RockStar
    def main
        input = gets.split(" ")

        item_price = []
        input[0].to_i.times{
            item_price << gets.to_i
        }

        item_price.sort!

        obj = Search.new
        obj.setTarget(item_price)

        input[1].to_i.times{
            set_point = gets.to_i
            obj.setPoint(set_point)
            result = obj.getOptimumMax
            p result
        }
    end
end

class Search
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
        binary = BinarySearch.new
        binary.setTarget(@target)
        binary.setPoint(@set_point)

        before_max = binary.getLocalMax(0, 1, @target_size-1, 0)

        # for i=0; i < @target_size - 2; i++
        (@target_size - 2).times{|i|
            before_max = getLocalMax(i, before_max)

            if @max == @set_point
                return @max
            end

            if i >= (before_max - 1)
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

class BinarySearch
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

    def getLocalMax(i, forward, backward, depth)
        middle = (forward + backward)/2
        middle.to_i

        sum = @target[i] + @target[middle]

        # 終了条件
        # 再帰終わり
        if (forward == backward || depth > 20)
            if sum >= @set_point
                return middle
            else
                return backward
            end
        end

        # 再帰処理
        if (sum > @set_point)
            depth = depth + 1
            return getLocalMax(i, forward, middle-1, depth)
        else
            depth = depth + 1
            @max = sum
            return getLocalMax(i, middle+1, backward, depth)
        end
    end
end

RockStar.new.main()
