class LU < Solution
  def decompose
    @lu_m = Array.new(@matrix)
    n = @matrix.length - 1
    # U, L, i = 1..n
    for i in 0..n
      @i = i
      for j in i..n
        @lu_m[i][j] = @matrix[i][j] - sum(i,j)
        @lu_m[j+1][i] = (@matrix[j+1][i] - sum(j+1,i)) / @lu_m[i][i] if j < n
      end
    end
    Solution.new(@lu_m)
  end

  def sum(a,b)
    (0..@i-1).reduce(0) { |s,k| s + @lu_m[a][k] * @lu_m[k][b] }
  end
end

