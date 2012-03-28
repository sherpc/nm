require "test/unit"
require "./main.rb"

class TestSolution < Test::Unit::TestCase
  def test_data_loading
    assert_equal(Data::THOMAS,Thomas.new.matrix)
  end

  def test_custom_data_loading
    data = [[1,2], [3,4]]
    assert_equal(LU.new(data).matrix, data)
  end
end

class TestLU < Test::Unit::TestCase
  MATRIX_2 = [[4,3], [6,3]]
  MATRIX_3 = [[10,1,1], [2,10,1], [2,2,10]]

  def test_immutable
    start = TestLU::MATRIX_2.to_s
    Solution.new(MATRIX_2)
    assert_equal(start,TestLU::MATRIX_2.to_s)
  end

  def do_lu_test(test_case)
    m = LU.new(test_case[:data])
    m.decompose
    assert_not_equal(m.matrix,m.lu_matrix)
    assert_equal(Solution.round(m.lu_matrix), test_case[:expected])
  end

  def test_lu_decompose
    test_cases = [
      {data: MATRIX_3, expected: [[10,1,1], [0.2,9.8,0.8], [0.2,0.18,9.65]]},
      {data: MATRIX_2, expected: [[4,3], [1.5, -1.5]]},
      {data: [[13, 7, 4], [7, 9, -3], [4, -3, 9]], expected: [[13, 7, 4], [0.54, 5.23, -5.15], [0.31, -0.99, 2.69]]}
    ]
    test_cases.each { |test_case| do_lu_test test_case }
  end

  def do_lu_solve_test(test_case)
    m = LU.new(test_case[:A_matrix])
    m.solve(test_case[:B_matrix])
    assert_equal(m.answer.map { |x| x.round 2 }, test_case[:expected])
  end

  def test_lu_solve
    test_cases = [
      {A_matrix: MATRIX_2, B_matrix: [4, 3], expected: [-0.5, 2]},
      {A_matrix: MATRIX_3, B_matrix: [12, 13, 14], expected: [1, 1, 1]},
      {A_matrix: Data::LU_A, B_matrix: Data::LU_B, expected: [9,-6,-6,-1]}
    ]
    test_cases.each { |test_case| do_lu_solve_test test_case }
  end

  def do_det_test(test_case)
    m = LU.new test_case[:data]
    assert_equal(m.det.round(2), test_case[:expected])
  end

  def test_det
    cases = [
      {data: MATRIX_2, expected: -6},
      {data: MATRIX_3, expected: 946},
      {data: Data::LU_A, expected: 1867}
    ]
    cases.each { |test_case| do_det_test test_case }
  end

  def do_invert_test(test_case)
    m = LU.new test_case[:data]
    assert_equal(Solution.round(m.invertible_matrix), test_case[:expected])
  end

  def test_invert
    cases = [
      {data: MATRIX_2, expected: [[-0.5, 0.5], [1, -0.67]]}
    ]
    cases.each { |test_case| do_invert_test test_case }
  end

  def test_unit_vector
    m = LU.new MATRIX_3
    assert_equal(m.unit_vector(0), [1, 0, 0])
    assert_equal(m.unit_vector(1), [0, 1, 0])
    assert_equal(m.unit_vector(2), [0, 0, 1])
  end
end
