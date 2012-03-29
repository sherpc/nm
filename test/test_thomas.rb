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
      {data: @m4, P: [0.25, 0.3478, 0.374, 0], Q:[0.75, 0.6522, 0.626, 1] },
      {data: Data::THOMAS, P: [0.1, -0.0658, 0.366, 0.3825, -0.0], Q: [1.6, -6.3947, -3.8042, -2.5576, -9.0]}
    ]
    cases.each { |test_case| do_P_Q_test test_case }
  end

  def do_solve_test(test_case)
    m = Thomas.new test_case[:data]
    m.solve
    assert_equal m.answer.map { |x| x.round 2 }, test_case[:answer]
  end

  def test_solve
    cases = [
      {data: @m4, answer: [1, 1, 1, 1]},
      {data: Data::THOMAS, answer: [1, -6, -6, -6, -9]}
    ]
    cases.each { |test_case| do_solve_test test_case }
  end

end
