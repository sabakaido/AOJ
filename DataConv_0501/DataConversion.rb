class DataConv
    @handler
    @enddata
    @state

    def initialize
        @state = 0
    end

    def main
        while input = gets
            input.chomp!
            if @state == 0
                # 終了条件
                if input.to_i == 0
                    exit
                end
                @inputdata = InputData.new

                @inputdata.initEndData(input)
            end

            if @state == 1
                # addConvHash
                input_array = input.split
                @inputdata.addConvertList(input_array[0], input_array[1])
            end

            if @state == 2
                @inputdata.initEndData(input)
            end

            if @state == 3
                print @inputdata.getConvertResult(input)
            end

            @state = @inputdata.tranState(input, @state)
        end
    end
end

class InputData
    @conv_list_end
    @conv_hash
    @enddata
    def initialize
        @enddata = EndData.new(0)
        @conv_hash = Hash.new
    end

    def initEndData(input)
        @enddata.init(input.to_i)
    end

    def tranState(input, state)
        if state == 0 or state == 2
            return state + 1
        end

        # 0になったら進める
        @enddata.decrementFlag

        if @enddata.getFlag == 0
            if state == 3
                print "\n"
                return 0
            end
            return state + 1
        end

        # そのまま
        return state
    end

    def addConvertList(before, after)
        @conv_hash[before] = after
    end

    def getConvertResult(before)
        if @conv_hash.has_key?(before)
            return @conv_hash[before]
        end
        return before
    end
end

class EndData
    @end_flag
    def initialize(flag)
        @end_flag = flag
    end

    def init(flag)
        @end_flag = flag
    end

    def decrementFlag
        @end_flag = @end_flag - 1
    end

    def getFlag
        return @end_flag
    end
end

DataConv.new.main
