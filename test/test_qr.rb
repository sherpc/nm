require "test/unit"
require "./main.rb"

class TestQR < Test::Unit::TestCase
  def setup
    @a_2_2 = [[1,2], [2,4]]
    @m_2_2 = QR.new @a_2_2
    @a_3_3 = [[1,3,1], [1,1,4], [4,3,1]]
    @m_3_3 = QR.new @a_3_3
    @m_lab = QR.new Data::QR
  end

  def test_qr
    @m_3_3.decompose
    q = [[-0.24, 0.97, 0.11], [-0.24, 0.05, -0.97], [-0.94, -0.25, 0.22]]
    r = [[-4.24, -3.77, -2.12], [0, 2.19, 0.91], [0, 0, -3.56]]
    assert_equal q, @m_3_3.q
    assert_equal r, @m_3_3.r
  end

  def test_v_i
    assert_equal [5.24, 1, 4], @m_3_3.v(0)
    assert_equal [0, -2.48, -2.17], @m_3_3.v(0)
  end
end
