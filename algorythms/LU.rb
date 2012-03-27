class LU < Solution
  def decompose
    @result = Array.new(@matrix.length) { Array.new(@matrix[0].length, 0) }
    n = @matrix.length - 1
    # U, i = 0
    for j in 0..n
      @result[0][j] = @matrix[0][j]
    end
    # L, j = 0
    for i in 1..n
      @result[i][0] = @matrix[i][0] / @result[0][0]
    end
    # U, L, i = 1..n
    for i in 1..n
      @i = i
      for j in i..n
        @result[i][j] = @matrix[i][j] - sum(i,j)
      end
      for j in i+1..n
        @result[j][i] = (@matrix[j][i] - sum(j,i)) / @result[i][i]
      end
    end
    Solution.new(@result)
  end

  def sum(a,b)
    (0..@i-1).reduce(0) { |s,k| s + @result[a][k] * @result[k][b] }
  end
end

