class QR < Solution
  def initialize matrix, e = 0.01
    @e = e
    @A = Matrix.new @matrix
  end
end
