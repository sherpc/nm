class Rotations < Solution
  attr_reader :lambda, :x
  def initialize matrix, e = 0.01
    @e = e
    @a = [Matrix.new(matrix)]
    @u = []
    @step = 0
    @lambda = []
    @x = [[]] * @a[0].n
  end

  def rotate step=0
    @step = step
    i, j = max_non_diagonal
    self.u_current = rotation_matrix i, j
    self.a_next = u_current.transpose() * a_current * u_current
    if t(a_next) > @e
      rotate(step+1) 
    else
      #Fill lambda array
      a_next.each { |i,j,x| @lambda[i] = x if i == j }
      calculate_x
    end
  end
  

  #Fill self vectors array
  def calculate_x
    @x = (0..@step).inject(Matrix.unary(@a[0].n)) { |m,i| m * @u[i] }.transpose()
  end

  def t matrix
    sum = 0
    matrix.each { |i,j,x| sum += x * x if i < j }
    Math.sqrt sum
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

  private
  def u_current; @u[@step]; end
  def u_current= value; @u[@step] = value; end

  def a_current; @a[@step]; end
  def a_next; @a[@step+1]; end
  def a_next=(value); @a[@step+1] = value; end

end
