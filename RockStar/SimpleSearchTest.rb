require 'test/unit'
require 'SimpleSearch.rb'

class TC_SimpleSearch < Test::Unit::TestCase
    def setup
        @obj = SimpleSearch.new
        target = [10,10,20,30,50]
        @obj.setTarget(target)
    end

    def test_point8
        @obj.setPoint(100)
        result = @obj.getOptimumMax
        assert_equal(result,80)
    end
end
