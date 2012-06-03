class LU < Solution
  attr_reader :lu_m, :answer
  alias lu_matrix lu_m

  # LU decomposition
  def decompose
    return unless @lu_m.nil?
    @p = 0
    @lu_m = Matrix.new @matrix
    # U, L, i = 1..n
    for step in 0..n
      check_max @lu_m, step
      gauss_step step
    end
  end

  def gauss_step(step)
    for i in step+1..n
      coefficient = @lu_m[i][step] / @lu_m[step][step]
      #Fill L matrix part
      @lu_m[i][step] = coefficient
      #Fill U matrix part
      (step+1..n).each { |j| @lu_m[i][j] -= @lu_m[step][j] * coefficient }
    end
  end
  
  def check_max(matrix, step)
    first_non_zero = step + matrix.drop(step).find_index { |row| row[step] != 0 }
    #p "first_non_zero: #{first_non_zero}, max_i: #{max_i}"
    swap(matrix, step, first_non_zero)
  end

  def swap(matrix, x, y)
    return if x == y
    @p += 1
    temp = matrix[x]
    matrix[x] = matrix[y]
    matrix[y] = temp
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
    Matrix.new @inv_m
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
    @det = ((-1) ** @p) * Math.mul(0,@n) { |i| @lu_m[i][i] }
  end

  def print_results
    puts "Lab 1.1, LU decomposition. Start matrix:"
    print Matrix.new(@matrix)
    puts "LU matrix:"
    print @lu_m.round
    print "Free values vector:\n"
    p @b
    print "Solution:\n"
    p @answer
    print "Determinant:\n"
    p det
    print "Inverse matrix:\n"
    print @inv_m.round

    lu_m = Matrix.new @lu_m
    l = lu_m.map do |i,j,x|
      if i == j
        1
      else
        i > j ? x : 0
      end
    end
    print "L:\n"
    print l
    u = lu_m.map do |i,j,x|
      i <= j ? x : 0
    end
    print "U:\n"
    print u
    lu = l * u
    print "L * U:\n"
    print lu
  end
end

