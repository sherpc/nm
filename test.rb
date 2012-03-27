require "test/unit"
require "./main.rb"

class TestSolution < Test::Unit::TestCase
  def test_data_loading
    assert_equal(Data::LU,LU.new.matrix)
    assert_equal(Data::THOMAS,Thomas.new.matrix)
  end

  def test_custom_data_loading
    data = [[1,2], [3,4]]
    assert_equal(LU.new(data).matrix, data)
  end
end

class TestLU < Test::Unit::TestCase
  def do_lu_test(test_case)
    m = LU.new(test_case[:data])
    m.decompose!
    assert_equal(Solution.round(m.lu_matrix), test_case[:expected])
  end

  def test_lu_decompose
    test_cases = [
      {data: [[10,1,1], [2,10,1], [2,2,10]], expected: [[10,1,1], [0.2,9.8,0.8], [0.2,0.18,9.65]]},
      {data: [[4,3], [6,3]], expected: [[4,3], [1.5, -1.5]]},
      {data: [[13, 7, 4], [7, 9, -3], [4, -3, 9]], expected: [[13, 7, 4], [0.54, 5.23, -5.15], [0.31, -0.99, 2.69]]}
    ]
    test_cases.each { |test_case| do_lu_test test_case }
  end

  def do_lu_solve_test(test_case)
    m = LU.new(test_case[:A_matrix])
    m.solve(test_case[:B_matrix])
    assert_equal(m.answer, test_case[:expected])
  end

  def test_lu_solve
    test_cases = [
      {A_matrix: [[4,3], [6,3]], B_matrix: [4, 3], expected: [-0.5, 2]}
    ]
    test_cases.each { |test_case| do_lu_solve_test test_case }
  end
end
