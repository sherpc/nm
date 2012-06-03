require "./solution"
Dir[File.dirname(__FILE__) + '/modules/*.rb'].each {|file| require file }
Dir[File.dirname(__FILE__) + '/algorythms/*.rb'].each {|file| require file }

if __FILE__ == $0
  Analyze.least_squares
  exit
  Labs.send "l#{ARGV[0]}"
end
