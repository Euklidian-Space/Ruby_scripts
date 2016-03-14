require 'minitest/autorun'
require 'ParityOutlier'

class TestParityOutlier < Minitest::Test
  
  def test_for_outlier
    assert_equal 1, find_outlier([0,1,2])
    assert_equal 2, find_outlier([1,2,3])
    assert_equal 3, find_outlier([2,6,8,10,3])
    assert_equal 11, find_outlier([2, 4, 0, 100, 4, 11, 2602, 36])
    assert_equal 160, find_outlier([160, 3, 1719, 19, 11, 13, -21])
  end
  
end