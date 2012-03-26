require "./main.rb"
require "rspec"

describe Lab1 do
  it 'solve' do
    Lab1.Gauss([[1,2,3],[4,5,6]]).should eq [-1, 2]
  end
end
