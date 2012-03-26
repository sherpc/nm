 require "test/unit"
 require "./main.rb"

 class TestSolution < Test::Unit::TestCase
  def test_data_loading
    assert_equal(Data::LU,LU.new.matrix)
    assert_equal(Data::THOMAS,Thomas.new.matrix)
  end
 end
