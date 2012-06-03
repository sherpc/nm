require "test/unit"
require "./main.rb"

class TestNonlinerEI < Test::Unit::TestCase
  def setup
    @f = ->(x) { (2 * x + 1) ** 0.25 }
  end

  def test_process
    equatation = NonlinearEI.new @f, 0.2, 1.4
    assert_equal 1.3961944237683348, equatation.solution
    equatation.accuracy = 0.0000001
    assert_equal 1.3953370277870056, equatation.solution
    equatation.accuracy = 0.1
    assert_equal 1.3961944237683348, equatation.solution
  end
end
