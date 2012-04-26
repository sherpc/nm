class LU < Solution
  attr_reader :lu_m, :answer
  alias lu_matrix lu_m

  # LU decomposition
  def decompose
    return unless @lu_m.nil?
    @lu_m = new_matrix
    # U, L, i = 1..n
    for i in 0..@n
      @i = i
      for j in i..@n
        @lu_m[i][j] = @matrix[i][j] - sum_lu(i,j)
        @lu_m[j+1][i] = (@matrix[j+1][i] - sum_lu(j+1,i)) / @lu_m[i][i] if j < @n
      end
    end
  end
  
  def swap(matrix,x, y)
    temp = matrix[x]
    matrix[x] = matrix[y]
    matrix[y] = temp
  end

  def sum_lu(a,b)
    Math.sum(0,@i-1) { |k| @lu_m[a][k] * @lu_m[k][b] }
  end

  # Solving SoLE
  # b -- free values colum
  def solve(vector)
    @b = vector
    decompose if @lu_m.nil?
    eval_z
    eval_answer
  end

  def eval_z
    @z = Array.new(@lu_m.length)
    (0..@n).each { |i| z i }
  end

  def z i
    @z[i] = @b[i] - Math.sum(0,i-1) { |j| @lu_m[i][j] * @z[j] }
  end

  def eval_answer
    @answer = Array.new(@z.length)
    @n.downto(0) { |i| x i }
  end

  def x i
    @answer[i] = (@z[i] - Math.sum(i+1,@n) { |j| @lu_m[i][j] * @answer[j] }) / @lu_m[i][i]
  end

  # Invertible matrix
  def invertible_matrix
    invert if @inv_m.nil?
    @inv_m
  end

  def invert
    @inv_m = new_matrix
    for i in 0..@n
      solve(unit_vector i)
      (0..@n).each { |j| @inv_m[j][i] = @answer[j] }
    end
  end

  def unit_vector(e)
    Array.new(@n+1) { |i| i == e ? 1 : 0 }
  end
  
  # Determinant
  def det
    decompose if @lu_m.nil?
    @det unless @det.nil?
    @det = Math.mul(0,@n) { |i| @lu_m[i][i] }
  end

end

