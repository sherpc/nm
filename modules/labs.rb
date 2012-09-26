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

  def self.l2_1n
    eval(IO.read(ARGV[1]))
    eq = Newton.new @f, @f1, @f2, 1.5, e
    puts eq.solution
  end

  def self.l2_1ei
    eval(IO.read(ARGV[1]))
    eq = NonlinearEI.new @f, 0.2, 1.4, e
    puts eq.solution
  end

  def self.l2_2n
    eval(IO.read(ARGV[1]))
    eq = NewtonSystem.new @f1, @f2, @f11, @f22, @f12, @f21, [2.4, 4.0], e
    puts eq.solution
  end

  def self.l2_2ei
    eval(IO.read(ARGV[1]))
    eq = NonlinearEISystem.new @f1, @f2, [2.4, 4.0], 0.7, e
    puts eq.solution
  end

  def self.l3_1l
    eval(IO.read(ARGV[1]))
    interpolation = LagrangeInterpolation.new @f, @xs
    puts interpolation.error(0.1)
  end

  def self.l3_1n
    eval(IO.read(ARGV[1]))
    interpolation = NewtonInterpolation.new @f, @xs
    puts interpolation.error(0.1)
  end

  def self.l3_2
    eval(IO.read(ARGV[1]))
    sp = Spline.new @x, @f
    sp.create
    puts sp[0.1]
  end

  def self.l3_3
    eval(IO.read(ARGV[1]))
    ls = LeastSquares.new @x, @y
    f_1 = ls.f_1
    f_2 = ls.f_2
    puts ls.error_1
    puts ls.error_2
  end

  def self.e
    (ARGV[2] || 0.001).to_f
  end
end
