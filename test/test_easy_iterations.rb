require "test/unit"
require "./main.rb"

class TestEasyIterations < Test::Unit::TestCase
  def setup
    @m3 = [[10,1,1], [2,10,1], [2,2,10]]
    @m3_alt = [[0, -0.1, -0.1], [-0.2, 0, -0.1], [-0.2, -0.2, 0]]
    @m3_b = [12,13,14]
    @m2 = [[4, 3], [-6, 3]]
    @m2_alt = [[0, -0.75], [2, 0]]
    @m2_b = [4, 3]
    @m3_error = [[10,1,1], []]
  end

  def test_norm
    assert_equal Matrix.norm(@m3_alt), 0.4
    assert_equal Matrix.norm(@m3), 14
    assert_equal Matrix.norm(@m2), 9
    assert_equal Matrix.norm(@m2), 9
    assert_equal Matrix.norm([1,-4,3]), 4
  end

  def do_alternative_view_test(cases)
    cases.each do |c| 
      m = EasyIterations.new c[:matrix], c[:b_column]
      m.alternative_view
      assert_equal m.yakobi, c[:expected_a]
      assert_equal m.b, c[:expected_b]
    end
  end

  def test_alternative_view
    do_alternative_view_test [
      {matrix: @m3, b_column: @m3_b, expected_a: @m3_alt, expected_b: [1.2, 1.3, 1.4]},
      {matrix: @m2, b_column: @m2_b, expected_a: @m2_alt, expected_b: [1, 1]}
    ]
  end

  def test_can_solve?
    m = EasyIterations.new @m3, @m3_b
    assert m.can_solve?
    m = EasyIterations.new Data::ITERATIONS_A, Data::ITERATIONS_B, 0.01
    assert not(m.can_solve?)
  end

  def test_solve
    m = EasyIterations.new @m3, @m3_b
    assert_equal m.solve, 4
    m = EasyIterations.new @m3, @m3_b, 0.1
    assert_equal m.solve, 2
  end
end
