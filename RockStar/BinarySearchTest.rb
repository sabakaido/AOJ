require 'test/unit'
require 'BinarySearch.rb'

class TC_BinarySearch < Test::Unit::TestCase
    def setup
        @obj = BinarySearch.new
        target = [10,30,50,700,900,1100,1200,1500]
        @obj.setTarget(target)
    end

    def test_point8
        @obj.setPoint(80)
        result = @obj.getOptimumMax
        assert_equal(result,80)
    end

    def test_point13
        @obj.setPoint(130)
        result = @obj.getOptimumMax
        assert_equal(result,80)
    end

    def test_point7
        @obj.setPoint(760)
        result = @obj.getOptimumMax
        assert_equal(result,750)
    end

    def test_point0
        @obj.setPoint(5)
        result = @obj.getOptimumMax
        assert_equal(result,0)
    end

    def test_point0
        @obj.setPoint(3000)
        result = @obj.getOptimumMax
        assert_equal(result,2700)
    end
end
