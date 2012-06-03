module Labs
  def self.l1_1
    m = LU.new(Matrix.from_file ARGV[1])
    m.invert
    m.solve(Matrix.from_file ARGV[2])
    m.print_results
  end

  def self.l1_2 
    m = Thomas.new(Matrix.from_file ARGV[1])
    m.solve
    m.print_results
  end

  def self.l1_3
    m = EasyIterations.new(Matrix.from_file(ARGV[1]), Matrix.from_file(ARGV[2]))
    m.print_results
  end

  def self.l1_3z
    m = Zeidel.new(Matrix.from_file(ARGV[1]), Matrix.from_file(ARGV[2]))
    m.print_results
  end

  def self.l1_4
    m = Rotations.new(Matrix.from_file ARGV[1])
    m.rotate
    m.print_results
  end
end
