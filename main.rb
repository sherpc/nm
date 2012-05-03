require "./solution"
Dir[File.dirname(__FILE__) + '/modules/*.rb'].each {|file| require file }
Dir[File.dirname(__FILE__) + '/algorythms/*.rb'].each {|file| require file }

module Lab_1
  def self.l1
    m = LU.new(Matrix.from_file ARGV[1])
    m.invert
    m.solve(Matrix.from_file ARGV[2])
    m.print_results
  end

  def self.l2 
    m = Thomas.new(Matrix.from_file ARGV[1])
    m.solve
    m.print_results
  end

  def self.l4
    m = Rotations.new(Matrix.from_file ARGV[1])
    m.rotate
    m.print_results
  end
end

Lab_1.send "l#{ARGV[0]}"
