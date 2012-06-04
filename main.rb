require "./solution"
Dir[File.dirname(__FILE__) + '/modules/*.rb'].each {|file| require file }
Dir[File.dirname(__FILE__) + '/algorythms/*.rb'].each {|file| require file }

if __FILE__ == $0
  if ARGV[0] == "-a"
    Analyze.send "#{ARGV[1]}"
  else
    Labs.send "l#{ARGV[0]}"
  end
end
