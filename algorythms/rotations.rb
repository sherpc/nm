class Rotations < Solution
  attr_reader :lambda, :x
  def initialize matrix, e = 0.01
    @e = e
    @A = [Matrix.new(matrix)]
    @k = 0
    @U = []
  end

  def rotate k=0
    @k = k
    self.u_current = rotation_matrix *max_non_diagonal
    self.a_next = u_current.transpose() * a_current * u_current
    if t(a_next) > @e
      rotate(k+1) 
    else
      #Fill lambda array
      @lambda = a_next.main_diagonal
      #Fill self vectors array
      @x = @U.reduce { |result, u| result * u }.transpose
    end
  end

  def t matrix
    Math.sqrt matrix.reduce(0) { |sum,i,j,x| sum + (i < j ? x*x : 0) }
  end

  def rotation_matrix i, j
    phi = Rotations.phi a_current[i][j], a_current[i][i], a_current[j][j]
    u = Matrix.unary a_current.n
    sin_phi, cos_phi = Math.sin(phi), Math.cos(phi)
    u[i][j], u[j][i] = -sin_phi, sin_phi
    u[i][i] = u[j][j] = cos_phi
    return u
  end

  def max_non_diagonal
    max = a_current[0][1].abs
    max_i, max_j = 0, 1
    a_current.each do |i, j, x|
        max, max_i, max_j = x.abs, i, j if i < j && x.abs > max
    end
    [max_i, max_j]
  end

  def self.phi a_i_j, a_i_i, a_j_j
    return Math::PI / 4 if a_i_i == a_j_j
    0.5 * Math.atan((2 * a_i_j) / (a_i_i - a_j_j))
  end

  def print_results
    puts "Rotations method. Start matrix:"
    print @A[0]
    puts "Lambdas (self-values):"
    p @lambda.map { |x| x.round 2 }
    puts "X (self-vectors):"
    print @x.round
  end

  private
  def u_current; @U[@k]; end
  def u_current= value; @U[@k] = value; end

  def a_current; @A[@k]; end
  def a_next; @A[@k+1]; end
  def a_next=(value); @A[@k+1] = value; end
end
