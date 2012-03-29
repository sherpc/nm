require "test/unit"
require "./main.rb"

class TestRangeExtension < Test::Unit::TestCase
  
  def test_all_ranges_nil
    assert_equal [1..2, 4].all_ranges, nil
  end

  def test_all_ranges
    sum = 0
    [1..2, 4..5].all_ranges { |x| sum += x }
    assert_equal sum, 12
  end
end
