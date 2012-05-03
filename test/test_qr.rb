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
end
