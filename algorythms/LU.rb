class LU < Solution
  def decompose
    @result = Array.new(@matrix.length) { Array.new(@matrix[0].length, 0) }
    n = @matrix.length - 1
    # U, L, i = 1..n
    for i in 0..n
      @i = i
      for j in i..n
        @result[i][j] = @matrix[i][j] - sum(i,j)
        @result[j+1][i] = (@matrix[j+1][i] - sum(j+1,i)) / @result[i][i] if j < n
      end
    end
    Solution.new(@result)
  end

  def sum(a,b)
    (0..@i-1).reduce(0) { |s,k| s + @result[a][k] * @result[k][b] }
  end
end

