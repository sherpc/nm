require "test/unit"
require "./main"

class TestThomas < Test::Unit::TestCase
  def setup
    @m4 = [[-1, 2, -1], [8, 6, 10, 6], [-2, -2, -4], [6,3,8,5]]
  end

  def test_create
    m = Thomas.new @m4
    (0..3).each { |i| assert_equal m.matrix[i].length, 4 }
    assert_equal m.matrix[0], [0, -1, 2, -1]
    assert_equal m.n, 3
  end

  def do_P_Q_test(test_case)
    m = Thomas.new test_case[:data]
    m.direct
    assert_equal m.P.map { |x| x.round 4}, test_case[:P]
    assert_equal m.Q.map { |x| x.round 4}, test_case[:Q]
  end

  def test_direct_flow
    cases = [
      {data: @m4, P: [0.25, 0.3478, 0.374, 0], Q:[0.75, 0.6522, 0.626, 1] }
    ]
    cases.each { |test_case| do_P_Q_test test_case }
  end
end
