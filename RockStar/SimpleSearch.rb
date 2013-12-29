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
        i = 0
        before_max = @target_size-1
        while i < @target_size-1
            before_max = getLocalMax(i, before_max)
            if @max == @set_point
                return @max
            end

            if i == before_max-1
                return @max
            end
            i = i + 1
        end
        return @max
    end

    def getLocalMax(i, before_max)
        (before_max - i).times{|j|
            # 設定値を超える場合
            if (@target[i] + @target[before_max - j]) > @set_point
            # 超えない場合
            else
                @max = @target[i] + @target[before_max - j]
                return before_max - j
            end
        }
        return i + 1
    end
end
