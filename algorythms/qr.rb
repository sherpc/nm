class QR < Solution
  attr_reader :q, :r
  def initialize matrix, e = 0.01
    @e = e
    @A = Matrix.new matrix
  end

  def decompose
  end

  def sign i
    return 1 if @A[i][i] > 0
    return -1
  end

  def v(i)
    v = Array.new(@A.n)
    for j in (0...i)
      v[i] = 0
    end
    sum = Math.sum(i, @A.n) { |j| (@A[j][i]) ^ 2 }
    v[i] = @A[i][i] + sign(i) * Math.sqrt(sum)
    v
  end
end
