require "test/unit"
require "./main.rb"

class TestLU < Test::Unit::TestCase
  MATRIX_2 = [[4,3], [6,3]]
  MATRIX_3 = [[10,1,1], [2,10,1], [2,2,10]]
  MATRIX_TO_SWAP = [[3.0, 2.0, 1.0], [6.0, 4, 3], [5.0, 2, 4]]

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
      {data: [[13, 7, 4], [7, 9, -3], [4, -3, 9]], expected: [[13, 7, 4], [0.54, 5.23, -5.15], [0.31, -0.99, 2.69]]},
      {data: MATRIX_TO_SWAP, expected: [[3.0, 2.0, 1.0], [1.67, -1.33, 2.33], [2.0, 0, 1]]}
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
    assert_equal(Solution.round(m.invertible_matrix,3), test_case[:expected])
  end

  def test_invert
    cases = [
      {data: MATRIX_2, expected: [[-0.5, 0.5], [1, -0.667]]},
      {data: MATRIX_3, expected: [[0.104, -0.008, -0.01], [-0.019, 0.104, -0.008], [-0.017, -0.019, 0.104]]},
      {data: Data::LU_A, expected: 
        [[-0.393, -0.303, -0.102, -0.409],
         [0.05, 0.044, -0.077, -0.015],
         [-0.089, -0.186, -0.087, -0.156],
         [0.279, 0.192, -0.045, 0.325]]
      }
    ]
    cases.each { |test_case| do_invert_test test_case }
  end
  def test_unit_vector
    m = LU.new MATRIX_3
    assert_equal(m.unit_vector(0), [1, 0, 0])
    assert_equal(m.unit_vector(1), [0, 1, 0])
    assert_equal(m.unit_vector(2), [0, 0, 1])
  end

  def test_swap
    m = LU.new MATRIX_2
    m.swap(m.matrix,0,1)
    assert_equal m.matrix, [[6, 3], [4, 3]]
    m = LU.new MATRIX_3
    m.swap(m.matrix,0,2)
    assert_equal m.matrix, [[2,2,10], [2,10,1], [10,1,1]]
  end

  def test_check_first_non_zero()
    m = LU.new [[4, 3, 2.0], [0.0, 0.0, 4], [5.0, 1, 3]]
    result = [[4, 3, 2.0], [5.0, 1, 3], [0.0, 0.0, 4]]
    m.check_first_non_zero(m.matrix,1)
    assert_equal m.matrix, result
  end
end
