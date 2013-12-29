class BinarySearch
    @max = 0
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
        i = 0
        while i < @target_size-1
            getLocalMax(i, i+1, @target_size-1)
            i = i + 1
            if @max == @set_point
                return @max
            end
        end
        return @max
    end

    def getLocalMax(i, forward, backward)
        middle = (forward + backward) / 2
        middle.to_i

        if (i == middle)
            return 0
        end

        sum = @target[i] + @target[middle]

        # 終了条件
        # 設定値ぴったり
        if (sum == @set_point)
            @max = sum
            return 0
        end

        # 終了条件
        # 再帰終わり
        if (forward == backward)
            if (@max <= sum && sum <= @set_point)
                @max = sum
                return 0
            else
                return 0
            end
        end

        # 再帰処理
        if (sum > @set_point)
            getLocalMax(i, forward, middle-1)
        else
            @max = sum
            getLocalMax(i, middle+1, backward)
        end
    end
end
