require "./math"
require "./solution"
Dir[File.dirname(__FILE__) + '/modules/*.rb'].each {|file| require file }
Dir[File.dirname(__FILE__) + '/algorythms/*.rb'].each {|file| require file }
