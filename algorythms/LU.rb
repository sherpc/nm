class LU < Solution
  attr_reader :lu_m, :answer
  alias lu_matrix lu_m

  def new_matrix
    Array.new(@n+1) { Array.new(@n+1) }
  end

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
  
  def sum_lu(a,b)
    (0..@i-1).reduce(0) { |s,k| s + @lu_m[a][k] * @lu_m[k][b] }
  end

  def unit_vector(e)
    Array.new(@n+1) { |i| i == e ? 1 : 0 }
  end

  def invert
    @inv_m = new_matrix
    for i in 0..@n
      solve(unit_vector i)
      (0..@n).each { |j| @inv_m[j][i] = @answer[j] }
    end
  end

  def det
    decompose if @lu_m.nil?
    @det unless @det.nil?
    @det = (0..@n).reduce(1) { |mul,i| mul * @lu_m[i][i] }
  end

  def invertible_matrix
    invert if @inv_m.nil?
    @inv_m
  end

  # b -- free values colum
  def solve(vector)
    @b = vector
    decompose if @lu_m.nil?
    eval_z
    eval_answer
  end

  def eval_z
    @z = Array.new(@lu_m.length)
    for i in 0..@n
      @z[i] = @b[i] - (0..i-1).reduce(0) { |s,j| s + @lu_m[i][j] * @z[j] }
    end
  end

  def eval_answer
    @answer = Array.new(@z.length)
    for i in @n.downto(0)
      @answer[i] = (@z[i] - (i+1..@n).reduce(0) { |s,j| s + @lu_m[i][j]*@answer[j] }) / @lu_m[i][i]
    end
  end
end

